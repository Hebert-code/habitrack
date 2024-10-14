import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Links Rápidos
                    Text("Links rápidos")
                        .font(.headline)
                    
                    HStack {
                        QuickLinkView(title: "Relatórios", imageName: "chart.bar")
                        QuickLinkView(title: "Recomendações", imageName: "pencil")
                    }
                    .padding(.horizontal)
                    
                    // Objetivos em Progresso Button
                    Button(action: {}) {
                        Text("Objetivos em Progresso")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Hábitos em andamento
                    SectionTitle(title: "Hábitos em andamento")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            HabitCardView(imageName: "person.running", title: "Objetivo do exercício", progress: 50, status: "Restam 5 dias")
                            HabitCardView(imageName: "book", title: "Hábito de leitura", progress: 80, status: "No caminho certo")
                        }
                        .padding(.horizontal)
                    }
                    
                    // Metas em andamento
                    SectionTitle(title: "Metas em andamento")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            HabitCardView(imageName: "person.running", title: "Objetivo do exercício", progress: 50, status: "Restam 5 dias")
                            HabitCardView(imageName: "book", title: "Hábito de leitura", progress: 80, status: "No caminho certo")
                        }
                        .padding(.horizontal)
                    }
                    
                    // Notificações
                    Text("Notificações")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "alarm")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                        VStack(alignment: .leading) {
                            Text("Meta de leitura")
                                .font(.headline)
                            Text("Restam 3 dias")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16) {
                                            NavigationLink(destination: Recomendations()) {
                                                NotificationButton(title: "Dicas e Motivação")
                                            }
                                            NavigationLink(destination: Relatories() ) {
                                                NotificationButton(title: "Relatórios")
                                            }
                                            NavigationLink(destination: Goals()) {
                                                NotificationButton(title: "Conquistas")
                                            }
                                            NavigationLink(destination: Archievements()) {
                                                NotificationButton(title: "Histórico")
                                            }
                                        }
                                        .padding(.horizontal)
                }
            }
            .navigationBarTitle("Início", displayMode: .inline)
            }
    }
}

#Preview {
    MainView()
}
