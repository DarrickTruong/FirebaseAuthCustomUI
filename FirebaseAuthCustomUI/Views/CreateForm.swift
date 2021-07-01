//
//  LoginForm.swift
//  FirebaseAuthCustomUI
//
//  Created by Darrick_Truong on 6/30/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct CreateForm: View {
    
    @Binding var showCreateForm: Bool
    
    @State private var email:String = ""
    @State private var name:String = ""
    @State private var password:String = ""
    @State private var errorMessage:String?
    @State private var firstName = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section{
                    TextField("Email", text: $email)
                    TextField("Name", text: $firstName)
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
                    
                    saveFirstName()
                    
                    
                    // Dismiss this sheet
                    showCreateForm = false
                }
            }
        }
    }
    
    func saveFirstName() {
        
        if let currentUser = Auth.auth().currentUser{
            let cleansedFirstName = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let db = Firestore.firestore()
            
            db.collection("users").document(currentUser.uid).setData(["firstName":cleansedFirstName]) { error in
                
                if let error = error {
                    print(error.localizedDescription)
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
