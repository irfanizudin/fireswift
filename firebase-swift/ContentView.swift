//
//  ContentView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 27/12/22.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.signedIn {
                    Text("You are logged in")
                } else {
                    LoginView()
                }
            }
            .onAppear {
                vm.signedIn = vm.isSignedIn
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
