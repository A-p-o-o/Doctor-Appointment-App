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
        
        var number = 1
        
        for time in Time.allCases{
            self.slots.append(.slot(number: number, time: time))
            number += 1
        }
    }
    
}

