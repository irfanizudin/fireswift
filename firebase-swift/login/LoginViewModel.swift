//
//  LoginViewModel.swift
//  firebase-swift
//
//  Created by Irfan Izudin on 27/12/22.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signedIn: Bool = false
    @Published var showCreateAccountPage: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result , error in
            guard result != nil, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                completion(.failure(error!))
                return
            }
                        
            completion(.success(result))
            DispatchQueue.main.async {
                self?.signedIn = true
            }

        }
    }
}
