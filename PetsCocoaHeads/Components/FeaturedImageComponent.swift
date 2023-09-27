import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    let model: FeaturedImageUIModel
    let id = UUID()

    func render() -> AnyView {
        FeaturedImageView(model: model).toAnyView()
    }
}
