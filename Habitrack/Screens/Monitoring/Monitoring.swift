import SwiftUI

struct Monitoring: View {
    @StateObject var controllerHabit = HabitListViewModel() // Usando o HabitListViewModel

    @State private var progressoDoDia: Float = 0.0
    @State private var habitosCumpridos: Int = 0
    
    var body: some View {
        VStack {
            // Título centralizado no topo
            Text("Acompanhamento")
                .font(.headline)
                .bold()
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .center)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Seção de Hábitos
                    Text("Hábitos")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    // Listagem dos hábitos a partir do controllerHabit
                    ForEach(controllerHabit.habits, id: \.id) { habito in // Usar o id: \.id
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habito.nomeHabito)
                                    .font(.headline)
                                Text(habito.descricaoHabito)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if habito.habilitarLembretes {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                                    .padding(.trailing)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    
                    // Progresso do Dia
                    Text("Progresso do Dia")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    
                    HStack {
                        Text("\(habitosCumpridos)/\(controllerHabit.habits.count) hábitos cumpridos")
                        Spacer()
                        Text("\(Int(progressoDoDia))%")
                    }
                    .padding(.horizontal)
                    
                    ProgressView(value: progressoDoDia / 100)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding(.horizontal)
                    
                }
                .padding(.top)
            }
        }
        .onAppear {
            controllerHabit.fetchHabits()  // Carregar hábitos do banco
            updateProgresso()
        }
    }
    
    private func updateProgresso() {
        let total = Float(controllerHabit.habits.count)
        let cumpridos = Float(controllerHabit.habits.filter { $0.habilitarLembretes }.count)
        progressoDoDia = total > 0 ? (cumpridos / total) * 100 : 0 // Evitar divisão por zero
        habitosCumpridos = Int(cumpridos)
    }
}

#Preview {
   Monitoring()
}
