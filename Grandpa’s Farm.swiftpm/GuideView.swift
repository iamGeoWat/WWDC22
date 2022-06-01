/*
 Author: Xikai Liu
 Description: Guide view after launch. 
 Using a floating button with ZStack to control the process.
 */

import SwiftUI

struct GuideView: View {
    @Binding var router: AppRouter
    @State var guideStep: Int = 1
    
    var body: some View {
        ZStack {
            TabView(selection: $guideStep) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            Text("Welcome to Grandpa's Farm!")
                                .font(.system(.largeTitle, design: .rounded).bold())
                                .padding(.bottom)
                            Text("What is this?")
                                .font(.system(.title3, design: .rounded).bold())
                                .padding(.bottom)
                            Text("")
                                .font(.system(.body, design: .serif))
                            Text("Below is a little background I want to share.")
                                .font(.system(.body, design: .serif))
                        }
                        Group {
                            Text("Dedicated to my grandfather")
                                .font(.system(.title3, design: .rounded).bold())
                                .padding([.top, .bottom])
                            Text("")
                                .font(.system(.body, design: .serif))
                                .padding(.bottom)
                            Text("")
                                .font(.system(.body, design: .serif))
                                .padding(.bottom)
                            Text("I respect my grandfather a lot, because not only did he take care of me when I was little, but he also taught me the importance of learning. Born and raised in a farmer's family in a rural village in China, he was the first to get into the high school in the county town. In an age when few people seriously consider women's education in China, he sent two daughters to universities for higher education. Even though it was not his responsibility, he always supported my education and ideas. If not for him, I would not have been here studying my favorite major and pursuing my dream.")
                                .font(.system(.body, design: .serif))
                            Text("I hope he stays well and happy!")
                                .font(.system(.body, design: .serif))
                            HStack {
                                ForEach(1..<4) { index in
                                    Image("Grandpa-\(index)")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(maxWidth: 200)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.top)
                        }
                        Spacer(minLength: 100)
                    }.padding()
                }.tag(1)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            Text("Features and Technologies")
                                .font(.system(.largeTitle, design: .rounded).bold())
                                .padding(.bottom)
                            Text("Key Features")
                                .font(.system(.title3, design: .rounded).bold())
                                .padding(.bottom)
                            HStack {
                                Image("Feature-2")
                                    .resizable()
                                    .frame(height: 200)
                                    .aspectRatio(1228/782, contentMode: .fit)
                                Text("A Navigation View of plants to grow on every specific date, controlled by a Date Picker")
                                    .font(.system(.body, design: .serif))
                            }
                            HStack {
                                Image("Feature-1")
                                    .resizable()
                                    .aspectRatio(1228/782, contentMode: .fit)
                                    .frame(height: 200)
                                Text("An interactive Cover Flow styled seed gallery to browse every plant information")
                                    .font(.system(.body, design: .serif))
                            }
                            HStack {
                                Image("Feature-5")
                                    .resizable()
                                    .frame(height: 200)
                                    .aspectRatio(1228/782, contentMode: .fit)
                                Text("Plants' detail information page with a Reactive Header look. One-click to add todo and growth record, automatically generated according to plants' data")
                                    .font(.system(.body, design: .serif))
                            }
                            HStack {
                                Image("Feature-3")
                                    .resizable()
                                    .aspectRatio(1228/782, contentMode: .fit)
                                    .frame(height: 200)
                                Text("Reminder page uses a List to show todo, categorized by time distance")
                                    .font(.system(.body, design: .serif))
                            }
                            HStack {
                                Image("Feature-4")
                                    .resizable()
                                    .aspectRatio(1228/782, contentMode: .fit)
                                    .frame(height: 200)
                                Text("My Farm page shows planted crops in a styled Grid View.")
                                    .font(.system(.body, design: .serif))
                            }
                        }
                        Group {
                            Text("Future Plan and Next Steps")
                                .font(.system(.title3, design: .rounded).bold())
                                .padding(.top)
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Modify the guide pages and persist data for actual users.").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Add a magnifier, screen reading, or font size adjustment ability to better accommodate the elderly's  vision.").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Add reminder notification push ability and weather-related factors into reminders with network access.").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Try to use Core ML and Create ML to recognize the growing stages of a plant.").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Try to use ARKit to scan the farm field and generate a more realistic My Farm View with actual plant positions.").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("As I have learned how to make an app in Swift Playgrounds, I can now teach my younger sister coding since she showed interest and she has an iPad!").font(.system(.body, design: .serif))
                        }
                        Group {
                            Text("Third-party Open Source Packages")
                                .font(.system(.title3, design: .rounded).bold())
                                .padding(.top)
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Scrollview-Reactive-Header from swiftui-library, used for presenting detailed plant information.  [Github](https://github.com/swiftui-library/scrollview-reactive-header)").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("Loading-Button from changemin, used for presenting a loading state when creating reminders.  [Github](https://github.com/changemin/LoadingButton)").font(.system(.body, design: .serif))
                        }
                        Group {
                            Text("For more")
                                .font(.system(.title3, design: .rounded).bold())
                                .padding(.top)
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("You can read comments in each swift file").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("You can return to this guide with the button on the top-right corner of the first tab").font(.system(.body, design: .serif))
                            Text("\u{2022} ").font(.body.weight(.heavy))+Text("My [Github](https://github.com/iamGeoWat/)").font(.system(.body, design: .serif))
                        }
                        Spacer(minLength: 100)
                    }.padding()
                }.tag(2)
                
                VStack {
                    Text("Let's jump in!")
                        .font(.system(.largeTitle, design: .rounded).bold())
                }
                .padding()
                .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            VStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation {
                            if guideStep == 3 {
                                router = .mainContent
                            } else {
                                guideStep += 1
                            }
                            
                        }
                    } label: {
                        if guideStep == 3 {
                            Text("Finish Guide")
                                .frame(width: 220)
                        } else {
                            Text("Continue")
                                .frame(width: 220)
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }.padding([.bottom], 50)
            }
        }
    }
}
