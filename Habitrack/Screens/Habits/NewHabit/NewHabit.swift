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
        Form {
            TextField("Nome do Hábito", text: $nomeHabito)
            TextField("Descrição", text: $descricaoHabito)
            
            Picker("Frequência", selection: $frequencia) {
                ForEach(["Diário", "Semanal", "Mensal"], id: \.self) { Text($0) }
            }
            
            DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)
            
            Picker("Teste", selection: $frequencia) {
                Text("Selecione")
                ForEach(controllerGoal.goals, id: \._id) {
                    Text($0.nomeGoal)
                }
            }
            
            Picker("Goal ", selection: $goalSelected) {
                
                Text("Selecione")
                
                
                
                
                // Just here for demonstration
            
                
            }
            
            //            VStack {
            //                ForEach(controllerGoal.goals, id: \.id) { goal in
            //                    print("Uma meta")
            //                    print(goal)
            //                    return Text(goal.nomeGoal).tag(goal.id as UUID?)
            //                }
            //            }
            
            
            Toggle("Habilitar Lembretes", isOn: $habilitarLembretes)
            if habilitarLembretes {
                Picker("Frequência do Lembrete", selection: $frequenciaLembrete) {
                    ForEach(["Diário", "Semanal", "Mensal"], id: \.self) { Text($0) }
                }
            }
            
            Button("Salvar Hábito") {
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
            }
        }
        .onAppear(){
            controllerGoal.fetchGoals()
        }
        .navigationTitle("Adicionar Hábito")
    }
}


#Preview {
    NewHabitView()
}
