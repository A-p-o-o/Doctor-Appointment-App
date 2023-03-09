//
//  Register.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct Register{
    
    func createAccount(userName: String, password: String, UserId: String, role: Role, bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, name: String, phoneNumber: String, sex: Sex, mail: String, address: String, patientId: String, weight: Double, height: Double, AllergyTo: String){
        
        let patient = Patient(userName: userName, password: password, UserId: UserId, role: .Patient,bloodGroup: bloodGroup,dateOfBirth: dateOfBirth, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, patientId: patientId, weight: weight, height: height, AllergyTo: AllergyTo)
        patientDAO.addPatient(patient: patient)
    }
    private let patientDAO = PatientDAO()
}
