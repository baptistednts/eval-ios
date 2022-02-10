//
//  Crypto.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import Foundation
import FirebaseFirestoreSwift

class CryptoItem: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String?
    var abreviation: String?
    var price: Int?
    var marketcap: Int?
    var rank: Int?
}
