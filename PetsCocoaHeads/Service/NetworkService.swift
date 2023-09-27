import Foundation

protocol NetworkService {
    func load(_ forResource: String) async throws -> ScreenModel
}
