//
//  ViewModel.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import SwiftUI
import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class ViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var items = [CryptoItem]()
    
    var listener: ListenerRegistration?
    var subscription: AnyCancellable?
    
    init() {
        subscription = $user.sink(receiveValue: { [weak self] user in
            self?.setListener(user: user)
        })
    }
}

extension ViewModel {
    func login(mail: String, password: String) {
        Task {
            do {
                let authResult = try await Auth.auth().signIn(withEmail: mail, password: password)
                errorMessage = .none
                user = authResult.user
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            errorMessage = .none
            user = .none
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func snapshotListener(querySnapchot: QuerySnapshot?, error: Error?) {
        if let error = error {
            errorMessage = error.localizedDescription
        }
        
        if let documents = querySnapchot?.documents {
            print("Documents : \(documents)")
            do {
                items = try documents.compactMap( {document in
                    let items = try document.data(as: CryptoItem.self)
                    return items
                })
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func setListener(user: User?) {
        if let existingListener = listener {
            existingListener.remove()
            print("Existing listener removed")
            listener = .none
            items = []
        }
        
        if let user = user {
            let collection = Firestore.firestore().collection("cryptoList")
            listener = collection.addSnapshotListener { [weak self] (querySnapshot, error) in
                self?.snapshotListener(querySnapchot: querySnapshot, error: error)
            }
            print("Listener added for \(user.uid)")
        }
    }
}
