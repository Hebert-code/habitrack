import SwiftUI

struct Habits: View {
    @StateObject var controllerHabit = HabitListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView { // O ScrollView deve ser o container principal
                VStack(alignment: .leading, spacing: 15) {
                    // Resumo de Hábitos
                    HStack {
                        VStack {
                            Text("Total de Hábitos")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text("\(controllerHabit.habits.count)")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("Concluídas")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text("\(controllerHabit.habits.filter { $0.habilitarLembretes }.count)")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Seus Hábitos")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    
                    NavigationLink(destination: NewHabitView()) {
                        Text("Adicionar Hábito")
                            .font(.headline)
                            .frame(width: 350, height: 50)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(15)
                    }
                    .padding(.top)
                    
                    // Lista de Hábitos
                    ForEach(controllerHabit.habits, id: \._id) { habit in
                        NavigationLink(destination: HabitDetailView(habit: habit)) {
                            HabitoItem(
                                nome: habit.nomeHabito,
                                duracao: habit.descricaoHabito,
                                progresso: habit.progressoH ?? 100)
                        }
                    }
                    .foregroundColor(.black)
                }
                .padding()
                .background(Color(UIColor.systemGroupedBackground))
            }
            .navigationBarTitle("Hábitos", displayMode: .inline)
        }
    }
}

struct HabitoItem: View {
    var nome: String
    var duracao: String
    var progresso: Int
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill") // Ícone para indicar o status do hábito
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(nome)
                    .font(.headline)
                Text(duracao)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(progresso)%")
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Estilo de fundo
        .cornerRadius(10) // Cantos arredondados
        .padding(.vertical, 5) // Espaço vertical entre as linhas
    }
}

#Preview {
    Habits()
}
