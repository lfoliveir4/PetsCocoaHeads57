import Foundation
import SwiftUI


struct SheetView<V: View>: View {
    @State private var isPresented: Bool = false
    let content: () -> V
    let destinationView: AnyView

    var body: some View {
        content().onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented) {
            destinationView
        }
    }
}

class Navigator {
    static func perform<V: View>(
        action: Action,
        payload: Any? = nil,
        content: @escaping () -> V
    ) -> AnyView {
        var destinationView: AnyView!

        switch action.route {
        case .petDetail:
            if let payload = payload as? CarouselRowItemModel {
                destinationView = PetDetailView(
                    carouselRowItemModel: payload,
                    rowUIModel: nil
                ).toAnyView()
            } else if let payload = payload as? RowUIModel {
                destinationView = PetDetailView(
                    carouselRowItemModel: nil,
                    rowUIModel: payload
                ).toAnyView()
            } else {
                destinationView = EmptyView().toAnyView()
            }
        }

        switch action.type {
        case .sheet:
            return SheetView(content: { content() }, destinationView: destinationView).toAnyView()

        case .push:
            return NavigationLink {
                destinationView
            } label: {
                content()
            }.toAnyView()
        }
    }
}
