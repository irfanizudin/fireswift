//
//  NoteListView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 06/01/23.
//

import SwiftUI

struct NoteListView: View {

    @StateObject var vm = LoginViewModel()
    @StateObject var vmNote = NoteViewModel()
    
    var body: some View {
        NavigationView {
            List(vmNote.notes, id: \.self) { note in
                NavigationLink {
                    NoteEditorView(id: note.id, noteText: note.text)
                } label: {
                    Text(note.text)
                }
                .swipeActions(content: {
                    Button(role: .destructive) {
                        guard let id = note.id else { return }
                        vmNote.deleteNote(id: id)
                    } label: {
                        Image(systemName: "trash")
                    }
                })
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.showSignOutAlert = true
                    } label: {
                        Image(systemName: "ipad.and.arrow.forward")
                            .foregroundColor(.accentColor)
                    }

                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(vmNote.notes.count) notes")
                    Spacer()
                    NavigationLink {
                        NoteEditorView(noteText: "")
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .alert("Sign Out", isPresented: $vm.showSignOutAlert, actions: {
                Button("Yes", role: .none) {
                    vm.signOut()
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
