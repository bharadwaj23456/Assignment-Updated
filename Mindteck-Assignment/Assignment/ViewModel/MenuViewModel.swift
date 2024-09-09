


import Foundation
import SwiftUI

// MARK: - ViewModel

class MenuViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var images: [String] = []
    @Published var searchText = ""
    @Published var selectedIndex = 0
    @Published var allItems: [Item] = []
    
    // MARK: - Computed Properties
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Initializer
    init() {
        loadData()
    }
    
    // MARK: - Data Loading
    func loadData() {
        if let url = Bundle.main.url(forResource: "menuData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let menuData = try decoder.decode(MenuData.self, from: data)
                self.images = menuData.images
                self.allItems = menuData.items
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
    }
}
