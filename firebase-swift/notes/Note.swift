//
//  Note.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 06/01/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Note: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let text: String
}
