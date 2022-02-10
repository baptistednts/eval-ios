//
//  HomeView.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import SwiftUI
import XCTest

struct HomeView: View {
    @EnvironmentObject var model: ViewModel
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = model.user {
                    VStack {
                        Text("Hello, \(user.uid)")
                        List(model.items) { cryptoItem in
                            NavigationLink(destination: DetailView(cryptoItem: cryptoItem)) {
                                let name = cryptoItem.name ?? "No name"
                                Text("\(name)")
                            }
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
            }
            .navigationBarTitle("Your crypto list")
            .padding()
        }
    }
    
    func removeCrypto(at offsets: IndexSet) {
        expenses.cryptoList.remove(atOffsets: offsets)
    }
}

struct DetailView: View {
    let cryptoItem: CryptoItem
    
    var body: some View {
        Text(cryptoItem.name ?? "No name")
        Text(cryptoItem.abreviation ?? "No abreviation")
        Text("\(cryptoItem.price ?? 0)")
        Text("\(cryptoItem.marketcap ?? 0)")
        Text("\(cryptoItem.rank ?? 0)")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
