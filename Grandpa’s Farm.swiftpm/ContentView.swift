/*
 Author: Xikai Liu
 Description: Content View
 */

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    @Binding var router: AppRouter
    
    var body: some View {
        TabView(selection: appData.activeTab()) {
            NavigationView {
                ToGrowView()
                    .toolbar {
                        ToolbarItem {
                            Button {
                                withAnimation {
                                    router = AppRouter.guideView
                                }
                            } label: {
                                Text("App Guide 📖")
                            }
                        }
                    }
                Text("Hi! Let's select something to plant on the left 🥕🥬🍆")
                    .font(.callout)
            }
            .tabItem {
                Label("What To Grow", systemImage: "thermometer.sun")
            }
            .tag(1)
            
            VStack {
                HStack {
                    Text("Growth Reminder")
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .padding([.leading, .top], 20)
                    Spacer()
                }
                ReminderView()
            }.padding()
            .tabItem { 
                Label("Reminder", systemImage: "calendar")
            }
            .tag(2)
            
            MyYardView() 
            .tabItem {
                Label("My Farm", systemImage: "square.grid.4x3.fill")
            }
            .tag(3)
        }
        
        
    }
}
