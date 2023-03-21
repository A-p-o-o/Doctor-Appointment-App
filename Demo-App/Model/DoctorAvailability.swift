//
//  AvailableDoctors.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 08/03/23.
//

import Foundation

struct DoctorAvailability{
    
    let  doctorId : String
    let  department : Department
    var  isAvailable : Bool
    var  noOfSlots : Int {
        slots.count
    }
    var slots = [Slot]()
    
    init(doctorId: String, department: Department, isAvailable: Bool) {
        self.doctorId = doctorId
        self.department = department
        self.isAvailable = isAvailable
        setSlot()
    }
    
    private mutating func setSlot(){
        
        
        let startTime = ["09:00-AM","09:30-AM","10:00-AM","10:30-AM","11:00-AM","11:30-AM","02:00-PM","02:30-PM","03:00-PM","03:30-PM"]
        let endTime   = ["09:25-AM","09:55-AM","10:25-AM","10:55-AM","11:25-AM","11:55-AM","02:25-PM","02:55-PM","03:25-PM","03:55-PM"]
        for index in 0..<startTime.count{
            self.slots.append(.slot(number: index + 1, time: .time(start: startTime[index], end: endTime[index])))
           
        }
    }
    
}

