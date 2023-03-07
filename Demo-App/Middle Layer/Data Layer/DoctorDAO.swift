//
//  DoctorDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct DoctorDAO{
    
    func add(doctor : Doctor){
        Storage.storage.doctorList[doctor.employeeId] = doctor
    }
    
    func getDoctor(doctorId : String )->Doctor?{
        return Storage.storage.doctorList[doctorId]
    }
    
    func getAvailableDoctors(on date : Date)->[Doctor]?{
        return Storage.storage.availableDoctors[date]
    }
    
    func update(doctor : Doctor){
        Storage.storage.doctorList[doctor.employeeId] = doctor
    }
    func isDoctorExist(doctorId : String)->Bool{
        return Storage.storage.doctorList.contains(where: {$0.key == doctorId})
    }
    
    func removeDoctor(doctorId : String ){
      let doctor = Storage.storage.doctorList.removeValue(forKey: doctorId)
    }
    
    func getAllDoctors()->[Doctor]?{
        return Array(Storage.storage.doctorList.values)
    }
    
    func getDoctor(name : String)->Doctor?{
        
        let allDoctors = Array(Storage.storage.doctorList.values)
        
        for doctor in allDoctors{
            if(doctor.name.caseInsensitiveCompare(name) == .orderedSame){
                return doctor
            }
        }
        return nil
    }
    
    func changeDoctorAvailability(date : Date ,doctors : [Doctor]){
        Storage.storage.availableDoctors[date] = doctors
    }
    
    func getAvailableDoctors(on date:Date , in department : Department)->[Doctor]?{
        var availableDoctors : [Doctor]?
        
        guard let availableDoctorsOnSpecifiedDate = Storage.storage.availableDoctors[date] else {
            return nil
        }
        
        for doctor in availableDoctorsOnSpecifiedDate{
            if (doctor.department == department){
                availableDoctors?.append(doctor)
            }
        }
        return availableDoctors
    }
    
}
