//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Furkan on 9.04.2023.
//

import Foundation

class UserListViewModel : ObservableObject{
    @Published var userList = [UserViewModel]()
    
    //let webService = WebService()
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async{
        
        var resource = ""
        
        if service.type == "WebService"{
            resource = Constants.Urls.userExtensions
        }else{
            resource = Constants.Paths.baseUrl
        }
        do{
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print(error)
        }
        
    }
    
}
struct UserViewModel {
    let user : User
    var id : Int{
        user.id
    }
    var name : String{
        user.name
    }
    var username : String{
        user.username
    }
    var email : String{
        user.email
    }
    
    var phone : String{
        user.phone
    }
    var website : String{
        user.website
    }
    
    //MARK: - Address
    var street : String{
            user.address.street
    }
    var suite : String{
            user.address.suite
    }
    var city : String{
            user.address.city
    }
    var zipcode : String{
            user.address.zipcode
    }
    
    //MARK: - Company
    var companyName : String{
            user.company.name
    }
    var catchPhrase : String{
        user.company.catchPhrase
    }
    var bs : String{
        user.company.bs
    }
    
    }

