//
//  Habitos.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct Habits: View {
    @StateObject var controllerHabit = HabitListViewModel()
    @StateObject var controllerGoal = GoalListViewModel()
    
    @State private var habitos: [(String, String, Double)] = [
        ("Exercício", "30 minutos", 0.5),
        ("Meditação", "10 minutos", 0.75)
    ]
    @State private var showingAddHabito = false
    
    var body: some View {
        NavigationView {
            ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Visão geral do hábito")
                    .font(.title2)
                    .padding(.top, 20)
                
                HStack {
                    VStack {
                        Text("Total de Habitos")
                            .font(.subheadline)
                        Text("\(controllerHabit.habits.filter { $0.habilitarLembretes }.count)")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
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
                    
                    ForEach(controllerHabit.habits, id: \._id) { habit in
                        HabitoItem(nome: habit.nomeHabito, duracao: habit.descricaoHabito, progresso: habit.habilitarLembretes ? 1.0 : 0.0)
                                            }
                                        }
                
                Spacer()
                
                NavigationLink(destination: NewHabitView()) {
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
            .navigationBarTitle("Hábitos", displayMode: .inline)
        }
        }
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
