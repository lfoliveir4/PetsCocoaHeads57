import Foundation
import SwiftUI

struct ListComponent: UIComponent {
    let id = UUID()
    let model: ListUIModel

    func render() -> AnyView {
        ForEach(model.rows, id: \.id) { row in
            Navigator.perform(action: model.action, payload: row) {
                RowComponent(model: row).render().toAnyView()
            }
        }.toAnyView()
    }
}
