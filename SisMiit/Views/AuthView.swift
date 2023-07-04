import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login" // login or signup
        
    var body: some View {
        
        if(currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else if(currentViewShowing == "hostelSignUp" || currentViewShowing == "otherSignUp") {
            SignupView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
  
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
