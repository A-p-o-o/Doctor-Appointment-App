//
//  Login.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 09/03/23.
//

import Foundation

struct Login{
    
    func isIdExist(userId : String)->Bool{
        userDAO.isUserIdExist(userId: userId)
    }
    
    func isPasswordCorrect(userid : String,password:String)->Bool{
       return userDAO.getPassword(userId: userid) == password
    }
    
    func getUser(userid : String)->Role{
       return userDAO.getUser(userId: userid)!.role
    }
    
    private let userDAO = UserDAO()
}
