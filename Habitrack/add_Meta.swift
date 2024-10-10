//
//  add_Meta.swift
//  Habitrack
//
//  Created by Turma01-14 on 09/10/24.
//

import SwiftUI

struct add_Meta: View {
    @State private var nomeMeta = ""
    @State private var descricao = ""
    @State private var categoriaSelecionada: String? = nil
    @State private var dataInicio = Date()
    @State private var dataTermino = Date()

    let categorias = ["Saúde", "Carreira", "Educação"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Nome da meta")
                        .font(.headline)
                    TextField("Digite o nome da sua meta", text: $nomeMeta)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("Descrição")
                        .font(.headline)
                    TextField("Descreva sua meta com mais detalhes", text: $descricao)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("Categoria")
                        .font(.headline)
                    HStack {
                        ForEach(categorias, id: \.self) { categoria in
                            Button(action: {
                                categoriaSelecionada = categoria
                            }) {
                                Text(categoria)
                                    .padding()
                                    .background(categoriaSelecionada == categoria ? Color.gray.opacity(0.2) : Color.clear)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(categoriaSelecionada == categoria ? Color.blue : Color.gray, lineWidth: 1)
                                    )
                            }
                        }
                    }

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
                        Text("Adicionar marco")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("Novo Meta")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Button("Painel") {}
                        Spacer()
                        Button("Hábitos") {}
                        Spacer()
                        Button("Acompanhamento") {}
                        Spacer()
                    }
                }
            }
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
    add_Meta()
}
