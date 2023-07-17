import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var profilePic: String = ""
    @State private var fullName: String = ""
    @State private var icNumber: String = ""
    @State private var phone: String = ""
    @State private var gender: String = ""
    @State private var studentId: String = ""
    @State private var email: String = ""
    @State private var roomLevel: String = ""
    @State private var roomNumber: String = ""
    @State private var selectedHostel: DropdownMenuOption? = nil
    var hostels: [String] = ["KKS JPE", "KKS JT"]
    var programmes: [String] = ["BSE", "BCE", "BNS"]
    var studyLevels: [String] = ["DEGREE", "DIPLOMA", "ELIPS","FOUNDATION", "KLIP"]
    @State private var intakeHostel: [String] = ["FEBRUARY 2022", "JULY 2022"]
    @State private var studentStatus: [String] = ["NEW STUDENT", "RETURNING STUDENT"]
    @State private var emergencyContactName: String = ""
    @State private var emergencyContactPhone: String = ""
    @State private var emergencyContactCode: String = ""
    @State private var password: String = ""
    @AppStorage("uid") var userID: String = ""
    @Binding var currentShowingView: String
    
    private func isValidPassword(_ password: String) -> Bool {
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {

                List{
                    
                    HStack {
                        Text("Register")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding()
                    .listRowSeparator(.hidden)

                    HStack {
                        TextField("Full Name", text: $fullName)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .listRowSeparator(.hidden)
                    
                    
                    HStack {
                        TextField("Email", text: $email).textInputAutocapitalization(.never)
                        
                        Spacer()
                        
                        
                        if(email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        SecureField("Password", text: $password)
                        
                        Spacer()
                        
                        if(password.count != 0) {
                            
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password) ? .green : .red)
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        DropdownMenu(
                            selectedOption: self.$selectedHostel,
                            placeholder: "Select your hostel",
                            options:DropdownMenuOption.hostels
                        )
                    }
                   
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        Text("Emergency Contact Info")
                            .foregroundColor(.white)
                            .font(.headline)
                            .bold()
                    }
                    .padding()
                    .padding(.top)
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        TextField("Name", text: $emergencyContactName)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        TextField("Phone", text: $emergencyContactPhone)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        TextField("Register Code", text: $emergencyContactCode)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                    
                }
            
                Spacer()
                
                Button {action: do {
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                }} label: {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                        .padding(.horizontal)
                }
                
                Button {
                    
              
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            userID = authResult.user.uid
                            
                        }
                    }
                    
                } label: {
                    Text("Create New Account")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                        .padding(.horizontal)
                }
                
                
            }
            
        }
    }
}

