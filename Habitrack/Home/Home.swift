import SwiftUI

struct Home: View {
    @State private var isActive = false // Estado para controlar a navegação

    var body: some View {
        NavigationStack {
            ZStack {
                // Tela de fundo ou cor
                Color.black.ignoresSafeArea()
                
                VStack {
                    Image("improvement").resizable().frame(width: 250, height: 250)
                    Text("HabiTrack")
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 20) // Adiciona algum espaçamento horizontal
                        .padding(.bottom, 20) // Espaçamento inferior
                }
                .onTapGesture {
                    isActive = true // Muda o estado para ativar a navegação
                }
            }
            .navigationDestination(isPresented: $isActive) { // Usando navigationDestination
                MainView() // Navega para MainView
            }
        }
    }
}

#Preview {
    Home()
}
