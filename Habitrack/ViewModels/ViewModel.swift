import Foundation
import Combine

final class HabitListViewModel: ObservableObject {
    
    @Published var habits = [Habit]()
    let webService = WebService()
    
    let frequencias = ["Diário", "Semanal", "Mensal"]
    let metas = ["Meta 1", "Meta 2", "Meta 3"]
    let frequenciasLembrete = ["Diário", "Semanal", "Mensal"]
    
    init() {
        fetchHabits()
    }

    private func fetchHabits() {
        webService.getAllHabits { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let habits):
                    self?.habits = habits
                case .failure(let error):
                    print("Error fetching habits: \(error)")
                }
            }
        }
    }

    func deleteHabit(at index: Int) {
        webService.deleteHabit(id: habits[index].id) { [weak self] in
            self?.fetchHabits()
        }
    }

    // Insert a new habit
    func insertHabit(nomeHabito: String, descricaoHabito: String, frequencia: String, dataInicio: String, metaSelecionada: String, habilitarLembretes: Bool, frequenciaLembrete: String) {
        let newHabit = Habit(nomeHabito: nomeHabito, descricaoHabito: descricaoHabito, frequencia: frequencia, dataInicio: dataInicio, metaSelecionada: metaSelecionada, habilitarLembretes: habilitarLembretes, frequenciaLembrete: frequenciaLembrete)
        
        webService.insertHabit(habit: newHabit) { [weak self] in
            self?.fetchHabits()
        }
    }

    // Update an existing habit
    func updateHabit(habit: Habit, newNomeHabito: String) {
        let updatedHabit = Habit(id: habit.id, nomeHabito: newNomeHabito, descricaoHabito: habit.descricaoHabito, frequencia: habit.frequencia, dataInicio: habit.dataInicio, metaSelecionada: habit.metaSelecionada, habilitarLembretes: habit.habilitarLembretes, frequenciaLembrete: habit.frequenciaLembrete)
        
        webService.updateHabit(habit: updatedHabit) { [weak self] in
            self?.fetchHabits()
        }
    }
}
