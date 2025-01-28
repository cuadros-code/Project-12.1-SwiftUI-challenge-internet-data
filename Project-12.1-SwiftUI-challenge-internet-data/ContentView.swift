//
//  ContentView.swift
//  Project-12.1-SwiftUI-challenge-internet-data
//
//  Created by Kevin Cuadros on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [UserModel] = [UserModel]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \UserModel.id) { user in
                    Text(user.name)
                }
            }
            
            .navigationTitle("Contacts")
        }
        
        .task {
            await getUsers()
        }
    }
    
    
    func getUsers() async {
        if users.count >= 1 {
            return
        }
        do {
            guard let url = URL(string: Constanst.usersURL) else {
                return
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodeUsers = try? JSONDecoder().decode(
                [UserModel].self,
                from: data
            ) {
                users = decodeUsers
            } else {
                print("Error decode data")
            }
            
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
}

#Preview {
    ContentView()
}
