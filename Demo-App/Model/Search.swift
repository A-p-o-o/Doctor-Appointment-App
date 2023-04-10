//
//  Search.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import Foundation

struct Search{
    
    
    func searchDepartment(text:String)->[Department]{
        var matchedDepartments = [Department]()
        
        for department in Department.allCases{
            let departmentname = "\(department)".lowercased()
            
            if departmentname.contains(text.lowercased()){
                matchedDepartments.append(department)
            }
        }
        return matchedDepartments
        
    }
    
    func doctorAvailableDates(doctorId : String)->[String]{
        return doctorDao.getDoctorAvailableDates(doctorId: doctorId)
    }
    
    func doctorSlots(date:String,doctorId:String)->(start :[String],end :[String],slotNo:[Int]){
        var startTime = [String]()
        var endTime = [String]()
        let times =  doctorDao.getAvailableSlots(for: formatDate(date: date), doctorId: doctorId)
        
        for time in times.time {
            switch time {
            case .time(let start,let end) :
                startTime.append(start)
                endTime.append(end)
            }
        }
        return (startTime,endTime,times.slotNo)
    }
    
    func allAvailableDates()->[String]{
        return doctorDao.getAvailableDates()
    }
    
    func availableDoctorsOn(date : String,department : Department)->[Doctor]{
        doctorDao.availableDoctorsOnDate(date: date, department: department)
    }
    
    func availableTimefor(date : String,department : Department)->[String]{
        let availableDoctors = availableDoctorsOn(date: date, department: department)
        
        var time : [String] = []
        
        for doctor in availableDoctors {
            let availableSlots = doctorSlots(date: date , doctorId: doctor.employeeId)
            
            for slotsStartTime in availableSlots.start {
                
                if !time.contains(slotsStartTime){
                    time.append(slotsStartTime)
                }
            }
            
        }
        
        let amTime = time.filter {
            if $0.contains("AM"){
                return true
            }else {
                return false
            }
        }
        
        let pmTime = time.filter {
            if $0.contains("PM"){
                return true
            }else {
                return false
            }
        }
        
        time = amTime
        time.append(contentsOf: pmTime)
        return time
    }
 
    func availableDoctorsOn(date : String,department : Department,time : String)->[Doctor]{
        var availableDoctors : [Doctor] = []
        
        let doctors =   doctorsInDepartment(dept: department.departmentName)
        
        for doctor in doctors {
            
            let availableDates = doctorAvailableDates(doctorId: doctor.employeeId)
                
            for availableDate in availableDates {
                
                if date == availableDate {
                    
                    let availableSlots = doctorSlots(date: availableDate , doctorId: doctor.employeeId)
                    
                    for startTime in availableSlots.start {
                        
                        if startTime == time {
                            availableDoctors.append(doctor)
                        }
                    }
                }
            }
        }
        return availableDoctors
    }
    
    func getEndtimeAndSlot(doctor : Doctor,date : String , startTime : String)->(endtime : String , slotNo : Int){
        
        let allSlots =  doctorSlots(date: date, doctorId: doctor.employeeId)
        
        
        for index in 0..<allSlots.start.count {
            if allSlots.start[index] == startTime {
                return (allSlots.end[index],allSlots.slotNo[index])
            }
        }
        return ("",0)
    }
    
    func dateAndslots(dates:[String],doctorId : String)->[String:([String],[String],[Int])]{
        var dateAndSlots = [String:([String],[String],[Int])]()
        for date in dates{
            dateAndSlots[date] = doctorSlots(date: date, doctorId: doctorId)
        }
        return dateAndSlots
    }
    
    func doctorsInDepartment(dept : String)->[Doctor]{
        var doctors = [Doctor]()
        
        for department in Department.allCases{
            let departmentname = department.departmentName.lowercased()
            
            if departmentname.contains(dept.lowercased()){
                doctors.append(contentsOf: doctorDao.searchDepartment(department: department))
                break
            }
        }
        return doctors
    }
    
    func allDoctors()->[Doctor]{
        var doctors : [Doctor] = []
        
        for department in Department.allCases{
            doctors.append(contentsOf: doctorDao.searchDepartment(department: department))
        }
        return doctors
    }
    
    let doctorDao = DoctorDAO()
    
}
