//
//  Habitos.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct Habits: View {
    @StateObject var controllerHabit = HabitListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        // Resumo de Hábitos
                        HStack {
                            VStack {
                                Text("Total de Hábitos")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Text("\(controllerHabit.habits.count)")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("Concluídas")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Text("\(controllerHabit.habits.filter { $0.habilitarLembretes }.count)")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        // Cabeçalho
                        HStack {
                            Text("Seus Hábitos")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
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
                        
                        // Lista de Hábitos
                        ForEach(controllerHabit.habits, id: \._id) { habit in
                            HabitoItem(nome: habit.nomeHabito, duracao: habit.descricaoHabito, progresso: habit.habilitarLembretes ? 1.0 : 0.0)
                                .padding(.horizontal)
                        }

                        // Botão para Adicionar Hábito
                        NavigationLink(destination: NewHabitView()) {
                            Text("Adicionar Hábito")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: 44)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue) // Cor de fundo azul
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                    }
                    .padding(.top)
                }
                .background(Color(UIColor.systemGroupedBackground)) // Fundo mais suave
            }
            .navigationBarTitle("Hábitos", displayMode: .inline)
        }
        .onAppear {
            controllerHabit.fetchHabits() // Método fictício para buscar hábitos
        }
    }
}

struct HabitoItem: View {
    var nome: String
    var duracao: String
    var progresso: Double
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill") // Ícone para indicar o status do hábito
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(nome)
                    .font(.headline)
                Text(duracao)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(Int(progresso * 100))%")
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Estilo de fundo
        .cornerRadius(10) // Cantos arredondados
        .padding(.vertical, 5) // Espaço vertical entre as linhas
    }
}

#Preview {
    Habits()
}
