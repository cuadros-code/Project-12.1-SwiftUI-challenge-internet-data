//
//  ContentView.swift
//  Project-12.1-SwiftUI-challenge-internet-data
//
//  Created by Kevin Cuadros on 28/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \UserModel.name) var users: [UserModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \UserModel.id) { user in
                    let color = Color.random
                    
                    NavigationLink {
                        UserDetailView(user: user, userColor: color)
                    } label: {
                        HStack {
                            Text("\(StringUtility.firstLetter(string: user.name))")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(width: 55, height: 55)
                                .background(color.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            
            .navigationTitle("Contacts (\(users.count))")
        }
        
        .task {
            await getUsers()
        }
    }
    
    
    func getUsers() async {
        if users.count >= 1 {
            return
        }
        guard let url = URL(string: Constants.usersURL) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodeUsers = try? decoder.decode(
                [UserModel].self,
                from: data
            ) {
                for item in decodeUsers {
                    modelContext.insert(item)
                }
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
