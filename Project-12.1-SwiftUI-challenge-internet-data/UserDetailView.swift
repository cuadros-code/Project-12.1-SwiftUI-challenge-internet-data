//
//  UserDetailView.swift
//  Project-12.1-SwiftUI-challenge-internet-data
//
//  Created by Kevin Cuadros on 28/01/25.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: UserModel
    var userColor: Color
    
    var body: some View {
        
        VStack(alignment: .center) {
            VStack(alignment: .center) {
                Text("\(StringUtility.firstLetter(string: user.name))")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 75, height: 75)
                    .background(userColor.opacity(1))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            Text("Email: \(user.email)")
                .font(.headline)
                .padding(.bottom, 10)
            
            HStack {
                Text(user.about)
            }
            .padding(20)
            
            VStack {
                Text("Friends")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            ScrollView([.horizontal]) {
                HStack {
                    ForEach(user.friends, id: \FriendModel.id) { friend in
                        Text("\(friend.name)")
                            .padding(8)
                            .background(userColor.opacity(0.4))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 6)
                            )
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.leading, 20)
            
            
            Spacer()
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
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: .now,
        tags: [],
        friends: [
            FriendModel(id: "1", name: "Hawkins Patel"),
            FriendModel(id: "2", name: "Jewel Sexton"),
            FriendModel(id: "3", name: "JBerger Robertson"),
            FriendModel(id: "4", name: "Hess Ford")
        ]
    )
    NavigationStack {
        UserDetailView(user: user, userColor: .blue)
    }
}
