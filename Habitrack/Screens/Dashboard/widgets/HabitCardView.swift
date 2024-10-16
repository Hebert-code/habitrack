import SwiftUI

struct HabitCardView: View {
    var imageName: String
    var title: String
    var progress: Int
    var status: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                
                Text(status)
                    .font(.caption)
                    .padding(6)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                    .padding(6)
            }
            
            Text(title)
                .font(.headline)
            Text("\(progress)%")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}
