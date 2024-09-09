//
//  MenuData.swift
//  Assignment
//
//  Created by Reddy Bharadwaj Chowdary on 09/09/24.
//

import Foundation

// MenuData model which contains both images and items
struct MenuData: Codable {
    let images: [String]
    let items: [Item]
}
