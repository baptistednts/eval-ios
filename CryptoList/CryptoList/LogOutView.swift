//
//  LogOutView.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import SwiftUI

struct LogOutView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                model.logout()
            }, label: {
                Text("LOGOUT")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            })
            .frame(width: 100, height: 20, alignment: .center)
            .padding()
            .background(Color.blue)
            .cornerRadius(15)
        }.padding()
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView()
    }
}
