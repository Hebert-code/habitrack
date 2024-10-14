import SwiftUI

struct Home: View {
    @State private var isActive = false // Estado para controlar a navegação

    var body: some View {
        NavigationStack {
            ZStack {
                // Tela de fundo ou cor
                Color.white.ignoresSafeArea()
                
                VStack {
                    Text("HabitTrack")
                        .font(.largeTitle)
                        .padding(.top, 100) // Espaçamento superior

                    Button(action: {
                        isActive = true // Muda o estado para ativar a navegação
                    }) {
                        Text("Entrar")
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.horizontal, 20) // Adiciona algum espaçamento horizontal
                    }
                    .padding(.bottom, 20) // Espaçamento inferior
                }
            }
            .navigationDestination(isPresented: $isActive) { // Usando navigationDestination
                MainView() // Navega para MainView
            }
            //.navigationBarBackButtonHidden(false)
           // .navigationBarHidden(false) // Oculta a barra de navegação
        }
    }
}

#Preview {
    Home()
}
