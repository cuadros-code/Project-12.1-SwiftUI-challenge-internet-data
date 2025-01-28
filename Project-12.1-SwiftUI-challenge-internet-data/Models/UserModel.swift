//
//  UserModel.swift
//  Project-12.1-SwiftUI-challenge-internet-data
//
//  Created by Kevin Cuadros on 28/01/25.
//

import Foundation


struct UserModel: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
//    let registered: Date
    let tags: [String]
    let friends: [FriendModel]
}
