import Foundation
import SwiftUI

struct RatingComponent: UIComponent {
    let model: RatingUIModel
    let id = UUID()

    func render() -> AnyView {
        RatingView(rating: .constant(model.rating)).toAnyView()
    }
}
