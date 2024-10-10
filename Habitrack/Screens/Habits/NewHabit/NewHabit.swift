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
    @State private var birthDate = Date.now

    var frequencias = ["Diário", "Semanal", "Mensal"]
    var metas = ["Meta 1", "Meta 2", "Meta 3"]
    var frequenciasLembrete = ["Diário", "Semanal", "Mensal"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nome do Hábito"))
                {
                    TextField("Insira o nome do hábito", text: $nomeHabito)
                }.foregroundColor(.black)
                    
                
                Section(header: Text("Descrição")) {
                    TextField("Descreva seu hábito", text: $descricaoHabito)
                }.foregroundColor(.black)

                Section(header: Text("Frequência")) {
                    Picker("Frequência", selection: $frequencia) {
                        ForEach(frequencias, id: \.self) { freq in
                            Text(freq)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.foregroundColor(.black)
               

                    DatePicker("Data de Início", selection: $dataInicio, displayedComponents: .date)
                

                Section(header: Text("Meta Correspondente")) {
                    Picker("Meta", selection: $metaSelecionada) {
                        ForEach(metas, id: \.self) { meta in
                            Text(meta)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.foregroundColor(.black)

                Section(header: Text("Configurações de Lembrete")) {
                    Toggle(isOn: $habilitarLembretes) {
                        Text("Habilitar lembretes")
                    }
                    
                    if habilitarLembretes {
                        Picker("Frequência", selection: $frequenciaLembrete) {
                            ForEach(frequenciasLembrete, id: \.self) { freq in
                                Text(freq)
                            }
                        }
                    }
                }.foregroundColor(.black)

                Button(action: salvarHabito) {
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

    func salvarHabito() {
        // Lógica para salvar o hábito
        print("Hábito salvo!")
    }
}

#Preview {
    NewHabit()
}
