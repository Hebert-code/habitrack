//
//  Metas.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI


struct Goals: View {
    
    @StateObject var controllerGoal = GoalListViewModel()
    
    @State private var metasConcluidas: Int = 3
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            VStack {
                                Text("Total de Metas")
                                    .font(.subheadline)
                                Text("\(controllerGoal.goals.count)")
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
                        
                        ForEach(controllerGoal.goals) { goal in
                            MetaRowView(metass: goal)
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
        }.onAppear(){
            controllerGoal.fetchGoals()
        }
        
    }
}

struct MetaRowView: View {
    var metass: Goal
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(metas.nomeGoal) // Exibe o nome da meta
                    .font(.headline)
                Text(metas.categoria) // Exibe a categoria da meta
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Estilo de fundo
        .cornerRadius(10) // Cantos arredondados
    }
}


#Preview {
    Goals()
}
