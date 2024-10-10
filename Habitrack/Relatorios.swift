//
//  Recomendacao.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct Relatorios: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Resumo Geral
                    Text("Resumo Geral")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            SummaryCard(title: "Total de metas alcançadas", value: "200")
                            SummaryCard(title: "Progresso médio", value: "78%")
                            SummaryCard(title: "Área em destaque", value: "Metas")
                        }
                        .padding(.horizontal)
                    }
                    
                    // Botão Baixar Relatório
                    Button(action: {}) {
                        Text("Baixar relatório")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Gráfico de barras (imagem simulada)
                    Image(systemName: "chart.bar.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .padding(.horizontal)
                    
                    // Tendências
                    Text("Tendências")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Text("Você tende a cumprir mais hábitos aos sábados e domingos!")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    // Desempenho por Categoria
                    Text("Desempenho por Categoria")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        PerformanceRow(category: "Saúde", percentage: 80)
                        PerformanceRow(category: "Estudo", percentage: 60)
                        PerformanceRow(category: "Carreira", percentage: 70)
                        PerformanceRow(category: "Fitness", percentage: 50)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Relatórios")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button("Painel") {}
                    Spacer()
                    Button("Metas") {}
                    Spacer()
                    Button("Hábitos") {}
                    Spacer()
                }
            }
        }
    }
}

// Componentes

struct SummaryCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.title)
                .bold()
        }
        .frame(width: 120, height: 80)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

struct PerformanceRow: View {
    var category: String
    var percentage: Int
    
    var body: some View {
        HStack {
            Text("\(category):")
                .font(.subheadline)
            Spacer()
            Text("\(percentage)% cumprido")
                .font(.subheadline)
        }
    }
}

#Preview {
    Relatorios()
}
