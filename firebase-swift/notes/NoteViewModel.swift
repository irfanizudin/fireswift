//
//  NoteViewModel.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 07/01/23.
//

import Foundation
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var noteText: String = ""
    @Published var notes: [Note] = []

    
    let dbReference = Firestore.firestore().collection("Notes")
    
    init() {
        fetchNotes()
    }
    
    func fetchNotes() {
        dbReference.order(by: "updatedAt", descending: true).addSnapshotListener { [weak self] snapshot, error in
            guard let document = snapshot?.documents, error == nil else {
                return
            }
                        
            self?.notes = document.compactMap({ snapshot in
                return try? snapshot.data(as: Note.self)
            })
        }
    }
    
    func addNote(text: String) {
        let data: [String: Any] = [
            "text": text,
            "createdAt": Timestamp(date: Date()),
            "updatedAt": Timestamp(date: Date())
        ]
        dbReference.document().setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Note succesfully added")
                }
            }
    }
    
    func updateNote(id: String, text: String) {
        let data: [String: Any] = [
            "text": text,
            "updatedAt": Timestamp(date: Date())
        ]
        let _ = dbReference.document(id).updateData(data) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Note update succesfully")
            }
        }
    }
    
    func deleteNote(id: String) {
        let _ = dbReference.document(id).delete { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Note with id \(id) has been deleted")
            }
        }
    }
    
}
