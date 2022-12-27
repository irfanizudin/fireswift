//
//  LoginViewModel.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 27/12/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
