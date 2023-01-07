//
//  NoteListView.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 06/01/23.
//

import SwiftUI

struct NoteListView: View {

    var notes = [
        Note(text: "Learn React"),
        Note(text: "Learn Swift"),
        Note(text: "Learn UIKit")
    ]

    var body: some View {
        NavigationView {
            List(notes, id: \.self) { note in
                NavigationLink {
                    Text(note.text)
                } label: {
                    Text(note.text)
                }
            }
            .navigationTitle("Notes")
        }

    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
