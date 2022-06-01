/*
 Author: Xikai Liu
 Description: This View decides wether to show guide pages,
 may not be used in the actual product.
 */

import SwiftUI

struct RouterView: View {
    @State var routerContent = AppRouter.guideView
    
    var body: some View {
        switch routerContent {
            case AppRouter.guideView:
            GuideView(router: $routerContent)
            case AppRouter.mainContent:
            ContentView(router: $routerContent)
        }
    }
}
