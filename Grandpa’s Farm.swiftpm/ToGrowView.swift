/*
 Author: Xikai Liu
 Description: The Navigator for What To Grow tab.
 */

import SwiftUI

struct ToGrowView: View {
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                DatePicker(
                    "Choose a date 👉",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                ).datePickerStyle(.compact)
                Text("And below will be the best suitable plants to grow on this date! 📅")
                    .padding([.bottom, .top])
                Text("Tap on any one of them to see detail plant information.")
                    .padding([.bottom])
                Text("Don't forget to check out the coolest Seed Gallery. 😎")
            }.padding()
            
            GrowableList(date: selectedDate)
            
        }
        .navigationTitle("Seed Calendar")
        
    }
}

struct GrowableList: View {
    @EnvironmentObject var appData: AppData
    
    let date: Date
    
    var body: some View {
        if let month = Calendar.current.dateComponents([.month], from: date).month {
            List {
                NavigationLink(destination: AllPlantView()) {
                    HStack {
                        Text("Check out the Seed Gallery")
                            .font(.headline)
                        Image(systemName: "arrow.up.right")
                    }
                    .padding(10)
                    .foregroundColor(.accentColor)
                }
                ForEach(appData.growablePlants(month: month)) { $plant in
                    NavigationLink(destination: PlantDetailView(data: $plant)) {
                        ToGrowListItem(plant: $plant)
                    }
                }
                
            }
        }
    }
}


