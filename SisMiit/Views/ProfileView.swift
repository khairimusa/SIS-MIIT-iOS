import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        
        NavigationView {
                Form{
                    Section() {
                        Image("Profile-Image")
                            .resizable()
                            .clipped()
                            .frame(width: 100, height: 100, alignment: .center)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                        
                        Text("Mohammad Khairi Bin Musa").fontWeight(.bold)    .multilineTextAlignment(.center)
                        
                        HStack {
                            Text("Student ID")
                            Spacer(minLength: 50)
                            Text("52361120002").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Student IC")
                            Spacer(minLength: 50)
                            Text("971282737373").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Phone")
                            Spacer(minLength: 50)
                            Text("014276881723").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Gender")
                            Spacer(minLength: 50)
                            Text("MALE").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Email")
                            Spacer(minLength: 50)
                            Text("khairimusa@test.com").multilineTextAlignment(.trailing)
                        }
                    }
                    Section(header: Text("Residential Information")) {
                        HStack {
                            Text("Room Level")
                            Spacer(minLength: 50)
                            Text("4").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Room Number")
                            Spacer(minLength: 50)
                            Text("1AC").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Hostel")
                            Spacer(minLength: 50)
                            Text("KKS JPE").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Intake Hostel")
                            Spacer(minLength: 50)
                            Text("AUG 2021").multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Student Status")
                            Spacer(minLength: 50)
                            Text("RETURNING STUDENT")    .multilineTextAlignment(.trailing)
                        }
                    }
                    Section(header: Text("Emergency Contact")) {
                        Text("Ali Bin Abu Talib").fontWeight(.bold)    .multilineTextAlignment(.center)
                        
                        HStack {
                            Text("Phone")
                            Spacer(minLength: 50)
                            Text("0146251162").multilineTextAlignment(.trailing)
                        }
                    }
                    Section(header: Text("Education Information")) {
                        Text("Master of Software Engineer").fontWeight(.bold)    .multilineTextAlignment(.center)
                        HStack {
                            Text("Level of Study")
                            Spacer(minLength: 20)
                            Text("MASTER")
                        }
                        HStack {
                            Text("Campus")
                            Spacer(minLength: 20)
                            Text("UniKL MIIT")
                        }
                    }
                } .navigationTitle(Text("Profile"))
        }
        
//        ZStack{
//            Color.brown
//            VStack{
//                Button(action: {
//                    let firebaseAuth = Auth.auth()
//                    do {
//                        try firebaseAuth.signOut()
//                        withAnimation {
//                            userID = ""
//                        }
//                    } catch let signOutError as NSError {
//                        print("Error signing out: %@", signOutError)
//                    }
//                }) {
//                    Text("Sign Out")
//                }
//                .buttonStyle(.borderedProminent)
//                .tint(.red)
//            }
//        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
