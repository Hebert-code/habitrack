import Foundation

struct Habit: Codable {
    var nomeHabito: String
    var descricaoHabito: String
    var frequencia: String
    var dataInicio: Date
    var metaSelecionada: String
    var habilitarLembretes: Bool
    var frequenciaLembrete: String
}
