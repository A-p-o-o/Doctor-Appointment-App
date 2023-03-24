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
    
    func getAvailableDoctors(on date : Date)->  [DoctorAvailability]?{
        return Storage.storage.availableDoctors[dateFormat(date: date)]
    }
    
    func update(doctor : Doctor){
        Storage.storage.doctorList[doctor.employeeId] = doctor
        
    }
    func isDoctorExist(doctorId : String)->Bool{
        return Storage.storage.doctorList.contains(where: {$0.key == doctorId})
    }
    
    func removeDoctor(doctorId : String ){
       Storage.storage.doctorList.removeValue(forKey: doctorId)
    }
    
    func getAllDoctors()->[Doctor]?{
        return Array(Storage.storage.doctorList.values)
    }
    
    
    func getAvailabilityDates(doctor:Doctor)->[(Date,Bool,[Slot])]{
        
        var availability : [(Date,Bool,[Slot])] = []
        for day in 7...14 {
            
            
           
            let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
            let availableDoctorsOnDate : [DoctorAvailability] = Storage.storage.availableDoctors[dateFormat(date: date)]!
            
            for doc in availableDoctorsOnDate {
                if doc.doctorId == doctor.employeeId {
                    availability.append((date,doc.isAvailable,doc.slots))
                }
            }
        }
        
        return availability
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
    
    func changeDoctorAvailability(date : Date ,doctors : [DoctorAvailability]){
        Storage.storage.availableDoctors[dateFormat(date: date)] = doctors
    }
    
    func updateDoctorAvailability(date: Date ,doctorAvailability : [DoctorAvailability]){
        Storage.storage.availableDoctors[dateFormat(date: date)] = doctorAvailability
    }
    
    func getAvailableDoctors(on date:Date , in department : Department)->[DoctorAvailability]?{
        var availableDoctors = [DoctorAvailability]()
        
        guard let availableDoctorsOnSpecifiedDate = Storage.storage.availableDoctors[dateFormat(date: date)] else {
            return nil
        }
        
        for doctor in availableDoctorsOnSpecifiedDate{
            if (doctor.department == department && doctor.isAvailable == true){
                availableDoctors.append(doctor)
            }
        }
        return availableDoctors.count != 0 ? availableDoctors : nil
    }
    
    func getDoctorAvailableDates(doctorId : String)->[String]{
        var dates = [String]()
        for day in 0...7{
            let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
            
            guard let doctorsAvailableInDate : [DoctorAvailability] = Storage.storage.availableDoctors[dateFormat(date: date)] else {
                return dates
            }
            
            
            for doctor in doctorsAvailableInDate {
                if doctor.doctorId == doctorId {
                    dates.append(dateFormat(date: date))
                }
                
            }
        }
        return dates
    }
    
    func getAvailableSlots(for date: Date,doctorId : String)->(time:[Time],slotNo:[Int]){
        var times : [Time] = []
        var slotNos : [Int] = []
        
        guard let doctors :[DoctorAvailability] = Storage.storage.availableDoctors[dateFormat(date: date)] else {
            return  (times,slotNos)
        }
        
        for doctor in doctors {
            if  doctor.doctorId == doctorId {
                let slots : [Slot] = doctor.slots
                
                let currentTime = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy hh:mm-a"

                
                
                for slot in slots{
                    switch slot {
                    case .slot(let slotNo ,let Time,let isBooked) : if !isBooked  {
                        
                        switch Time {
                        case .time(let time,_) : if currentTime.compare(dateFormatter.date(from: "\(dateFormat(date: date)) \(time)")!) == .orderedAscending {
                            times.append(Time)
                            slotNos.append(slotNo)
                             }
                            
                        }
                        
                    }
                        
                    }
                }
                
            }
        }
        
        return (times,slotNos)
    }
    
    func searchDoctor(searchText : String)->[Doctor]{
        var matchedDoctors = [Doctor]()
        let allDoctors = Array(Storage.storage.doctorList.values)
        
        for doctor in allDoctors {
            if (doctor.name.range(of: searchText, options: .caseInsensitive) != nil) {
                matchedDoctors.append(doctor)
            }
        }
        return matchedDoctors
    }
    
    
    func searchDepartment(department : Department)->[Doctor]{
        var matchedDoctors = [Doctor]()
        let allDoctors = Array(Storage.storage.doctorList.values)
        
        for doctor in allDoctors {
            if doctor.department == department {
                matchedDoctors.append(doctor)
            }
        }
        return matchedDoctors
    }
    
    
    
  
}

func dateFormat(date : Date)->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
   return dateFormatter.string(from: date)
}

func formatDate(date: String)->Date{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.date(from: date)!
     
}
