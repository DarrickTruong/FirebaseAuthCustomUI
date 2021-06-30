//
//  LoginForm.swift
//  FirebaseAuthCustomUI
//
//  Created by Darrick_Truong on 6/30/21.
//

import SwiftUI
import FirebaseAuth

struct CreateForm: View {
    
    @Binding var showCreateForm: Bool
    
    @State private var email:String = ""
    @State private var name:String = ""
    @State private var password:String = ""
    @State private var errorMessage:String?
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section{
                    TextField("Email", text: $email)
                    TextField("Name", text: $name)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    createAccount()
                }, label: {
                    Text("Create Account")
                })
            }.navigationBarTitle("Create Account")
        }
    }
    
    func createAccount() {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            DispatchQueue.main.async {

                if error != nil {
                    // error creating Account
                    errorMessage = error!.localizedDescription
                } else {
                    
                    // Success
                    
                    // Dismiss this sheet
                    showCreateForm = false
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
