//
//  Person.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


protocol Person{
    
    var name : String { get set }
    var age : Int?{ get }
    var bloodGroup : BloodGroup? { get set }
    var phoneNumber : String { get set }
    var sex : Sex { get set }
    var dateOfBirth : Date? {get set }
    var mail : String { get set }
    var address : String { get set }
    
}

protocol Employee : Person{
    var employeeId : String { get set }
    var dateJoined : Date { get set }
    var education : String { get set }
    var role : Role { get set }
}


enum BloodGroup{
    case O_positive
}

enum Role {
    case Admin,Doctor,Receptionist,Cashier,Patient
}

enum Sex{
    case Male,Female,NonBinary
}

enum Department{
    case neurologist
}
