import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?

    private func starType(index: Int) -> String {
        if let rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundColor(.orange)
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
