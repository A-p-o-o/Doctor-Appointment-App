//
//  Cashier.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Cashier : Employee,Person{
    
    
    var name: String
    
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var phoneNumber: String
    
    var sex: Sex
    
    var dateOfBirth: Date?
    
    var mail: String
    
    var address: String
    
    var employeeId: String
    
    var dateJoined: Date
    
    var education: String
    
    var role: Role = .Cashier
    
    init(employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String) {
        self.employeeId = employeeId
        self.dateJoined = dateJoined
        self.education = education
        self.role = role
        self.name = name
        self.age = age
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail
        self.address = address
    }
    
    func generateBill(billId: String, patientId: String, billGenerateddate: Date, time: Date, billGivenBy: Cashier, consultantFees: Double, medicineFees: Double, status: Bool)->Bill{
        
        let bill = Bill(billId: billId, patientId: patientId, billGenerateddate: billGenerateddate, time: time, billGivenBy: self, consultantFees: consultantFees, medicineFees: medicineFees, status: status)
        billDAO.add(bill: bill)
        return bill
    }
    
    private let billDAO = BillDAO()
}
