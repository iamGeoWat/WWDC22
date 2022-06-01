/*
 Author: Xikai Liu
 Description: Seed Gallery with an Cover-flow styled carousel. 
 onChange() will read scroll position in real-time 
 and calculated angle result will be applied to rotation3DEffect()
 */

import SwiftUI

struct AllPlantView: View {
    @EnvironmentObject var appData: AppData
    @State var ro: [CGFloat] = Array(repeating: 0.0, count: allPlantsCollection.count)
    @State var showSheet: [Bool] = Array(repeating: false, count: allPlantsCollection.count)
    
    var body: some View { 
        VStack {
            Text("This is the gallery of plant information, all collected by me 🤓").font(.headline).padding()
            Text("Presented in a nostagic cover flow style, swipe and have a look! 👇").font(.headline).padding()
            GeometryReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { scrollProxy in
                        HStack(spacing: -30) {
                            ForEach(0..<allPlantsCollection.count) { index in
                                VStack {
                                    GeometryReader { imageProxy in
                                        VStack {
                                            ZStack {
                                                Image(allPlantsCollection[index].icon)
                                                    .resizable()
                                                    .font(.largeTitle)
                                                    .padding()
                                                    .onChange(of: imageProxy.frame(in: .global).midX, perform: { data in
                                                        onRotate(angle: calcAngle(position: data, containerWidth: scrollViewProxy.size.width),
                                                                 index: index)
                                                    })
                                                    .frame(width: 200)
                                                    .aspectRatio(1, contentMode: .fit)
                                                
                                                Image("GlossyOverlay")
                                                    .resizable()
                                                    .frame(width: 170)
                                                    .padding()
                                                    .aspectRatio(1, contentMode: .fit)
                                                    .blendMode(BlendMode.screen)
                                            }
                                            .onTapGesture {
                                                showSheet[index] = true
                                            }
                                            .sheet(isPresented: $showSheet[index]) {
                                                PlantDetailView(data: appData.allPlants()[index], readOnly: true)
                                            }
                                            Text(allPlantsCollection[index].name)
                                        }
                                        .rotation3DEffect(.degrees(ro[index]), axis: (x: 0, y: 1, z: 0), perspective: 0.5)
                                    }
                                    .frame(width: 200, height: 300)
                                    .id(index)
                                }
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    scrollProxy.scrollTo(2, anchor: .top)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func onRotate(angle: CGFloat, index: Int) {
        withAnimation {
            ro[index] = angle
        }
    }
    
    func calcAngle(position: CGFloat, containerWidth: CGFloat) -> CGFloat {
        let carouselSlopeRatio: CGFloat = 1000
        let showFlatRight: CGFloat = containerWidth / 2 + 100
        let showFlatLeft: CGFloat = containerWidth / 2 - 90
        if (position >= showFlatLeft && position <= showFlatRight) {
            return 0
        } else if position < showFlatLeft {
            return (((position - containerWidth/2) / carouselSlopeRatio) + 1) * 80
        } else if position > showFlatRight {
            return (((position - containerWidth/2) / carouselSlopeRatio) - 1) * 80
        } else {
            return 360
        }
    }
    
}

