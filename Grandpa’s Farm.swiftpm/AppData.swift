/*
 Author: Xikai Liu
 Description: App environmental data is managed with AppData class and its instance,
 Reactive list is generated with functions returning Binding Arrays,
 generateTodos() generate reminders accroding to plant data.
 */

import Foundation
import SwiftUI

struct Event: Identifiable, Hashable {
    var name: String
    var daysAfter: Int
    init(_ name: String, _ daysAfter: Int) {
        self.name = name
        self.daysAfter = daysAfter
    }
    let id = UUID().uuidString
}

struct Todo: Identifiable {
    let plant: Plant
    var title: String
    let time: Date
    var isComplete = false
    let id: String = UUID().uuidString
    
    var isToday: Bool {
        Calendar.current.dateComponents([.day, .year, .month], from: time) == Calendar.current.dateComponents([.day, .year, .month], from: Date())
    }
    
    var isPast: Bool {
        time < Date.now && isComplete
    }
    
    var isWithinSevenDays: Bool {
        !isPast && time < Date.now.afterSevenDays
    }
    
    var isWithinSevenToThirtyDays: Bool {
        !isPast && !isWithinSevenDays && time < Date.now.afterThirtyDays
    }
    
    var isDistant: Bool {
        time >= Date().afterThirtyDays
    }
}

enum Period: String, CaseIterable, Identifiable {
    case today = "Today"
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    case complete = "Complete"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

let allPlantsCollection: [Plant] = [
    scallion,
    waxGourd,
    bitterMelon,
    okra,
    malabarSpinach,
    eggPlant,
    hotPepper,
    paiTsai,
    mint,
    sweetPepper,
    tomato,
    whiteIcicleRadish,
    basil,
    asparagus,
    snowPeas
]

enum AppRouter: String {
    case guideView
    case mainContent
}

class AppData: ObservableObject {
    @Published var plants: [Plant] = allPlantsCollection
    
    @Published var todos: [Todo] = []
    
    @Published var tab = 1
    
    var myYard: [Plant] {
        plants.filter({$0.plantedTime != nil})
    }
    
    func isTodoEmpty() -> Bool {
        return todos.count == 0
    }
    
    func generateTodos(ofPlant plant: Plant) {
        if let intervalEvents = plant.intervalEvents {
            for j in 0...intervalEvents.count - 1 {
                let event = intervalEvents[j]
                for i in stride(from: event.daysAfter, to: plant.matureTime, by: event.daysAfter) {
                    todos.append(
                        Todo(
                            plant: plant,
                            title: event.name, 
                            time: Date(timeIntervalSinceNow: 24*60*60*Double(i))
                        )
                    )
                }
            }
        }
        if let singleEvents = plant.singleEvents {
            for i in 0...singleEvents.count - 1 {
                let event = singleEvents[i]
                todos.append(
                    Todo(
                        plant: plant, 
                        title: event.name,
                        time: Date(timeIntervalSinceNow: 24*60*60*Double(event.daysAfter))
                    )
                )
            }
        }
        todos.append(
            Todo(
                plant: plant, 
                title: "Harvest!",
                time: Date(timeIntervalSinceNow: 24*60*60*Double(plant.matureTime))
            )
        )
    }
    
    func activeTab() -> Binding<Int> {
        Binding<Int>(
            get: {
                self.tab
            }, set: { newTab in 
                self.tab = newTab
            }
        )
    }
    
    func sortedTodos(ofPeriod period: Period, atSize size: Int? = nil) -> Binding<[Todo]> {
        Binding<[Todo]>(
            get: {
                let sortedArray = self.todos.filter {
                    switch period {
                    case .complete:
                        return $0.isComplete
                    case .today:
                        return $0.isToday && !$0.isComplete
                    case .nextSevenDays:
                        return $0.isWithinSevenDays
                    case .nextThirtyDays:
                        return $0.isWithinSevenToThirtyDays
                    case .future:
                        return $0.isDistant
                    case .past:
                        return $0.isPast && !$0.isComplete
                    }
                }
                .sorted { $0.time < $1.time }
                
                if let size = size, size < sortedArray.count {
                    var trimedArray: [Todo] = []
                    for i in 0...size - 1 {
                        trimedArray.append(sortedArray[i])
                    }
                    return trimedArray
                } else {
                    return sortedArray
                }
            }, set: { todos in
                for todo in todos {
                    if let index = self.todos.firstIndex(where: { $0.id == todo.id }) {
                        self.todos[index] = todo
                    }
                }
                
            }
        )
    }
    
    func allPlants() -> Binding<[Plant]> {
        Binding<[Plant]>(
            get: {
                self.plants
            },
            set: { plants in
                for plant in plants {
                    if let index = self.plants.firstIndex(where: { $0.name == plant.name }) {
                        self.plants[index] = plant
                    }
                }
            }
        )
    }
    
    func growablePlants(month: Int) -> Binding<[Plant]> {
        Binding<[Plant]>(
            get: {
                self.plants.filter({ month >= $0.sowingPeriod.0 && month <= $0.sowingPeriod.1 })
            },
            set: { plants in
                for plant in plants {
                    if let index = self.plants.firstIndex(where: { $0.name == plant.name }) {
                        self.plants[index] = plant
                    }
                }
            }
        )
    }
    
    func myYardPlants() -> Binding<[Plant]> {
        Binding<[Plant]>(
            get: {
                self.plants.filter({ $0.plantedTime != nil })
            },
            set: { plants in
                for plant in plants {
                    if let index = self.plants.firstIndex(where: { $0.name == plant.name }) {
                        self.plants[index] = plant
                    }
                }
            }
        )
    }
}

extension Date {
    var afterSevenDays: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var afterThirtyDays: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}
