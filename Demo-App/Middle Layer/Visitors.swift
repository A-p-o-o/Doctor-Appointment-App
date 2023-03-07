//
//  Visitors.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Visitor : Person{
    
    var name: String 
    
    var phoneNumber: String
    
    var sex: Sex
    
    var mail: String
    
    var address: String
    
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var dateOfBirth: Date?
    
    var patientVisiting : Patient
    
    var visitTime : Date
    
    init(name: String, phoneNumber: String, sex: Sex, mail: String, address: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, patientVisiting: Patient, visitTime: Date) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.mail = mail
        self.address = address
        self.age = age
        self.bloodGroup = bloodGroup
        self.dateOfBirth = dateOfBirth
        self.patientVisiting = patientVisiting
        self.visitTime = visitTime
    }
    
    
}
