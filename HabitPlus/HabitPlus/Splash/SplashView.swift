import SwiftUI

struct SplashView: View {
  
  @ObservedObject var viewModel: SplashViewModel
  
    var body: some View {
      Group {
        switch viewModel.uiState {
        case .loading:
          loadView()
        case .goToSignInScreen:
          viewModel.signInView()
        case .goToHome:
          Text("Carrega home")
        case .error(let message):
          loadView(error: message)
        }
      }.onAppear(perform: {
        viewModel.onAppear()
      })
    }
}

extension SplashView {
  func loadView(error: String? = nil) -> some View {
    ZStack {
      Image("logo")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(Color.white)
        .ignoresSafeArea()
      
      if let error = error {
        Text("")
          .alert(isPresented: .constant(true)) {
            Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")) {
              // faz algo quando some o alerta
            })
          }
       }
    }
  }
}

#Preview {
  let viewModel = SplashViewModel()
  return SplashView(viewModel: viewModel)
}
