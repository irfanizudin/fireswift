//
//  SignUpView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 27/12/22.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("fireswift-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                Text("Fireswift")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 20)
                Text("Create Account")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 40)
                
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
                    vm.signUp(email: vm.email, password: vm.password) { result in
                        switch result {
                        case .success(let data):
                            print(data as Any)
                        case .failure(let error):
                            vm.errorMessage = error.localizedDescription
                            print(error.localizedDescription)
                            if !vm.errorMessage.isEmpty {
                                vm.showErrorAlert = true
                            }
                        }
                    }
                } label: {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .disabled(vm.email.isEmpty || vm.password.isEmpty)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .alert("Create Account Failed", isPresented: $vm.showErrorAlert, actions: {
                Button("OK", role: .none) {
                }
            }, message: {
                Text(vm.errorMessage)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            }
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
