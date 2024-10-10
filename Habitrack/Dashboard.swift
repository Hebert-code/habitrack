import SwiftUI

struct MainView: View {
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
                        NotificationButton(title: "Dicas e Motivação")
                        NotificationButton(title: "Relatórios")
                        NotificationButton(title: "Conquistas")
                        NotificationButton(title: "Histórico")
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Início")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button("Hábitos") {}
                    Spacer()
                    Button("Metas") {}
                    Spacer()
                    Button("Acompanhamento") {}
                    Spacer()
                }
            }
        }
    }
}

// Components

struct QuickLinkView: View {
    var title: String
    var imageName: String
    
    var body: some View {
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
                    .frame(width: 150, height: 100)
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

#Preview {
    MainView()
}
