//
//  LoginView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 27/12/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("fireswift-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("Fireswift Login")
                .font(.title)
                .bold()
                .padding()
            VStack {
                VStack (alignment: .leading) {
                    Text("Email")
                        .font(.callout)
                    TextField("Enter email here...", text: $vm.email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(UIColor.secondarySystemFill))
                        .cornerRadius(10)
                }

                VStack (alignment: .leading) {
                    Text("Password")
                        .font(.callout)
                    SecureField("Enter password here...", text: $vm.password)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .padding()
                        .background(Color(UIColor.secondarySystemFill))
                        .cornerRadius(10)
                }
                .padding(.top)
                
            }.padding(.vertical, 30)
            
            Button {
                //login
            } label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding(.horizontal, 30)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
