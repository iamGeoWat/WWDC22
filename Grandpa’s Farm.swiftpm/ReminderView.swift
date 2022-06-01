/*
 Author: Xikai Liu
 Description: ReminderView is a reactive list, catergorized by time periods.
 */

import SwiftUI

struct ReminderView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        if appData.isTodoEmpty() {
            Text("Nothing planted yet. You can find something to grow in What To Grow tab 😆🌞🌻")
                .font(.subheadline)
                .padding()
        }
        List {
            ForEach(Period.allCases) { period in
                if !appData.sortedTodos(ofPeriod: period).isEmpty {
                    Section(content: {
                        ForEach(appData.sortedTodos(ofPeriod: period, atSize: 7)) { $todo in
                            TodoListItem(todo: $todo, period: period)
                        }
                    }, header: {
                        Text(period.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
                }
            }
            
        }
        
        
    }
}
