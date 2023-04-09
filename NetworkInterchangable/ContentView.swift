//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Furkan on 9.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: WebService())
        //self.userListViewModel = UserListViewModel(service: LocalService())
    }
    
    var body: some View {
        
        List(userListViewModel.userList,id: \.id){user in
            VStack{
                HStack{
                    Text(user.name)
                        .font(.title3)
                        .foregroundColor(.pink)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("(\(user.username))")
                        .font(.callout)
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.bottom)
                VStack{
                    Text("Email : \(user.email)")
                        .font(.callout)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Phone : \(user.phone)")
                        .font(.callout)
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Website : \(user.website)")
                        .font(.callout)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom)
                
                Text("Address:")
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    Text("\(user.street), \(user.suite), \(user.city), \(user.zipcode)")
                        .font(.headline)
                        .foregroundColor(.brown)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom)
                
                Text("Company:")
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    Text("Name : \(user.companyName)")
                        .font(.headline)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Catch Phrase : \(user.catchPhrase)")
                        .font(.caption)
                        .foregroundColor(.init(uiColor: .darkGray))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("BS : \(user.bs)")
                        .font(.callout)
                        .foregroundColor(.init(uiColor: .lightGray))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom)
                
            }
        }.task {
           await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
