//
//  LaunchView.swift
//  FirebaseAuthCustomUI
//
//  Created by Darrick_Truong on 6/30/21.
//

import SwiftUI
import FirebaseAuth

struct LaunchView: View {
    
    @State var showLoginForm = false
    @State var showCreateForm = false
    
    // should put isLoggedIn in ContentModel
    @State var isLoggedIn = false
    
    var userID:String = ""
    
    var body: some View {
        
        if !isLoggedIn {
            
            VStack(spacing: 10) {
                
                // Sign in button
                Button(action: {
                    
                    showLoginForm = true
                }, label: {
                    Text("Sign In")
                })
                .sheet(isPresented: $showLoginForm, onDismiss: checkLogin, content: {
                    LoginForm(showLoginForm: $showLoginForm)
                })
                
                
                // create account button
                Button(action: {
                    showCreateForm = true
                }, label: {
                    Text("Create Account")
                })
                .sheet(isPresented: $showCreateForm, onDismiss: checkLogin, content: {
                    CreateForm(showCreateForm: $showCreateForm)
                })
            }
            .onAppear(perform: {
                checkLogin()
            })
            
        } else {
            
            ContentView(isLoggedIn: $isLoggedIn)
        }
    }
    
    func checkLogin() {
        
        isLoggedIn = Auth.auth().currentUser == nil ? false : true
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
