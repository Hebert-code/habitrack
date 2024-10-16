import SwiftUI

struct NewHabitView: View {
    @StateObject var controllerHabit = HabitListViewModel()
    @StateObject var controllerGoal = GoalListViewModel()
    
    @State private var nomeHabito = ""
    @State private var descricaoHabito = ""
    @State private var frequencia = "Diário"
    @State private var dataInicio = Date()
    @State private var goalSelected: String = "Selecione"
    @State private var habilitarLembretes = false
    @State private var frequenciaLembrete = "Diário"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes do Hábito")) {
                    TextField("Nome do Hábito", text: $nomeHabito)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Descrição", text: $descricaoHabito)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Picker("Frequência", selection: $frequencia) {
                        ForEach(["Diário", "Semanal", "Mensal"], id: \.self) { Text($0) }
                    }
                    
                    DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)
                    
                    Picker("Meta", selection: $goalSelected) {
                        Text("Selecione")
                        ForEach(controllerGoal.goals, id: \._id) {
                            Text($0.nomeGoal)
                        }
                    }
                }
                
                Section {
                    Toggle("Habilitar Lembretes", isOn: $habilitarLembretes)
                    
                    if habilitarLembretes {
                        Picker("Frequência do Lembrete", selection: $frequenciaLembrete) {
                            ForEach(["Diário", "Semanal", "Mensal"], id: \.self) { Text($0) }
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        controllerHabit.insertHabit(
                            nomeHabito: nomeHabito,
                            descricaoHabito: descricaoHabito,
                            frequencia: frequencia,
                            dataInicio: formatter.string(from: dataInicio),
                            goalID: nil,
                            habilitarLembretes: habilitarLembretes,
                            frequenciaLembrete: frequenciaLembrete,
                            type: "habit"
                        )
                    }) {
                        Text("Salvar Hábito")
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.top, 10)
                    }
                }
            }
            .navigationTitle("Adicionar Hábito")
            .onAppear {
                controllerGoal.fetchGoals()
            }
        }
    }
}

#Preview {
    NewHabitView()
}
