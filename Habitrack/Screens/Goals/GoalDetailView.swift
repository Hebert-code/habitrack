//
//  GoalDetailView.swift
//  Habitrack
//
//  Created by Turma01-10 on 16/10/24.
//

import SwiftUI

struct GoalDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var goal: Goal // Supondo que você tenha um modelo Goal
    @State private var isConcluido: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(goal.nomeGoal)
                .font(.largeTitle)
                .bold()
            
            Text(goal.descricao)
                .font(.body)
                .padding()
            
            Text("Tipo: \(goal.type)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Data de Término: \(goal.dataTermino)") // Ajuste para o formato de data se necessário
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button(action: {
                isConcluido = true
                // Aqui você pode adicionar lógica para marcar a meta como concluída
                // controllerGoal.updateGoal(goal.id, isConcluido: true)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(isConcluido ? "Meta Concluída" : "Marcar como Concluída")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detalhes da Meta", displayMode: .inline)
    }
}
