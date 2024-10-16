import Foundation

struct WebService {

    // Fetch all habits
    func getAllHabits(completion: @escaping (Result<[Habit], Error>) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/visualizar/habit") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let habits = try JSONDecoder().decode([Habit].self, from: data)
                completion(.success(habits))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    // Fetch all goals
    func getAllGoals(completion: @escaping (Result<[Goal], Error>) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/visualizar/goal") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let goals = try JSONDecoder().decode([Goal].self, from: data)
                completion(.success(goals))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    // Insert new habit
    func insertHabit(habit: Habit, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/enviar") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(habit)
            URLSession.shared.dataTask(with: request) { _, _, _ in
                completion()
            }.resume()
        } catch {
            print("Erro ao codificar habit: \(error)")
        }
    }

    // Insert new goal
    func insertGoal(goal: Goal, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/enviar") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(goal)
            URLSession.shared.dataTask(with: request) { _, _, _ in
                completion()
            }.resume()
        } catch {
            print("Erro ao codificar goal: \(error)")
        }
    }
}
