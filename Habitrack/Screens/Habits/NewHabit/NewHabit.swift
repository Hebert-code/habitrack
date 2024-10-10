//
//  add_habito.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

    struct NewHabit: View {
        @State private var nomeHabito: String = ""
        @State private var descricaoHabito: String = ""
        @State private var frequencia: String = "Diário"
        @State private var dataInicio: Date = Date()
        @State private var metaSelecionada: String = "Meta 1"
        @State private var habilitarLembretes: Bool = false
        @State private var frequenciaLembrete: String = ""

        var frequencias = ["Diário", "Semanal", "Mensal"]
        var metas = ["Meta 1", "Meta 2", "Meta 3"]
        var frequenciasLembrete = ["Diário", "Semanal", "Mensal"]

        var body: some View {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Campo Nome do Hábito
                        Text("Nome do Hábito")
                            .font(.headline)
                        TextField("Insira o nome do hábito", text: $nomeHabito)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)

                        // Campo Descrição
                        Text("Descrição")
                            .font(.headline)
                        TextField("Descreva seu hábito", text: $descricaoHabito)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)

                        // Frequência (Segmented Picker)
                        Text("Frequência")
                            .font(.headline)
                        Picker("Frequência", selection: $frequencia) {
                            ForEach(frequencias, id: \.self) { freq in
                                Text(freq)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)

                        // Data de Início
                        Text("Data de Início")
                            .font(.headline)
                        DatePicker("Selecione a data de início", selection: $dataInicio, displayedComponents: .date)
                            .padding(.horizontal)

                        // Meta Correspondente (Segmented Picker)
                        Text("Meta Correspondente")
                            .font(.headline)
                        Picker("Meta", selection: $metaSelecionada) {
                            ForEach(metas, id: \.self) { meta in
                                Text(meta)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)

                        // Configurações de Lembrete
                        Text("Configurações de Lembrete")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Toggle(isOn: $habilitarLembretes) {
                            Text("Habilitar lembretes")
                        }
                        .padding(.horizontal)
                        
                        if habilitarLembretes {
                            Picker("Frequência do Lembrete", selection: $frequenciaLembrete) {
                                ForEach(frequenciasLembrete, id: \.self) { freq in
                                    Text(freq)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Botão Salvar Hábito
                        Button(action: salvarHabito) {
                            Text("Salvar Hábito")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }

                // TabView
                TabView {
                    Text("Painel")
                        .tabItem {
                            Label("Painel", systemImage: "house")
                        }

                    Text("Metas")
                        .tabItem {
                            Label("Metas", systemImage: "flag")
                        }

                    Text("Acompanhamento")
                        .tabItem {
                            Label("Acompanhamento", systemImage: "chart.bar")
                        }
                }
                .frame(height: 60) // Altura para a TabView
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
