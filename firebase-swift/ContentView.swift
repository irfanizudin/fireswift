//
//  ContentView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 27/12/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.signedIn {
                    VStack {
                        Text("You are logged in")
                        Button {
                            vm.signOut()
                        } label: {
                            Text("Sign Out")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 30)
                } else {
                    LoginView()
                }
            }
        }
        .onAppear {
//            vm.checkUserStatus()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
