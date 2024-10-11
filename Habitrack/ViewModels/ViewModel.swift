import Foundation
import SwiftUI

class NewHabitViewModel: ObservableObject {
    @Published var habit = Habit(
        nomeHabito: "",
        descricaoHabito: "",
        frequencia: "Diário",
        dataInicio: Date(),
        metaSelecionada: "Meta 1",
        habilitarLembretes: false,
        frequenciaLembrete: ""
    )
    
    let frequencias = ["Diário", "Semanal", "Mensal"]
    let metas = ["Meta 1", "Meta 2", "Meta 3"]
    let frequenciasLembrete = ["Diário", "Semanal", "Mensal"]

    func salvarHabito() {
        guard let url = URL(string: "http://10.87.155.129:8888/enviar") else {
                    print("URL inválida")
                    return
                }

                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                do {
                    let jsonData = try JSONEncoder().encode(habit)
                    request.httpBody = jsonData

                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            print("Erro ao enviar dados: \(error.localizedDescription)")
                            return
                        }

                        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                            print("Meta enviada com sucesso!")
                        } else {
                            print("Falha ao enviar a meta.")
                        }
                    }.resume()

                } catch {
                    print("Erro ao serializar dados: \(error.localizedDescription)")
                }
        print("Hábito salvo: \(habit)")
    }
}
