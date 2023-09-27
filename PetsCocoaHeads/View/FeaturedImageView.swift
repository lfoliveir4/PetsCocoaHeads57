import SwiftUI

struct FeaturedImageView: View {
    let model: FeaturedImageUIModel

    init(model: FeaturedImageUIModel) {
        self.model = model
    }

    var body: some View {
        AsyncImage(url: model.imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    FeaturedImageView(model: .init(imageURL: URL(string: "https://s1.1zoom.me/big0/712/Dogs_Beach_Glasses_Spitz_Funny_536656_1280x851.jpg")!))
}
