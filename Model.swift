import Foundation

struct Habit: Codable, Hashable, Identifiable {
    var id = UUID()
    var nomeHabito: String
    var descricaoHabito: String
    var frequencia: String
    var dataInicio: String
    var metaSelecionada: String
    var habilitarLembretes: Bool
    var frequenciaLembrete: String
    var type: String
}
