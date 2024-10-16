//
//  Conquista.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct Achievements: View {
    // Variável de estado para a seleção da data
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            VStack {
               // Text("Hábitos e Metas")
                //    .font(.largeTitle)
                 //   .padding()

                // DatePicker para selecionar a data
                DatePicker("Escolha uma data", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden() // Oculta o rótulo
                    .padding()

                // Botão de histórico, passando a data selecionada para a próxima view
                NavigationLink(destination: HistoricoView(selectedDate: selectedDate)) {
                    Text("Ver Histórico")
                        .font(.headline)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Histórico", displayMode: .inline)
        }
    }
}

struct HistoricoView: View {
    @Environment(\.dismiss) var dismiss

    // Recebe a data selecionada
    let selectedDate: Date

    // Formatação da data
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: selectedDate)
    }

    var body: some View {
        VStack {
            // Exibe a data no lugar do título "Histórico de Metas"
            Text("\(formattedDate)")
                .font(.largeTitle)
                .padding()

            List {
                // Seção para Metas Concluídas e Não Concluídas
                Section(header: Text("Metas Concluídas")) {
                    Text("Meta 1 - Correr uma maratona")
                }
                Section(header: Text("Metas Não Concluídas")) {
                    Text("Meta 3 - Ir para entrevista de emprego")
                }
                
                // Seção para Hábitos Concluídos e Não Concluídos
                Section(header: Text("Hábitos Concluídos")) {
                    Text("Hábito 1 - Meditação")
                }
                Section(header: Text("Hábitos Não Concluídos")) {
                    Text("Hábito 2 - Programar 30 minutos")
                }
            }

            // Botão para voltar à tela anterior
            Button(action: {
                dismiss()
            }) {
                Text("Voltar")
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("Histórico", displayMode: .inline)
    }
}


#Preview {
    Achievements()
}
