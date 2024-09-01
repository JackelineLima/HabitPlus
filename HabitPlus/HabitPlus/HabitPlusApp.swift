import SwiftUI

@main
struct HabitPlusApp: App {
    var body: some Scene {
        WindowGroup {
          let viewModel = SplashViewModel()
          SplashView(viewModel: viewModel)
        }
    }
}
