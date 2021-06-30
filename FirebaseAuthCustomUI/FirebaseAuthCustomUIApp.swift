//
//  FirebaseAuthCustomUIApp.swift
//  FirebaseAuthCustomUI
//
//  Created by Darrick_Truong on 6/30/21.
//

import SwiftUI
import Firebase


@main
struct FirebaseAuthCustomUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
        }
    }
}
