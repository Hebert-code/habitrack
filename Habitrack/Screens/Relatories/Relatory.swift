import SwiftUI
import Charts // Biblioteca SwiftUI Charts para gráficos dinâmicos

struct Relatory: View {
    @StateObject var controllerGoal = GoalListViewModel() // Para gerenciar os dados das metas
    @StateObject var controllerHabit = HabitListViewModel() // Para gerenciar os dados dos hábitos
    
    @State private var totalMetasAlcancadas = 0
    @State private var progressoMedio: Double = 0.0
    @State private var performancePorCategoria: [(String, Int)] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Resumo Geral
                Text("Resumo Geral")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        SummaryCard(title: "Total de metas alcançadas", value: "\(totalMetasAlcancadas)")
                        SummaryCard(title: "Progresso médio", value: "\(Int(progressoMedio * 100))%")
                        SummaryCard(title: "Área em destaque", value: "Metas")
                    }
                    .padding(.horizontal)
                }
                
                // Botão Baixar Relatório
                Button(action: {
                    // Ação para baixar o relatório
                }) {
                    Text("Baixar relatório")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // Gráfico de barras dinâmico
                BarChartView(data: performancePorCategoria)
                    .frame(height: 200)
                    .padding(.horizontal)
                
                // Tendências
                Text("Tendências")
                    .font(.headline)
                    .padding(.horizontal)
                
                Text("Você tende a cumprir mais hábitos aos sábados e domingos!")
                    .font(.subheadline)
                    .padding(.horizontal)
                
                // Desempenho por Categoria
                Text("Desempenho por Categoria")
                    .font(.headline)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(performancePorCategoria, id: \.0) { category, percentage in
                        PerformanceRow(category: category, percentage: percentage)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .onAppear {
                calcularRelatorio()
            }
        }
        .navigationBarTitle("Relatórios", displayMode: .inline)
    }
    
    // Função para calcular os dados do relatório
    func calcularRelatorio() {
        let metas = controllerGoal.goals
        let habitos = controllerHabit.habits
        
        // Total de metas alcançadas
        totalMetasAlcancadas = metas.filter { $0.type == "concluida" }.count
        
        // Cálculo do progresso médio
        let progressoTotal = habitos.map { $0.habilitarLembretes ? 1.0 : 0.0 }.reduce(0, +)
        progressoMedio = habitos.isEmpty ? 0.0 : progressoTotal / Double(habitos.count)
        
        // Desempenho por categoria
        let categorias = Dictionary(grouping: metas, by: { $0.categoria })
        performancePorCategoria = categorias.map { categoria, metas in
            let progresso = metas.filter { $0.type == "concluida" }.count
            return (categoria, metas.isEmpty ? 0 : (progresso * 100) / metas.count)
        }
    }
}

// Componente de gráfico de barras
struct BarChartView: View {
    var data: [(String, Int)]
    
    var body: some View {
        Chart(data, id: \.0) { item in
            BarMark(
                x: .value("Categoria", item.0),
                y: .value("Progresso", item.1)
            )
            .foregroundStyle(by: .value("Categoria", item.0))
        }
        .chartLegend(.hidden)
        .frame(height: 200)
    }
}

// Componentes

struct SummaryCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.title)
                .bold()
        }
        .frame(width: 120, height: 80)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

struct PerformanceRow: View {
    var category: String
    var percentage: Int
    
    var body: some View {
        HStack {
            Text("\(category):")
                .font(.subheadline)
            Spacer()
            Text("\(percentage)% cumprido")
                .font(.subheadline)
        }
    }
}

#Preview {
    Relatory()
}
