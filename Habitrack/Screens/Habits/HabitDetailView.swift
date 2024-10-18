import SwiftUI

struct HabitDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var habit: Habit // Supondo que você tenha um modelo Habit
    @State private var progresso: Double = 0.0
    @State private var isConcluido: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(habit.nomeHabito)
                .font(.largeTitle)
                .bold()
            
            Text(habit.descricaoHabito)
                .font(.body)
                .padding()
            
            Text("Iniciado em: \(habit.dataInicio)") // Ajuste para o formato de data se necessário
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Slider para indicar progresso
            Slider(value: $progresso, in: 0...1, step: 0.01) {
                Text("Progresso")
            } minimumValueLabel: {
                Text("0%")
            } maximumValueLabel: {
                Text("100%")
            }
            .padding()
            
            // Botão para marcar como concluído
            Button(action: {
                isConcluido = true
                // Aqui você pode adicionar lógica para salvar o progresso
                // controllerHabit.updateHabit(habit.id, progresso: progresso)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(isConcluido ? "Hábito Concluído" : "Marcar como Concluído")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detalhes do Hábito", displayMode: .inline)
    }
}
