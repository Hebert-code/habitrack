import SwiftUI;

struct QuickLinkView<Destination: View>: View {
    var title: String
    var imageName: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.black)
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .frame(width: 150, height: 100)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
        }
    }
}
