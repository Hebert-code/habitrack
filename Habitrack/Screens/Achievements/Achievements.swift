//
//  Conquista.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI


struct Archievements: View {
    @State private var habitosCumpridos: Int = 45
    @State private var metasAlcancadas: Int = 3
    @State private var linhaDoTempo: [HistoricoDia] = [
        HistoricoDia(data: "08/10", habitos: [("Beber água", true), ("Ler", true), ("Meditar", false)]),
        HistoricoDia(data: "07/10", habitos: [("Beber água", true), ("Ler", true), ("Meditar", false)]),
        HistoricoDia(data: "06/10", habitos: [("Beber água", true), ("Ler", true), ("Meditar", false)]),
        HistoricoDia(data: "05/10", habitos: [("Beber água", true), ("Ler", true), ("Meditar", false)]),
        HistoricoDia(data: "04/10", habitos: [("Beber água", true), ("Ler", true), ("Meditar", false)]),
        // Adicionar mais dados conforme necessário...
    ]
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                // Seção de Resumo
                HStack {
                    VStack {
                        Text("Hábitos Cumpridos")
                            .font(.headline)
                        Text("\(habitosCumpridos)")
                            .font(.largeTitle)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("Metas Alcançadas")
                            .font(.headline)
                        Text("\(metasAlcancadas)")
                            .font(.largeTitle)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top)
                
                // Seção de Linha do Tempo
                Text("Linha do Tempo")
                    .font(.title2)
                    .bold()
                    .padding(.top)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(linhaDoTempo) { dia in
                        HStack {
                            Text(dia.data)
                                .bold()
                                .frame(width: 70, alignment: .leading)
                            ForEach(dia.habitos, id: \.0) { habito in
                                HStack(spacing: 5) {
                                    Text(habito.0)
                                    if habito.1 {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.green)
                                    } else {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.red)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle("Histórico", displayMode: .inline)
        .padding()
    }
}

struct HistoricoDia: Identifiable {
    let id = UUID()
    let data: String
    let habitos: [(String, Bool)] // Nome do hábito e se foi cumprido (true/false)
}

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Painel")
                .tabItem {
                    Label("Painel", systemImage: "house")
                }
            
            Goals()
                .tabItem {
                    Label("Metas", systemImage: "flag")
                }
            
            Monitoring()
                .tabItem {
                    Label("Hábitos", systemImage: "checkmark.circle")
                }
            
            Archievements()
                .tabItem {
                    Label("Histórico", systemImage: "clock")
                }
        }
    }
}


#Preview {
    Archievements()
}
