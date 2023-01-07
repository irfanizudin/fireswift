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
    @Published var isLoading: Bool = false
    @Published var showLogin: Bool = false
    @Published var showSignOutAlert: Bool = false
        
    init() {
        checkUserStatus()
    }
    
    func checkUserStatus() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if user != nil {
                self?.signedIn.toggle()
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> ()) {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result , error in
            guard result != nil, error == nil else {
                completion(.failure(error!))
                self?.isLoading = false
                return
            }
            
            completion(.success(result))
            DispatchQueue.main.async {
                self?.signedIn = true
                self?.isLoading = false
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> ()) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                completion(.failure(error!))
                self?.isLoading = false
                return
            }
                        
            completion(.success(result))
            DispatchQueue.main.async {
                self?.signedIn = true
                self?.isLoading = false
            }

        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.signedIn = false
    }
}
