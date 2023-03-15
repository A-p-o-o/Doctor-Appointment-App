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
            let departmentname = "\(department)".lowercased()
            
            if departmentname.contains(dept.lowercased()){
                doctors.append(contentsOf: doctorDao.searchDepartment(department: department))
                break
            }
        }
        return doctors
    }
    
    let doctorDao = DoctorDAO()
    
}
