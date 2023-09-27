import SwiftUI

struct RowComponent: UIComponent {

    let id = UUID()
    let model: RowUIModel

    func render() -> AnyView {
        HStack {
            if let imageUrl = model.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            }

            VStack {
                Text(model.title)
                Text(model.subTitle ?? "").opacity(0.4)
                Text(model.description ?? "")
            }
            .padding()
            .toAnyView()
        }.toAnyView()
    }
}
