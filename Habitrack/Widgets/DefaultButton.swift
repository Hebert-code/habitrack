import SwiftUI;

struct DefaultButton: View {
    @State var callback: () -> Void // Definindo o tipo da função como um callback sem parâmetros e sem retorno
    @State var title: String
    
    var body: some View {
        Button(action: callback) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}
