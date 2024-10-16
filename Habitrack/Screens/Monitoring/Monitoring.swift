//
//  Acompanhamento.swift
//  Habitrack
///Users/student14/Desktop/Habitrack/Habitrack/Screens/Relatories
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct Monitoring: View {
    @State private var habitos: [Habito] = [
        Habito(nome: "Exercício", duracao: "30 minutos", concluido: true),
        Habito(nome: "Meditação", duracao: "10 minutos", concluido: true),
        Habito(nome: "Beber Água", duracao: "2 Litros", concluido: false),
        Habito(nome: "Leitura", duracao: "30 minutos", concluido: false)
    ]
    
    @State private var progressoDoDia: Float = 63
    @State private var habitosCumpridos: Int = 5
    @State private var totalHabitos: Int = 8
    @State private var notificacoesPendentes: [String] = [
        "Lembre-se de beber Água",
        "Você ainda não leu hoje. Que tal 15 minutos?"
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Seção de Hábitos
                    Text("Hábitos")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(habitos) { habito in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habito.nome)
                                    .font(.headline)
                                Text(habito.duracao)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if habito.concluido {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                                    .padding(.trailing)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    
                    // Progresso do Dia
                    Text("Progresso do Dia")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    
                    HStack {
                        Text("\(habitosCumpridos)/\(totalHabitos) hábitos cumpridos")
                        Spacer()
                        Text("\(Int(progressoDoDia))%")
                    }
                    .padding(.horizontal)
                    
                    ProgressView(value: progressoDoDia / 100)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding(.horizontal)
                    
                    // Notificações Pendentes
                    Text("Notificações Pendentes")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(notificacoesPendentes, id: \.self) { notificacao in
                        Text(notificacao)
                            .font(.subheadline)
                            .padding(.horizontal)
                    }
                    
                }
                .padding(.top)
            }
        }
        .navigationBarTitle("Acompanhamento", displayMode: .inline)
    }
}

struct Habito: Identifiable {
    let id = UUID()
    let nome: String
    let duracao: String
    let concluido: Bool
}

struct test: View {
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
            
            Achievements()
                .tabItem {
                    Label("Hábitos", systemImage: "checkmark.circle")
                }
        }
    }
}



#Preview {
    Monitoring()
}
