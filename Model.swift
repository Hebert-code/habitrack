import Foundation

struct Goal: Codable, Identifiable, Hashable {
    var _id: String?
    var _rev: String?
    var id: UUID = UUID()
    var nomeGoal: String
    var descricao: String
    var categoria: String
    var dataInicio: String
    var dataTermino: String
    var type: String
}

struct Habit: Codable, Identifiable {
    var _id: String?
    var _rev: String?
    var id: UUID = UUID()
    var nomeHabito: String
    var descricaoHabito: String
    var frequencia: String
    var dataInicio: String
    var goalID: UUID? // Identificador do goal associado
    var habilitarLembretes: Bool
    var frequenciaLembrete: String?
    var type: String
}
