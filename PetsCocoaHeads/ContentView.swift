import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: PetListViewModel

    init() {
        _viewModel = StateObject(wrappedValue: PetListViewModel(service: LocalService()))
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
                .listStyle(.plain)
                .navigationTitle("Pets")
            }.task {
                await viewModel.load()
            }
        }   
    }
}
    
#Preview {
    ContentView()
}
