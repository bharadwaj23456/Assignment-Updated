



import Foundation

// Item model conforms to Codable (both Decodable and Encodable)
struct Item: Codable, Identifiable {
    let id = UUID()  // Automatically generates a unique ID
    let name: String
}

