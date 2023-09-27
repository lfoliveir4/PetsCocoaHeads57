import SwiftUI

struct CarouselView: View {
    let model: CarouselUIModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(model.items, id: \.petId) { item in

                    Navigator.perform(
                        action: model.action,
                        payload: item
                    ) {
                        AsyncImage(url: item.imageURL) { image in
                            image
                                .resizable()
                                .frame(width: 250, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }
    }
}
