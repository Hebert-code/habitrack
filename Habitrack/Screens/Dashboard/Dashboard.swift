import SwiftUI

struct DashboardView: View {
    @StateObject var controllerHabit = HabitListViewModel()
    @StateObject var controllerGoal = GoalListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    HStack {
                        QuickLinkView(
                            title: "Relatórios",
                            imageName: "chart.bar",
                            destination: Relatory())
                        QuickLinkView(
                            title: "Recomendações",
                            imageName: "pencil",
                            destination: Recomendations())
                    }
                    .frame(width: .infinity, alignment: .center)
                    .padding()
                    
                    // Objetivos em Progresso Button
                    DefaultButton(callback: {}, title: "Objetivos em Progresso")
               
                    SectionTitle(title: "Hábitos em andamento")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(controllerGoal.goals, id: \._id) {
                                goal in
                                HabitCardView(
                                    imageName: "default",
                                    title: goal.nomeGoal == "" ? "sem nome" : goal.nomeGoal,
                                    progress: 50,
                                    status: "Restam 5 dias")
                            }
                        }
                        .padding(.horizontal)
                    }
              
                    SectionTitle(title: "Metas em andamento")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(controllerHabit.habits, id: \._id) {
                                habit in
                                HabitCardView(
                                    imageName: "default",
                                    title: habit.nomeHabito == "" ? "sem nome" : habit.nomeHabito,
                                    progress: 50,
                                    status: "Restam 5 dias")
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Notificações
                    Text("Notificações")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
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
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: Recomendations()) {
                            NotificationButton(title: "Dicas e Motivação")
                        }
                        NavigationLink(destination: Relatory()) {
                            NotificationButton(title: "Relatórios")
                        }
                        NavigationLink(destination: Goals()) {
                            NotificationButton(title: "Conquistas")
                        }
                        NavigationLink(destination: Achievements()) {
                            NotificationButton(title: "Histórico")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(3)
            .navigationBarTitle("Início", displayMode: .inline)
        }
        .onAppear() {
            controllerGoal.fetchGoals();
            controllerHabit.fetchHabits();
        }
    }
}


#Preview {
    MainView()
}
