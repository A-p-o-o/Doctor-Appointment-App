//
//  UserDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation

struct UserDAO{
    
    func adduser(user : any User){
        Storage.storage.userDetails[user.UserId] = user
    }
    
    func update(user : any User){
        Storage.storage.userDetails[user.UserId] = user
    }
    
    func getUser(userId : String)->(any User)?{
       return Storage.storage.userDetails[userId]
    }
    
    func isUserIdExist(userId : String)->Bool{
      return  Storage.storage.userDetails.contains(where: {$0.key.caseInsensitiveCompare(userId) == .orderedSame})
    }
    
    func removeUser(userId : String){
        Storage.storage.userDetails[userId] = nil
    }
    
    func getPassword(userId : String)->String?{
       return Storage.storage.userDetails[userId]?.password
    }
    
    func changePassword(userId : String , newPassword : String){
        guard var user = Storage.storage.userDetails[userId] else {
            return
        }
        user.password = newPassword
        Storage.storage.userDetails[userId] = user
    }
    
    
//    func isIdConnected(connectedId : String)->Bool{
//
//        let allUsers = Array(Storage.storage.userDetails.values)
//
//        for user in allUsers{
//            if user.connectedId ==
//
//
//        }
//        return false
//    }
}
