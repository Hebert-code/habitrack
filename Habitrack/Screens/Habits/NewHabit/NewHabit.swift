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
    
    @State private var showAlert = false // Alerta de sucesso
    @State private var showErrorAlert = false // Alerta para erro de meta
    @State private var showNameErrorAlert = false // Alerta para erro de nome

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nome").foregroundColor(.black)) {
                    TextField("Nome do Hábito", text: $nomeHabito)
                }
                
                Section(header: Text("Descrição").foregroundColor(.black)) {
                    TextField("Descrição", text: $descricaoHabito)
                }
                
                Section(header: Text("Detalhes").foregroundColor(.black)) {
                    Picker("Frequência", selection: $frequencia) {
                        ForEach(["Diário", "Semanal", "Mensal"], id: \.self) { Text($0) }
                    }
                    .padding(2)
                    
                    DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)
                        .padding(2)
                    
                    Picker("Meta", selection: $goalSelected) {
                        Text("Selecione").tag("Selecione") // Tag para a opção padrão
                        ForEach(controllerGoal.goals, id: \._id) {
                            Text($0.nomeGoal).tag($0.nomeGoal)
                        }
                    }
                    .padding(2)
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
                        // Verificar se o nome e a meta são válidos
                        if nomeHabito.isEmpty {
                            showNameErrorAlert = true // Exibir alerta de erro de nome
                        } else if goalSelected == "Selecione" {
                            showErrorAlert = true // Exibir alerta de erro de meta
                        } else {
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
                            
                            // Limpar todos os campos
                            nomeHabito = ""
                            descricaoHabito = ""
                            frequencia = "Diário"
                            dataInicio = Date()
                            goalSelected = "Selecione"
                            habilitarLembretes = false
                            frequenciaLembrete = "Diário"

                            // Exibir alerta de sucesso
                            showAlert = true
                        }
                    }) {
                        Text("Salvar Hábito")
                            .frame(width: 350, height: 44)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(15)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Sucesso"), message: Text("Hábito salvo com sucesso!"), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $showErrorAlert) {
                        Alert(title: Text("Erro"), message: Text("Por favor, selecione uma meta válida."), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $showNameErrorAlert) {
                        Alert(title: Text("Erro"), message: Text("O nome do hábito não pode estar em branco."), dismissButton: .default(Text("OK")))
                    }
                }
            }
            .navigationBarTitle("Adicionar Hábito", displayMode: .inline)
            .onAppear {
                controllerGoal.fetchGoals()
            }
        }
    }
}

#Preview {
    NewHabitView()
}
