//
//  NoteViewModel.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 07/01/23.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var noteText: String = ""
}
