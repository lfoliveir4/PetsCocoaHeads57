import SwiftUI

struct PetDetailView: View {
    let carouselRowItemModel: CarouselRowItemModel?
    let rowUIModel: RowUIModel?

    init(
        carouselRowItemModel: CarouselRowItemModel?,
        rowUIModel: RowUIModel?
    ) {
        self.carouselRowItemModel = carouselRowItemModel
        self.rowUIModel = rowUIModel
    }

    var body: some View {
        ScrollView {
            AsyncImage(url: carouselRowItemModel?.imageURL ?? rowUIModel?.imageUrl) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 350)
            } placeholder: {
                ProgressView()
            }

            Text(rowUIModel?.title ?? "")
                .padding()

            Text(rowUIModel?.subTitle ?? "")
                .padding()

            Text((carouselRowItemModel?.description ?? rowUIModel?.description) ?? "")
                .padding()
            
            RatingView(rating: .constant(carouselRowItemModel?.rating))
        }
    }
}


#Preview {
    PetDetailView(carouselRowItemModel: .init(
        petId: 1,
        imageURL: URL(string: "https://images.unsplash.com/photo-1589883661923-6476cb0ae9f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2574&q=80")!,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        rating: 2), rowUIModel: nil
    )
}
