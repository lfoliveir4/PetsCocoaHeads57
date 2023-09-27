import Foundation

struct CarouselUIModel: Decodable {
    let items: [CarouselRowItemModel]
    let action: Action
}

struct CarouselRowItemModel: Decodable, Identifiable {
    let id = UUID()
    let petId: Int
    let imageURL: URL
    let description: String
    let rating: Int

    private enum CodingKeys: String, CodingKey {
        case petId
        case imageURL
        case description
        case rating
    }
}
