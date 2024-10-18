import SwiftUI

struct DashboardView: View {
    @StateObject var controllerHabit = HabitListViewModel()
    @StateObject var controllerGoal = GoalListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .center, spacing: 20) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            QuickLinkView(
                                title: "Relatórios",
                                imageName: "chart.bar",
                                destination: Relatory())
                            QuickLinkView(
                                title: "Histórico", 
                                imageName: "newspaper",
                                destination: Achievements())
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                    }
                    .frame(width: .infinity, alignment: .center)
                    .padding()
                    
                    SectionTitle(title: "Metas em andamento")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(controllerGoal.goals, id: \._id) { goal in
                                HabitCardView(
                                    imageName: "default",
                                    title: goal.nomeGoal.isEmpty ? "sem nome" : goal.nomeGoal,
                                    progress: 50,
                                    status: "Restam 5 dias")
                            }
                        }
                        .padding(.horizontal)
                    }
              
                    SectionTitle(title: "Hábitos em andamento")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(controllerHabit.habits, id: \._id) { habit in
                                HabitCardView(
                                    imageName: "default",
                                    title: habit.nomeHabito.isEmpty ? "sem nome" : habit.nomeHabito,
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
                    Spacer()
                        .frame(height: 40)
                }
            }
            .padding(3)
            .navigationBarTitle("Início", displayMode: .inline)
        }
        .onAppear {
            controllerGoal.fetchGoals()
            controllerHabit.fetchHabits()
        }
    }
}

#Preview {
    MainView() // Atualizado para usar DashboardView
}
