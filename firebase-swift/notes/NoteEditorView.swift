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
    let noteText: String
    
    var body: some View {
        VStack {
            TextField("Click to start writing...", text: $vm.noteText, axis: .vertical)
                .autocorrectionDisabled()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .focused($isFocused)
        }
        .padding(.horizontal, 20)
        .navigationTitle("Note Editor")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            vm.noteText = noteText
            isFocused = true
        }
    }
}

struct NoteEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditorView(noteText: "text")
    }
}
