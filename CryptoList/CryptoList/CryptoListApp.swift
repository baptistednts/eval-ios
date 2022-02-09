//
//  CryptoListApp.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import SwiftUI
import Firebase

@main
struct CryptoListApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
