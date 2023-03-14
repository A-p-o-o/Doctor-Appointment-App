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
    
    func doctorSlots(date:String,doctorId:String)->[String]{
        var slottime = [String]()
        let times =  doctorDao.getAvailableSlots(for: formatDate(date: date), doctorId: doctorId)
        
        for time in times {
            switch time {
            case .time1(let start,let end) :
                slottime.append("\(start) - \(end)")
                
            case .time2(let start,let end) :
                slottime.append("\(start) - \(end)")
                
            case .time3(let start,let end) :
                slottime.append("\(start) - \(end)")
                
            case .time4(let start,let end) :
                slottime.append("\(start) - \(end)")
                
            case .time5(let start,let end) :
                slottime.append("\(start) - \(end)")
                
            case .coustomtime(let start,let end) :
                slottime.append("\(start) - \(end)")
                
            }
        }
        return slottime
    }
    
    
    func dateAndslots(dates:[String],doctorId : String)->[String:[String]]{
        var dateAndSlots = [String:[String]]()
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
