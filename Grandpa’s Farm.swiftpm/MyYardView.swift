/*
 Author: Xikai Liu
 Description: My Farm presenting planted crops in a Grid View
 */

import SwiftUI

struct MyYardView: View {
    @EnvironmentObject var appData: AppData
    @State private var gridCols = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("My Farm")
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .padding([.leading, .top], 20)
                        .padding([.bottom], 5)
                    Spacer()
                }
                HStack {
                    Text("An overview of the farm")
                        .font(.system(.subheadline, design: .rounded))
                        .padding([.leading], 20)
                    Spacer()
                }
                ScrollView {
                    if appData.myYardPlants().count == 0 {
                        Text("Nothing planted yet. You can find something to grow in What To Grow tab 😆🌞🌻")
                            .font(.subheadline)
                            .padding()
                    } else {
                        if geo.size.width < 500 {
                            FarmGrid(gridCols: Array(repeating: GridItem(.flexible()), count: 2), sheetData: appData.myYardPlants().first!)
                        } else {
                            FarmGrid(gridCols: Array(repeating: GridItem(.flexible()), count: 3), sheetData: appData.myYardPlants().first!)
                        }
                    }
                }
            }.padding()
        }
    }
}

struct FarmGrid: View {
    @EnvironmentObject var appData: AppData
    var gridCols: [GridItem]
    @State private var showSheet = false
    @State var sheetData: Binding<Plant>
    
    var body: some View {
        LazyVGrid(columns: gridCols) {
            ForEach(appData.myYardPlants()) { $plant in
                VStack {
                    ZStack {
                        Image(plant.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding()
                            .brightness(-0.08)
                        VStack {
                            Text("Planted")
                            Text("\(Calendar.current.dateComponents([.day], from: plant.plantedTime!, to: Date()).day! + 1)")
                            Text("day(s) ago")
                        }
                        .padding()
                        .font(.system(.title, design: .rounded).bold())
                        .foregroundColor(.accentColor)
                    }
                    
                    Text(plant.name)
                        .foregroundColor(.accentColor)
                }
                .onTapGesture {
                    sheetData = $plant
                    showSheet = true
                }
            }
        }.sheet(isPresented: $showSheet) {
            PlantDetailView(data: sheetData, readOnly: true)
        }
    }
}
