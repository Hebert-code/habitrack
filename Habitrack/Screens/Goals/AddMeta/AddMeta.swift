//
//  add_Meta.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct AddMeta: View {
    @State private var nomeMeta = ""
    @State private var descricao = ""
    @State private var categoriaSelecionada: String? = nil
    @State private var dataInicio = Date()
    @State private var dataTermino = Date()

    @State var categorias = ["Saúde", "Carreira", "Educação"];

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    SimpleInput(
                        title: "Nome",
                        placeholder: "Digite o nome da Meta",
                        fieldName: $nomeMeta)
                    
                    SimpleInput(
                        title: "Descrição",
                        placeholder: "Descreva sua meta com mais detalhes",
                        fieldName: $descricao)
                    
                   
                    OptionSelection(
                        title: "Categorias",
                        categoriaSelecionada: $categoriaSelecionada,
                        categorias: $categorias);
                    
                    Text("Data de início")
                        .font(.headline)
                    DatePicker("", selection: $dataInicio, displayedComponents: .date)
                        .labelsHidden()
                        

                    Text("Data de término")
                        .font(.headline)
                    DatePicker("", selection: $dataTermino, displayedComponents: .date)
                        .labelsHidden()
        

                    Button(action: {
                        enviarMetaParaAPI()
                    }) {
                        Text("Adicionar meta")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Nova Meta", displayMode: .inline)

        }
    }
    func enviarMetaParaAPI() {
        guard let url = URL(string: "http://10.87.155.129:8888/enviar") else {
            print("URL inválida")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        // Monta os dados a serem enviados
        let metaData: [String: Any] = [
            "nomeMeta": nomeMeta,
            "descricao": descricao,
            "categoriaSelecionada": categoriaSelecionada ?? "",
            "dataInicio": formatter.string(from: dataInicio),
            "dataTermino": formatter.string(from: dataTermino)
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: metaData, options: [])
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Erro ao enviar dados: \(error.localizedDescription)")
                    return
                }

                // Verifica se houve resposta da API
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Meta enviada com sucesso!")
                    } else {
                        print("Falha ao enviar a meta. Status: \(httpResponse.statusCode)")
                        if let data = data, let responseString = String(data: data, encoding: .utf8) {
                            print("Resposta da API: \(responseString)")
                        }
                    }
                }
            }.resume()

        } catch {
            print("Erro ao serializar dados: \(error.localizedDescription)")
        }
    }


}

#Preview {
    AddMeta()
}
