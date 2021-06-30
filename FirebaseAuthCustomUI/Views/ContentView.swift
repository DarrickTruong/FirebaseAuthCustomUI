//
//  ContentView.swift
//  FirebaseAuthCustomUI
//
//  Created by Darrick_Truong on 6/30/21.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @Binding var isLoggedIn:Bool
    
    var body: some View {
        
        VStack {
            Text("Welcome World")
            Button(action: {
                
                try! Auth.auth().signOut()
                isLoggedIn = false
                
            }, label: {
                Text("Sign out")
            })
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
