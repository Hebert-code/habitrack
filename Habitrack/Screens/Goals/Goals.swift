import SwiftUI

struct Goals: View {
    
    @StateObject var controllerGoal = GoalListViewModel()
    
    @State private var metasConcluidas: Int = 3
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        // Resumo de Metas
                        HStack {
                            VStack {
                                Text("Total de Metas")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Text("\(controllerGoal.goals.count)")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("Concluídas")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Text("\(metasConcluidas)")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        // Cabeçalho
                        HStack {
                            Text("Seus Progressos")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                // Ação do filtro
                            }) {
                                Text("Filtrar")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal)
                        
                        ForEach(controllerGoal.goals) { goal in
                            NavigationLink(destination: GoalDetailView(goal: goal)) {
                                MetaRowView(metas: goal)
                            }
                            .padding(.horizontal)
                        }

                        // Botão para Adicionar Meta
                        NavigationLink(destination: AddGoalView()) {
                            Text("Adicionar Meta")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: 44)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue) // Cor de fundo azul
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                    }
                    .padding(.top)
                }
                .background(Color(UIColor.systemGroupedBackground)) // Fundo mais suave
            }
            .navigationBarTitle("Metas", displayMode: .inline)
        }
        .onAppear {
            controllerGoal.fetchGoals()
        }
    }
}

struct MetaRowView: View {
    var metas: Goal
    
    var body: some View {
        HStack {
            Image(systemName: iconForCategory(metas.categoria)) // Exibe o ícone baseado na categoria
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(metas.nomeGoal) // Exibe o nome da meta
                    .font(.headline)
                Text(metas.categoria) // Exibe a categoria da meta
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Estilo de fundo
        .cornerRadius(10) // Cantos arredondados
        .padding(.vertical, 5) // Espaço vertical entre as linhas
    }
    
    // Função para determinar o ícone baseado na categoria
    private func iconForCategory(_ category: String) -> String {
        switch category {
        case "Saúde":
            return "heart.fill" // Ícone para saúde
        case "Educação":
            return "book.fill" // Ícone para educação
        case "Fitness":
            return "figure.walk" // Ícone para fitness
        case "Carreira":
            return "briefcase.fill" // Ícone para carreira
        default:
            return "questionmark.circle" // Ícone padrão
        }
    }
}

#Preview {
    Goals()
}
