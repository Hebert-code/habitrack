import SwiftUI

struct NewHabit: View {
    @StateObject private var viewModel = NewHabitViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nome do Hábito")) {
                    TextField("Insira o nome do hábito", text: $viewModel.habit.nomeHabito)
                }

                Section(header: Text("Descrição")) {
                    TextField("Descreva seu hábito", text: $viewModel.habit.descricaoHabito)
                }

                Section(header: Text("Frequência")) {
                    Picker("Frequência", selection: $viewModel.habit.frequencia) {
                        ForEach(viewModel.frequencias, id: \.self) { freq in
                            Text(freq)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                DatePicker("Data de Início", selection: $viewModel.habit.dataInicio, displayedComponents: .date)

                Section(header: Text("Meta Correspondente")) {
                    Picker("Meta", selection: $viewModel.habit.metaSelecionada) {
                        ForEach(viewModel.metas, id: \.self) { meta in
                            Text(meta)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Configurações de Lembrete")) {
                    Toggle(isOn: $viewModel.habit.habilitarLembretes) {
                        Text("Habilitar lembretes")
                    }

                    if viewModel.habit.habilitarLembretes {
                        Picker("Frequência", selection: $viewModel.habit.frequenciaLembrete) {
                            ForEach(viewModel.frequenciasLembrete, id: \.self) { freq in
                                Text(freq)
                            }
                        }
                    }
                }

                Button(action: {
                    viewModel.salvarHabito()
                }) {
                    Text("Salvar Hábito")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(8)
            }
            .navigationBarTitle("Novo Hábito", displayMode: .inline)
        }
    }
}

#Preview {
    NewHabit()
}
