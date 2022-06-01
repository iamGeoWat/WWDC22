/*
 Author: Xikai Liu
 Description: ToGrowListItem
 */

import SwiftUI

struct ToGrowListItem: View {
    @State private var isPopoverPresented: Bool = false
    @Binding var plant: Plant
    
    var body: some View {
        HStack {
            Image(plant.icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(10)
                .frame(height: 50)
            
            VStack(alignment: .leading) {
                Text(plant.name)
                Text(plant.botanical)
                    .font(.system(.footnote, design: .serif).italic())
            }
        }
        .padding(10)
    }
}
