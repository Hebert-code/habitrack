import SwiftUI

struct NotificationButton: View {
    var title: String
    
    var body: some View {
        Button(action: {}) {
            Text(title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .cornerRadius(8)
        }
    }
}
