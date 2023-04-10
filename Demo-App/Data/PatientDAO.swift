//
//  PatientDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation

struct PatientDAO{
    
    func setPatientId()->String{
        return String(Storage.storage.patientList.count + 1)
    }
    
    func addPatient(patient : Patient){
        Storage.storage.patientList[patient.patientId] = patient
    }
    
    func getPatient(patientId : String)->Patient?{
      return  Storage.storage.patientList[patientId]
    }
    
    func getPatient(userId : String)->Patient?{
        let allPatients = Array(Storage.storage.patientList.values)
        
        for patient in allPatients{
            if(patient.UserId.caseInsensitiveCompare(userId) == .orderedSame){
                return patient
            }
        }
        return nil
    }
    
    func updatePatient(patient : Patient){
        let user = UserDAO()
        user.update(user: patient)
        Storage.storage.patientList[patient.patientId] = patient
    }
    
    func isPatientExist(patientId : String)->Bool{
      return   Storage.storage.patientList.contains(where: {$0.key == patientId })
    }
    
    func getPatient(search : String)->[Patient]?{
        
         let allPatients = Array(Storage.storage.patientList.values)
        
        var patients = [Patient]()
        
        for patient in allPatients{
            
            if ((patient.patientId.range(of: search, options: .caseInsensitive)) != nil) ||
                ((patient.phoneNumber.range(of: search, options: .caseInsensitive)) != nil) ||
                ((patient.name.range(of: search, options: .caseInsensitive)) != nil) {
                patients.append(patient)
            }
        }
        return patients.count != 0 ? patients : nil
    }
    
}
