import Foundation
import Combine

final class GoalListViewModel: ObservableObject {
    @Published var goals : [Goal] = []
    let webService = WebService()
    
    init() {
        fetchGoals()
    }

    func fetchGoals() {
        webService.getAllGoals { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let goals):
                    self?.goals = goals
                    print("Metas ----------")
                    print(goals)
                case .failure(let error):
                    print("Erro ao buscar goals: \(error)")
                }
            }
        }
    }

    func insertGoal(nomeGoal: String, descricao: String, categoria: String, dataInicio: String, dataTermino: String, type: String, progresso: Int, icone: String) {
        let newGoal = Goal(nomeGoal: nomeGoal, descricao: descricao, categoria: categoria, dataInicio: dataInicio, dataTermino: dataTermino, type: type, icone: icone, progresso: progresso)
        webService.insertGoal(goal: newGoal) { [weak self] in
            self?.fetchGoals()
        }
    }
    

}

final class HabitListViewModel: ObservableObject {
    @Published var habits = [Habit]()
    @Published var goals = [Goal]() // Lista de goals disponíveis para associação
    let webService = WebService()

    init() {
        fetchHabits()
    }

    public func fetchHabits() {
        webService.getAllHabits { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let habits):
                    self?.habits = habits
                case .failure(let error):
                    print("Erro ao buscar hábitos: \(error)")
                }
            }
        }
    }

    func insertHabit(nomeHabito: String, descricaoHabito: String, frequencia: String, dataInicio: String, goalID: UUID?, habilitarLembretes: Bool, frequenciaLembrete: String?, type: String) {
        let newHabit = Habit(nomeHabito: nomeHabito, descricaoHabito: descricaoHabito, frequencia: frequencia, dataInicio: dataInicio, goalID: goalID, habilitarLembretes: habilitarLembretes, frequenciaLembrete: frequenciaLembrete, type: type)
        webService.insertHabit(habit: newHabit) { [weak self] in
            self?.fetchHabits()
        }
    }
}
