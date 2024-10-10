//
//  Habitos.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//


import SwiftUI

struct Habits: View {
    @State private var habitos: [(String, String, Double)] = [
        ("Exercício", "30 minutos", 0.5),
        ("Meditação", "10 minutos", 0.75)
    ]
    @State private var showingAddHabito = false
    
    var body: some View {
        NavigationView {
            TabView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Visão geral do hábito")
                        .font(.title2)
                        .padding(.top, 20)
                    
                    HStack {
                        VStack {
                            Text("Total de Metas")
                                .font(.subheadline)
                            Text("\(habitos.count)")
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("Concluídas")
                                .font(.subheadline)
                            Text("\(habitos.filter { $0.2 == 1.0 }.count)")
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    
                    Text("Lista de hábitos")
                        .font(.headline)
                    
                    VStack(spacing: 10) {
                        ForEach(habitos, id: \.0) { habito in
                            HabitoItem(nome: habito.0, duracao: habito.1, progresso: habito.2)
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: add_habito()) {
                        Text("Adicionar Hábito")
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
                .padding()
                .background(Color.white)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Painel")
                }
                
                Text("Metas")
                    .tabItem {
                        Image(systemName: "trophy")
                        Text("Metas")
                    }
                
                Text("Acompanhamento")
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Acompanhamento")
                    }
            }
            .navigationTitle("Hábitos")
        }
    }
}

struct AddHabitoView: View {
    @Binding var habitos: [(String, String, Double)]
    @Environment(\.presentationMode) var presentationMode

    @State private var nomeHabito = ""
    @State private var duracaoHabito = ""
    @State private var progressoHabito = 0.0

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Nome do Hábito", text: $nomeHabito)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Duração (ex: 30 minutos)", text: $duracaoHabito)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Slider(value: $progressoHabito, in: 0...1, step: 0.05) {
                Text("Progresso")
            }
            Text("Progresso: \(Int(progressoHabito * 100))%")
            
            Spacer()
            
            Button(action: {
                // Adiciona o novo hábito e volta para a tela anterior
                habitos.append((nomeHabito, duracaoHabito, progressoHabito))
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Salvar Hábito")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Adicionar Hábito")
    }
}

struct HabitoItem: View {
    var nome: String
    var duracao: String
    var progresso: Double
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text(nome)
                    .font(.subheadline)
                Text(duracao)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(Int(progresso * 100))%")
        }
    }
}


#Preview {
    Habits()
}
