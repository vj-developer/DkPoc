import SwiftUI
import DkPocUI
import ComposableArchitecture

@main
struct DkPocApp: App {
    
    static let store = Store(initialState: Counter.State()) {
        Counter()
          ._printChanges()
      }
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            CounterView(store: DkPocApp.store)
        } 
    }
}
