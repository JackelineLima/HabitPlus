import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel
  
  var body: some View {
    Text("Tela de signIn")
  }
}

#Preview {
  let viewModel = SignInViewModel()
  return SignInView(viewModel: viewModel)
}
