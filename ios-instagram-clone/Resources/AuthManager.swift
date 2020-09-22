//
//  authManager.swift
//  ios-instagram-clone
//
//  Created by taehy.k on 2020/09/17.
//  Copyright © 2020 taehy.k. All rights reserved.
//

// all authentication stuff here

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: - public
    public func resgisterNewUser(username: String, email: String, password: String){

    }
    
    // 클로저라는 개념 필요
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // username log in
            print(username)
        }
    }
}
