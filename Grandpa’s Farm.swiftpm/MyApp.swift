/*
 Author: Xikai Liu
 Description: MyApp
 */

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            RouterView()
                .preferredColorScheme(.dark)
                .environmentObject(appData)
        }
    }
}
