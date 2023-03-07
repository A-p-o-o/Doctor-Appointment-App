//
//  Slot.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Slot{
    
    var appointment : Appointment
    var startTime : Date
    var endTime : Date
    var date : Date
    
    init(appointment: Appointment, startTime: Date, endTime: Date, date: Date) {
        self.appointment = appointment
        self.startTime = startTime
        self.endTime = endTime
        self.date = date
    }
}
