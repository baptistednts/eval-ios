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
    
    @State var cryptos: [String] = [
        "Solana", "Polygon", "Chiliz", "Swissborg"
    ]
    
    var body: some View {
        NavigationView {
            if let user = model.user {
                Text("Top crypto Today")
                List(model.items) { cryptoItem in
                    NavigationLink(destination: DetailView(cryptoItem: cryptoItem)) {
                        let name = cryptoItem.name ?? "No name"
                        Text("\(name)")
                    }
                }
                List {
                    Section (header: Text("Moove, Add & Delete crypto")) {
                        ForEach(cryptos, id: \.self) {
                            crypto in
                            Text(crypto.capitalized)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: { indices, newOffset in
                            cryptos.move(fromOffsets: indices, toOffset: newOffset)
                        })
                    }
                }
                .navigationBarItems(leading: EditButton(), trailing: addButton)
            } else {
                LogInView()
            }
                
            if let errorMessage = model.errorMessage {
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        cryptos.remove(atOffsets: indexSet)
    }
    
    func add() {
        cryptos.append("Binance Coin")
    }
    
    var addButton: some View {
        Button("Add", action: {
            add()
            
        })
    }
}

struct DetailView: View {
    let cryptoItem: CryptoItem
    
    var body: some View {
        Text(cryptoItem.name ?? "No name").fontWeight(.bold).font(.title)
        Divider()
        Text("\(cryptoItem.rank ?? 0) ")
        + Text(cryptoItem.abreviation ?? "No abreviation").font(.headline)
        Divider()
        Text("Price: ")
        + Text("$\(cryptoItem.price ?? 0)").font(.headline)
        Divider()
        Text("MarketCap: ")
        + Text("$\(cryptoItem.marketcap ?? 0)").font(.headline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
