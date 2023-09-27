import Foundation
import SwiftUI

@MainActor
class PetListViewModel: ObservableObject {
    private var service: NetworkService

    @Published var components: [UIComponent] = []

    init(service: NetworkService) {
        self.service = service
    }

    func load() async {
        do {
            let screenModel = try await service.load("pet-listing")
            self.components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
