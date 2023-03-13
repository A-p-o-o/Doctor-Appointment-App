//
//  Receptionist.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Receptionist : Employee,Person,User{
    
    typealias MyType = Receptionist
    
    
    var userName: String
    
    var password: String
    
    var UserId: String
    
    var name: String
    
    var phoneNumber: String
    
    var sex: Sex
    
    var mail: String
    
    var address: String
    
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var dateOfBirth: Date?
    
    var employeeId: String
    
    var dateJoined: Date
    
    var education: String
    
    var role: Role = .Receptionist
    
    init(userName: String, password: String, UserId: String, name: String, phoneNumber: String, sex: Sex, mail: String, address: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, employeeId: String, dateJoined: Date, education: String, role: Role) {
        self.userName = userName
        self.password = password
        self.UserId = UserId
        self.name = name
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.mail = mail
        self.address = address
        self.age = age
        self.bloodGroup = bloodGroup
        self.dateOfBirth = dateOfBirth
        self.employeeId = employeeId
        self.dateJoined = dateJoined
        self.education = education
        self.role = role
        self.password = password
    }
    
    func changePassword(newPassword: String) {
        userDAO.changePassword(userId: UserId, newPassword: password)
    }
    
    func viewProfile() -> Receptionist {
        return self
    }
    
    func addPatient(name: String, age: Int, bloodGroup: BloodGroup, phoneNumber: String, sex: Sex, dateOfBirth: Date, mail: String, address: String, patientId: String, weight: Double, height: Double, AllergyTo: String,password : String,userId : String){
        
        let patient = Patient(userName: name, password: password, UserId: userId, role: .Patient, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, patientId: patientId, weight: weight, height: height, AllergyTo: AllergyTo)
        
        patientDAO.addPatient(patient: patient)
    }
    
    func searchPatient(search : String)->[Patient]?{
       return patientDAO.getPatient(search: search)
    }
    
    func addVisitors(name: String, phoneNumber: String, sex: Sex, mail: String, address: String, patientVisiting: Patient, visitTime: Date){
        let visitor = Visitor(name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, patientVisiting: patientVisiting, visitTime: visitTime)
        visitorDAO.addVisitor(visitor: visitor, date: visitTime)
    }
    
    func showVisitorList(date : Date)->[Visitor]?{
       return  visitorDAO.getVisitor(date: date)
    }
    
    private let patientDAO = PatientDAO()
    private let visitorDAO = VisitorDAO()
    private let userDAO = UserDAO()
}
