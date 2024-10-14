import SwiftUI

struct NewHabit: View {
    @State private var nomeHabito: String = ""
    @State private var descricaoHabito: String = ""
    @State private var frequencia: String?;
    @State private var dataInicio: Date = Date()
    @State private var metaSelecionada: String?;
    @State private var habilitarLembretes: Bool = false
    @State private var frequenciaLembrete: String = ""

    @State var frequencias = ["Diário", "Semanal", "Mensal"]
    @State var metas = ["Meta 1", "Meta 2", "Meta 3"]
    @State var frequenciasLembrete = ["Diário", "Semanal", "Mensal"]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Campo Nome do Hábito
                    SimpleInput(
                        title: "Nome do Hábito",
                        placeholder: "Insira o nome do Hábito",
                        fieldName: $nomeHabito)

                    // Campo Descrição
                    SimpleInput(
                        title: "Descrição",
                        placeholder: "Descreva seu hábito",
                        fieldName: $descricaoHabito)

                    // Frequência (Segmented Picker)
                    OptionSelection(
                        title: "Frequência",
                        categoriaSelecionada: $frequencia,
                        categorias: $frequencias
                    )

                    // Data de Início
                    Text("Data de Início")
                        .font(.headline)
                    DatePicker("Selecione a data de início", selection: $dataInicio, displayedComponents: .date)
                        .padding(.horizontal)

                    // Meta Correspondente (Segmented Picker)
                    OptionSelection(
                        title: "Meta Correspondente",
                        categoriaSelecionada: $metaSelecionada,
                        categorias: $metas
                    )
            
                    // Configurações de Lembrete
                    Text("Configurações de Lembrete")
                        .font(.headline)

                    Toggle(isOn: $habilitarLembretes) {
                        Text("Habilitar lembretes")
                    }

                    if habilitarLembretes {
                        Picker("Frequência do Lembrete", selection: $frequenciaLembrete) {
                            ForEach(frequenciasLembrete, id: \.self) { freq in
                                Text(freq)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Botão Salvar Hábito
                    DefaultButton(
                        callback: salvarHabito,
                        title: "Salvar Hábito");
                    
                }
                .padding()
            }
        }
        .navigationBarTitle("Novo Hábito", displayMode: .inline)
    }

    func salvarHabito() {
        // Lógica para salvar o hábito
        print("Hábito salvo!")
    }
}

#Preview {
    NewHabit()
}
