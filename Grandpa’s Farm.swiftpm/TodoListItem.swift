/*
 Author: Xikai Liu
 Description: Todo List Item
 */

import SwiftUI

struct TodoListItem: View {
    @Binding var todo: Todo
    let period: Period
    
    var body: some View {
        HStack {
            Image(todo.plant.icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 40)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(todo.title)
                    .fontWeight(.bold)
                Text(todo.time.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if period == Period.today {
                Button(action: {
                    withAnimation {
                        todo.isComplete.toggle()
                    }
                }, label: {
                    Text("Finished ✌️")
                }).buttonStyle(.bordered)
            }
            if period == Period.complete {
                Button(action: {}, label: {
                    Image(systemName: "checkmark.circle.fill")
                })
            }
        }
    }
}
