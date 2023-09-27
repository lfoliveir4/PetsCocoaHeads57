import Foundation

enum ComponentError: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
    case rating
    case list
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: Any]

    private enum CodingKeys: CodingKey {
        case type
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
}


struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

extension ScreenModel {
    func buildComponents() throws -> [UIComponent] {
        var components: [UIComponent] = []

        try self.components.forEach { component in
            try makeComponent(component, components: &components)
        }

        return components
    }

    private func makeComponent(
        _ component: ComponentModel,
        components: inout [UIComponent]
    ) throws {
        switch component.type {
        case .featuredImage:
            guard let model: FeaturedImageUIModel = component.data.decode() else {
                throw ComponentError.decodingError
            }
            components.append(FeaturedImageComponent(model: model))

        case .carousel:
            guard let model: CarouselUIModel = component.data.decode() else {
                throw ComponentError.decodingError
            }

            components.append(CarouselComponent(model: model))

        case .rating:
            guard let model: RatingUIModel = component.data.decode() else {
                throw ComponentError.decodingError
            }

            components.append(RatingComponent(model: model))

        case .list:
            guard let model: ListUIModel = component.data.decode() else {
                throw ComponentError.decodingError
            }

            components.append(ListComponent(model: model))
        }
    }
}
