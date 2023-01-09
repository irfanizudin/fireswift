//
//  NoteEditorView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 07/01/23.
//

import SwiftUI

struct NoteEditorView: View {
    
    @StateObject var vm = NoteViewModel()
    @FocusState var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var id: String?
    let noteText: String
    
    var body: some View {
        ScrollView {
            TextField("Click to start writing...", text: $vm.noteText, axis: .vertical)
                .autocorrectionDisabled()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .focused($isFocused)
        }
        .padding(20)
        .navigationTitle("Note Editor")
        .navigationBarTitleDisplayMode(.inline)
        .scrollDismissesKeyboard(.interactively)
        .onAppear {
            vm.noteText = noteText
            isFocused = true
            print("id = ", id as Any)
            print("noteText = ", noteText)
        }
        .onDisappear {
            if id == nil {
                if vm.noteText != "" {
                    vm.addNote(text: vm.noteText)
                    print("saved")
                } else {
                    print("empty note")
                }
            } else {
                if let id = id {
                    if vm.noteText != "" {
                        vm.updateNote(id: id, text: vm.noteText)
                    } else {
                        vm.updateNote(id: id, text: vm.noteText)
                        vm.deleteNote(id: id)
                    }
                }
            }
        }
        .onTapGesture {
            isFocused = true
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    isFocused = false
                    dismiss()
                }
            }
        }
    }
}

struct NoteEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditorView(id: "123", noteText: "text")
    }
}
