//
//  Metas.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI


struct Goals: View {
    @State private var totalMetas: Int = 5
    @State private var metasConcluidas: Int = 3
    @State private var metas: [Meta] = [
        Meta(nome: "Exercício diário", categoria: "Fitness", progresso: 70, icone: "figure.walk"),
        Meta(nome: "Leia 20 páginas", categoria: "Educação", progresso: 50, icone: "book")
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Progresso geral
                    Text("Progresso geral")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Total de Metas")
                                .font(.subheadline)
                            Text("\(totalMetas)")
                                .font(.title)
                        }
                        .padding()
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Concluídas")
                                .font(.subheadline)
                            Text("\(metasConcluidas)")
                                .font(.title)
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Seus progresso
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
                    
                    // Botão Adicionar Meta
                    Button(action: {
                        // Ação para adicionar nova meta
                    }) {
                        Text("Adicionar Meta")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
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
