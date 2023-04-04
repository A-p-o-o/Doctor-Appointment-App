//
//  User.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 03/04/23.
//

import Foundation

struct UserDetails {
    
    
    func getDoctor(userId : String)->Doctor?{
      return  doctorDao.getDoctor(userId: userId)
    }
    
    func getPatient(userId : String)->Patient?{
      return patientDao.getPatient(userId: userId)
    }
    
    private let doctorDao = DoctorDAO()
    private let patientDao = PatientDAO()
}
