//
//  HomeView.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            if let user = model.user {
                VStack {
                    Text("Hello, \(user.uid)")
                    List(model.items) { Item in
                        let name = Item.name ?? "No name"
                        Text("Crypto: \(name)")
                    }
                }
            } else {
                LogInView()
            }
            
            if let errorMessage = model.errorMessage {
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
