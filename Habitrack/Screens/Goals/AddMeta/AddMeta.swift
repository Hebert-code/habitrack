import SwiftUI

struct AddGoalView: View {
    @StateObject private var viewModel = GoalListViewModel()
    @State private var nomeGoal = ""
    @State private var descricao = ""
    @State private var categoria = "Saúde"
    @State private var dataInicio = Date()
    @State private var dataTermino = Date()
    @State private var icone: String = ""
    @State private var progresso: Int = 0

    var body: some View {
        Form {
            TextField("Nome do Goal", text: $nomeGoal)
            TextField("Descrição", text: $descricao)
            Picker("Categoria", selection: $categoria) {
                Text("Saúde").tag("Saúde")
                Text("Carreira").tag("Carreira")
                Text("Educação").tag("Educação")
            }
            DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)
            DatePicker("Data de Término", selection: $dataTermino, displayedComponents: .date)
            
            Button("Salvar Goal") {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                viewModel.insertGoal(
                    nomeGoal: nomeGoal,
                    descricao: descricao,
                    categoria: categoria,
                    dataInicio: formatter.string(from: dataInicio),
                    dataTermino: formatter.string(from: dataTermino),
                    type: "goal"
                )
            }
        }
        .navigationTitle("Adicionar Goal")
    }
}

#Preview {
    AddGoalView()
}
