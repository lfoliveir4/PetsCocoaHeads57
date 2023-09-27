import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    let model: CarouselUIModel
    let id = UUID()

    func render() -> AnyView {
        CarouselView(model: model).toAnyView()
    }
}
