//
//  NoteListView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 06/01/23.
//

import SwiftUI

struct NoteListView: View {

    @StateObject var vm = LoginViewModel()
    var notes = [
        Note(text: "Learn React"),
        Note(text: "Learn Swift"),
        Note(text: "Learn UIKit")
    ]

    var body: some View {
        NavigationView {
            List(notes, id: \.id) { note in
                NavigationLink {
                    NoteEditorView(noteText: note.text)
                } label: {
                    Text(note.text)
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.signOut()
                        vm.showSignOutAlert = true
                    } label: {
                        Image(systemName: "ipad.and.arrow.forward")
                            .foregroundColor(Color(UIColor.label))
                    }

                }
            }
            .alert("Sign Out", isPresented: $vm.showSignOutAlert, actions: {
                Button("Yes", role: .none) {
                    vm.showLogin = true
                }
                Button("Cancel", role: .cancel) {
                }
            }, message: {
                Text("Are you sure want to sign out?")
            })
            .fullScreenCover(isPresented: $vm.showLogin) {
                LoginView()
            }
        }

    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
