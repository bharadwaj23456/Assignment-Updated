//
//  ContentView.swift
//  Assignment
//
//  Created by Reddy Bharadwaj Chowdary on 31/08/24.
//


import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    // MARK: - State Properties
    @StateObject private var viewModel = MenuViewModel()
    @State private var searchBarOffset: CGFloat = 0
    @State private var isSearchBarPinned = false

    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 10) {
                        // MARK: - Image Carousel
                        CarouselView(images: viewModel.images, selectedIndex: $viewModel.selectedIndex)
                            .frame(height: 300)
                        
                        // MARK: - Sticky Search Bar
                        GeometryReader { geo in
                            PinnedSearchBarView(text: $viewModel.searchText)
                                .background(Color(.systemGray6))
                                .onAppear {
                                    searchBarOffset = geo.frame(in: .global).minY
                                }
                                .onChange(of: geo.frame(in: .global).minY) { newOffset in
                                    if newOffset < searchBarOffset {
                                        isSearchBarPinned = true
                                    } else {
                                        isSearchBarPinned = false
                                    }
                                }
                        }
                        .frame(height: 60)
                        .padding(.horizontal)

                        // MARK: - List
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.filteredItems) { item in
                                Text(item.name)
                                    .padding()
                                Divider()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // MARK: - Conditionally Rendered Pinned Search Bar
                if isSearchBarPinned {
                    PinnedSearchBarView(text: $viewModel.searchText)
                        .background(Color(.systemGray6))
                        .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                        .transition(.slide)
                        .animation(.easeInOut)
                }
            }
        }
        .edgesIgnoringSafeArea(isSearchBarPinned ? .top : [])
    }
}



// MARK: - Preview Provider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating a sample view model with dummy data
        let sampleViewModel = MenuViewModel()
        sampleViewModel.images = ["fried-cheese-ravioli", "Blackend-Shrimp", "chicken-avacado-spring-roll"]
       
        
        return ContentView()
            .environmentObject(sampleViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
