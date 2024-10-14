import SwiftUI

struct SimpleInput: View{
    @State var title: String;
    @State var placeholder: String;
    
    @Binding var fieldName: String;
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome do Hábito")
                .font(.headline)
            TextField("Insira o nome do hábito", text: $fieldName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
    }
}
