//
//  Metas.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI


struct Goals: View {
    
    @StateObject var controllerHabit = HabitListViewModel()
    @StateObject var controllerGoal = GoalListViewModel()
    
    
    @State private var totalMetas: Int = 5
    @State private var metasConcluidas: Int = 3
    @State private var metas: [Meta] = [
        Meta(nome: "Exercício diário", categoria: "Fitness", progresso: 70, icone: "figure.walk"),
        Meta(nome: "Leia 20 páginas", categoria: "Educação", progresso: 50, icone: "book.closed"), // Troca de ícone
        Meta(nome: "Meditação", categoria: "Saúde", progresso: 80, icone: "person.crop.circle"), // Troca de ícone
        Meta(nome: "Correr", categoria: "Fitness", progresso: 30, icone: "figure.run") // Troca de ícone
    ]
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            VStack {
                                Text("Total de Metas")
                                    .font(.subheadline)
                                Text("\(totalMetas)")
                                    .font(.title)
                            }
                            
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("Concluídas")
                                    .font(.subheadline)
                                Text("\(metasConcluidas)")
                                    .font(.title)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .padding()
                        .cornerRadius(10)
                        
                        
                        HStack {
                            Text("Seus progresso")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Button(action: {
                                // Ação do filtro
                            }) {
                                Text("Filtrar")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal)
                        
                        ForEach(metas) { meta in
                            MetaRowView(meta: meta)
                                .padding(.horizontal)
                        }
                        
                        NavigationLink(destination: AddGoalView()) {
                            Text("Adicionar Hábito")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: 44)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                 
                        .padding(.horizontal)
                        .padding(.top, 20)
                    }
                    .padding(.top)
                }
            }
            .navigationBarTitle("Metas", displayMode: .inline)
        }
        
    }
}

struct Meta: Identifiable {
    let id = UUID()
    let nome: String
    let categoria: String
    let progresso: Int
    let icone: String
}

struct MetaRowView: View {
    var meta: Meta
    
    var body: some View {
        HStack {
            Image(systemName: meta.icone)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(meta.nome)
                    .font(.headline)
                Text(meta.categoria)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                ProgressView(value: Float(meta.progresso) / 100)
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(.black)
                Text("Progresso atual: \(meta.progresso)%")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        
    }
}


#Preview {
    Goals()
}
