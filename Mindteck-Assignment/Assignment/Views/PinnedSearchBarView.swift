//
//  PinnedSearchBarView.swift
//  Assignment
//
//  Created by Reddy Bharadwaj Chowdary on 31/08/24.
//

import SwiftUI

// MARK: - PinnedSearchBarView

struct PinnedSearchBarView: View {
    // MARK: - Binding Properties
    @Binding var text: String

    // MARK: - Body
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(.leading, 8)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}


// MARK: - Preview Provider

struct PinnedSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a State property to hold the sample search text
        StatePreview()
            .previewLayout(.sizeThatFits)
            .padding()
    }
    
    struct StatePreview: View {
        @State private var searchText: String = "Sample Search"
        
        var body: some View {
            PinnedSearchBarView(text: $searchText)
                .padding()
        }
    }
}
