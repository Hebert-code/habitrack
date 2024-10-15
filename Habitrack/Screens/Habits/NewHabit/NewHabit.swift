import SwiftUI

struct NewHabitView: View {
    @StateObject private var viewModel = HabitListViewModel()
    @State private var nomeHabito: String = ""
    @State private var descricaoHabito: String = ""
    @State private var frequencia: String = "Diário"
    @State private var dataInicio = Date()
    @State private var metaSelecionada: String = "Meta 1"
    @State private var habilitarLembretes: Bool = false
    @State private var frequenciaLembrete: String = "Diário"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nome do Hábito")) {
                    TextField("Insira o nome do hábito", text: $nomeHabito)
                }

                Section(header: Text("Descrição")) {
                    TextField("Descreva seu hábito", text: $descricaoHabito)
                }

                Section(header: Text("Frequência")) {
                    Picker("Frequência", selection: $frequencia) {
                        ForEach(viewModel.frequencias, id: \.self) { freq in
                            Text(freq)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }

                DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)

                Section(header: Text("Meta Correspondente")) {
                    Picker("Meta", selection: $metaSelecionada) {
                        ForEach(viewModel.metas, id: \.self) { meta in
                            Text(meta)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }

                Section(header: Text("Configurações de Lembrete")) {
                    Toggle(isOn: $habilitarLembretes) {
                        Text("Habilitar lembretes")
                    }
                    .padding(.horizontal)
                    
                    if habilitarLembretes {
                        Picker("Frequência", selection: $frequenciaLembrete) {
                            ForEach(viewModel.frequenciasLembrete, id: \.self) { freq in
                                Text(freq)
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                Button(action: {
                    enviarHabit()
                }) {
                    Text("Salvar Hábito")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.top)
            }
            .navigationTitle("Novo Hábito")
        }
        .navigationBarTitle("Novo Hábito", displayMode: .inline)
    }

    func salvarHabito() {
        // Lógica para salvar o hábito
        print("Hábito salvo!")
    }

    private func enviarHabit() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter.string(from: dataInicio)
        
        viewModel.insertHabit(
            nomeHabito: nomeHabito,
            descricaoHabito: descricaoHabito,
            frequencia: frequencia,
            dataInicio: formattedDate,
            metaSelecionada: metaSelecionada,
            habilitarLembretes: habilitarLembretes,
            frequenciaLembrete: frequenciaLembrete
        )
    }
}

#Preview {
    NewHabitView()
}
