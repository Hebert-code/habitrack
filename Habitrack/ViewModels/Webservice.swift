import Foundation

struct WebService {

    func getAllHabits(completion: @escaping (Result<[Habit], Error>) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/visualizar") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
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

    func deleteHabit(id: UUID, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://10.87.155.129:8888/deletar/\(id)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("Erro ao deletar hábito: \(error!.localizedDescription)")
                return
            }
            completion()
        }.resume()
    }


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
            print("Error encoding habit: \(error)")
        }
    }

    func updateHabit(habit: Habit, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://10.87.155.129:8888/habits/\(habit.id.uuidString)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(habit)
            URLSession.shared.dataTask(with: request) { _, _, _ in
                completion()
            }.resume()
        } catch {
            print("Error encoding habit: \(error)")
        }
    }
}
