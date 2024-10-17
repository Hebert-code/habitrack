//
//  tabview.swift
//  Habitrack
//
//  Created by Turma01-10 on 10/10/24.
//

import Foundation
import SwiftUI

struct MainView: View {
    init() {
        // Modificar a aparência do TabBar para alterar as cores
        UITabBar.appearance().backgroundColor = UIColor.white// Cor de fundo
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Cor para itens não selecionados
        UITabBar.appearance().tintColor = UIColor.black // Cor dos itens selecionados (ícones e textos)
    }
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Início", systemImage: "house")
                }
            
            Habits()
                .tabItem {
                    Label("Hábitos", systemImage: "arrow.triangle.2.circlepath")
                }
            
            Goals()
                .tabItem {
                    Label("Metas", systemImage: "trophy.fill")
                }
            
            Monitoring()
                .tabItem {
                    Label("Acompanhamento", systemImage: "chart.bar.fill")
                }
        }
    }
}
