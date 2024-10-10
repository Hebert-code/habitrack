import SwiftUI

struct SectionTitle: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Button("ver mais") {}
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
}
