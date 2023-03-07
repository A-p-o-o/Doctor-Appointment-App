//
//  User.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation

protocol User{
    
    var userName : String { get set }
    var password : String { get set }
    var UserId : String { get set }
    var Role : Role { get set }
    associatedtype type ;
    var connectedId : type { get set }
}
