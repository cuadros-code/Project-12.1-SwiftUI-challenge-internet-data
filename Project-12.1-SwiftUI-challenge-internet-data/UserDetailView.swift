//
//  UserDetailView.swift
//  Project-12.1-SwiftUI-challenge-internet-data
//
//  Created by Kevin Cuadros on 28/01/25.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: UserModel
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let user = UserModel(
        id: "",
        isActive: true,
        name: "Kevin Cuadros",
        age: 34,
        company: "Personal",
        email: "kscuadros@gmail.com",
        address: "Av 12 street Cuadros",
        about: "description",
        registered: .now,
        tags: [],
        friends: []
    )
    NavigationStack {
        UserDetailView(user: user)
    }
}
