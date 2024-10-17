import SwiftUI

struct AddGoalView: View {
    @StateObject private var viewModel = GoalListViewModel()
    @State private var nomeGoal = ""
    @State private var descricao = ""
    @State private var categoria = "Saúde"
    @State private var dataInicio = Date()
    @State private var dataTermino = Date()
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Detalhes da Meta").font(.headline)) {
                        HStack {
                            Image(systemName: "pencil")
                                .foregroundColor(.blue)
                            TextField("Nome do Goal", text: $nomeGoal)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack {
                            Image(systemName: "note.text")
                                .foregroundColor(.blue)
                            TextField("Descrição", text: $descricao)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack {
                            Image(systemName: "star")
                                .foregroundColor(.blue)
                            Picker("Categoria", selection: $categoria) {
                                Text("Saúde").tag("Saúde")
                                Text("Carreira").tag("Carreira")
                                Text("Educação").tag("Educação")
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)
                                .datePickerStyle(DefaultDatePickerStyle())
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }

                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .foregroundColor(.blue)
                            DatePicker("Data de Término", selection: $dataTermino, displayedComponents: .date)
                                .datePickerStyle(DefaultDatePickerStyle())
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }

                    Section {
                        Button(action: {
<<<<<<< HEAD
                            if nomeGoal.isEmpty {
                                alertMessage = "O nome da meta não pode estar vazio."
                                showAlert = true
                            } else {
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
                                alertMessage = "Meta salva com sucesso!"
                                showAlert = true
                                nomeGoal = "" // Limpa o campo após salvar
                                descricao = ""
                            }
=======
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd"
                            viewModel.insertGoal(
                                nomeGoal: nomeGoal,
                                descricao: descricao,
                                categoria: categoria,
                                dataInicio: formatter.string(from: dataInicio),
                                dataTermino: formatter.string(from: dataTermino),
                                type: "goal",
                                progresso: 0
                            )
>>>>>>> main
                        }) {
                            Text("Salvar Meta")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(10)
                        }
                    }
                }
                .navigationBarTitle("Adicionar Metas", displayMode: .inline)
                .background(Color(UIColor.systemGroupedBackground))
                .cornerRadius(10)
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Atenção"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

#Preview {
    AddGoalView()
}
