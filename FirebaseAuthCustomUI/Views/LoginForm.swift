//
//  LoginForm.swift
//  FirebaseAuthCustomUI
//
//  Created by Darrick_Truong on 6/30/21.
//

import SwiftUI
import FirebaseAuth

struct LoginForm: View {
    
    @Binding var showLoginForm: Bool
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var errorMessage:String?
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section{
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    signIn()
                }, label: {
                    Text("Sign In")
                })
            }.navigationBarTitle("Sign In")
        }
    }
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            DispatchQueue.main.async {

                if error != nil {
                    // error logging in
                    errorMessage = error!.localizedDescription
                } else {
                    // Success
                    
                    // Dismiss this sheet
                    showLoginForm = false
                }
            }
        }
    }
}

//struct LoginForm_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginForm()
//    }
//}
