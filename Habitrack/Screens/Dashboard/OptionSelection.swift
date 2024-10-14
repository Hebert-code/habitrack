import SwiftUI

struct OptionSelection: View {
    @State var title: String = "";
    
    @Binding var categoriaSelecionada: String?;
    @Binding var categorias: Array<String>;
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            HStack {
                ForEach(categorias, id: \.self) { categoria in
                    if categoriaSelecionada == categoria {
                        Button(action: {
                            categoriaSelecionada = categoria
                        }) {
                            Text(categoria)
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .cornerRadius(8)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.black)
                                )
                        }
                        .foregroundStyle(.gray)
                    } else {
                        Button(action: {
                            categoriaSelecionada = categoria
                        }) {
                            Text(categoria)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.gray)
                                )
                        }
                        .foregroundStyle(.gray)
                    }
                }
            }
        }
    }
}
