import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        ZStack{
            Color.brown
            VStack{
                Text("Profile View")
                Text("Logged In! Your user id is \(userID)")
                Button(action: {
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                        withAnimation {
                            userID = ""
                        }
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }) {
                    Text("Sign Out")
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
