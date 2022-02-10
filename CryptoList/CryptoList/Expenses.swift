//
//  Expenses.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var cryptoList = [AddCryptoItem]()
}
