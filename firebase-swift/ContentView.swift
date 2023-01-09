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
        NoteListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
