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
//                    VStack {
                        NoteListView()
//                    }
                } else {
                    LoginView()
                }
            }
        }
        .onAppear {
            // vm.checkUserStatus()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
