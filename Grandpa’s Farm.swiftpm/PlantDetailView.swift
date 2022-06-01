/*
 Author: Xikai Liu
 Description: Plant Detail View used open-source project 
 LoadingButton and ScrollViewReactiveHeader for better presentation,
 This View has 2 status, with or without button, controlled by readOnly
 */

import SwiftUI
import ScrollViewReactiveHeader
import LoadingButton

struct PlantDetailView: View {
@EnvironmentObject var appData: AppData
    @Binding var data: Plant
    var readOnly: Bool = false
    @State var isRotating = false
    @State var isLoading = false
    @State var isExpanded: [Bool] = [true]
    var toGrowButtonStyle: LoadingButtonStyle {
        if data.plantedTime != nil {
            return LoadingButtonStyle(cornerRadius: 50, backgroundColor: .green)
        } else {
            return LoadingButtonStyle(cornerRadius: 50, backgroundColor: .white, strokeColor: .black)
        }
    }
    var toGrowButtonText: String {
        if data.plantedTime != nil {
            return "Planted! Check it out"
        } else {
            return "Grow it!"
        }
    }
    var toGrowTipText: String {
        if data.plantedTime != nil {
            return ""
        } else {
            return "I will add this plant to My Yard and set reminders for you."
        }
    }
    
    var body: some View {
        ScrollViewReactiveHeader(header: {
                Image(data.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.75)
                    .frame(height: 300)
            }, headerOverlay: {
                ZStack {
                    Image("Text_Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(1.25)
                        .rotationEffect(.init(degrees: isRotating ? 0 : 360))
                        .onAppear {
                            withAnimation(animation) {
                                isRotating = true
                            }
                        }
                        .mask(
                            Text(data.name)
                                .font(.system(size: 52))
                                .fontWeight(.black)
                                .frame(maxWidth: .infinity, alignment: .leading))
                        .padding()
                    
                }
                .frame(height: 250)
            }, body: {
                VStack(alignment: .leading, spacing: 10) {
                    if !readOnly {
                        LoadingButton(action: {
                            if data.plantedTime != nil {
                                isLoading = false
                                appData.tab = 3
                            } else {
                                isLoading = true
                                data.plantedTime = Date()
                                let group = DispatchGroup()
                                group.enter()
                                DispatchQueue.main.async {
                                    appData.generateTodos(ofPlant: data)
                                    group.leave()
                                }
                                group.notify(queue: .main) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        self.isLoading = false
                                    }
                                }
                            }
                        }, isLoading: $isLoading, style: toGrowButtonStyle) {
                            HStack {
                                Text(toGrowButtonText)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                        }.onAppear() {
                            isLoading = false
                        }.padding([.leading, .top, .trailing])
                    }
                    
                    
                    Text(toGrowTipText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .font(.system(.footnote, design: .rounded))
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(data.name)
                            .font(.system(.largeTitle, design: .serif).bold())
                        Text(data.botanical)
                            .font(.system(.footnote, design: .serif).italic())
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ripe in")
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.top)
                                Text("\(data.matureTime) days")
                                    .font(.system(.body, design: .serif))
                                Spacer()
                                Text("Sowing Time")
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.top)
                                Text("\(numberToMonth(month: data.sowingPeriod.0)) ~ \(numberToMonth(month: data.sowingPeriod.1))")
                                    .font(.system(.body, design: .serif))
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Planted time")
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.top)
                                if let time = data.plantedTime {
                                    Text(DateFormatter.localizedString(from: time, dateStyle: .medium, timeStyle: .none))
                                        .font(.system(.body, design: .serif))
                                } else {
                                    Text("Not planted")
                                        .font(.system(.body, design: .serif))
                                }
                                Spacer()
                                if let temperature = data.temperature {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Sowing Temperature")
                                            .font(.system(.headline, design: .rounded))
                                            .padding(.top)
                                        Text("\(temperature.0)°C ~ \(temperature.1)°C")
                                            .font(.system(.body, design: .serif))
                                    }
                                } else {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("")
                                            .font(.system(.headline, design: .rounded))
                                            .padding(.top)
                                        Text("")
                                            .font(.system(.body, design: .serif))
                                    }
                                }
                            }
                            Spacer()
                        }
                        
                        Text("Introduction")
                            .font(.system(.headline, design: .rounded))
                            .padding(.top)
                        Text(data.description)
                            .font(.system(.body, design: .serif))
                        if let notice = data.notice {
                            Text("Notice")
                                .font(.system(.headline, design: .rounded))
                                .padding(.top)
                            Text(notice)
                                .font(.system(.body, design: .serif))
                        }
                        Text("Tips")
                            .font(.system(.headline, design: .rounded))
                            .padding(.top)
                        Text(data.tip)
                            .font(.system(.body, design: .serif))
                    }
                    .padding(.top)
                    Spacer(minLength: 400)
                }.padding()
            }, configuration: .init(showStatusBar: false))
            .background(.black)
        
    }
    
    var animation: Animation {
        Animation.linear(duration: 20)
            .repeatForever(autoreverses: false)
    }
    
    func numberToMonth(month: Int) -> String {
        let monthString: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        return monthString[month - 1]
    }
}
