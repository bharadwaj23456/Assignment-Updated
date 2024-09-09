//
//  CarouselView.swift
//  Assignment
//
//  Created by Reddy Bharadwaj Chowdary on 31/08/24.
//

import SwiftUI

// MARK: - CarouselView

struct CarouselView: View {
    // MARK: - Properties
    var images: [String]
    @Binding var selectedIndex: Int

    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(images: ["fried-cheese-ravioli", "Blackend-Shrimp", "chicken-avacado-spring-roll"], selectedIndex: .constant(0))
    }
}
