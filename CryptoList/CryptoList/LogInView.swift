//
//  LogInView.swift
//  CryptoList
//
//  Created by Baptiste Dantas on 09/02/2022.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @EnvironmentObject var model: ViewModel
    @State var mail = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
            TextField("mail@example.com", text: $mail)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            Text("Password")
            SecureField("", text: $password)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                model.login(mail: mail, password: password)
            }, label: {
                Text("LOGIN")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            })
            .frame(width: 100, height: 20, alignment: .center)
            .padding()
            .background(Color.blue)
            .cornerRadius(15)
        }
        .navigationBarTitle("")
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
