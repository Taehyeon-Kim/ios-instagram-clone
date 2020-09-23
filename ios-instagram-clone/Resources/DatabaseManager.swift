//
//  DatabaseManager.swift
//  ios-instagram-clone
//
//  Created by taehy.k on 2020/09/17.
//  Copyright © 2020 taehy.k. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - public

    // Check if username and email is available
    // - Parameters
    //      - email: String representing email
    //      - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    // Inserts new user data to database
    // - Parameters
    //      - email: String representing email
    //      - username: String representing username
    //      - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeded
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
    
}
