import SwiftUI

struct SimpleInput: View{
    @State var title: String;
    @State var placeholder: String;
    
    @Binding var fieldName: String;
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)")
                .font(.headline)
            TextField("\(placeholder)", text: $fieldName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
