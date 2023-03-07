//
//  Appointment.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation

struct Appointment : Equatable{
    
    
    let patientId : String
    let patientName : String
    let patientMobileNumber : String
    let doctor : Doctor
    let date : Date
    let startTime : Date
    let endTime : Date
    var status : Bool
    
    init(patientId: String, patientName: String, patientMobileNumber: String, doctor: Doctor, date: Date, startTime: Date, endTime: Date, status: Bool) {
        self.patientId = patientId
        self.patientName = patientName
        self.patientMobileNumber = patientMobileNumber
        self.doctor = doctor
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.status = status
    }
    
    static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        if (lhs.patientId).caseInsensitiveCompare(rhs.patientId) == .orderedSame && (lhs.patientName).caseInsensitiveCompare(rhs.patientName) == .orderedSame && (lhs.patientMobileNumber).caseInsensitiveCompare(rhs.patientMobileNumber) == .orderedSame && lhs.doctor == rhs.doctor &&
            lhs.date == rhs.date &&
            lhs.startTime == rhs.startTime &&
            lhs.endTime == rhs.endTime
        {
            return true
        }
        else {
            return false
        }
    }
    
    mutating func setStatus(status : Bool){
        self.status = status
    }
    
    func getStatus() -> Bool{
        return status
    }
    
    func getPatientName()->String{
        patientName
    }
    
    func getPatientMobileNumber()->String{
        patientMobileNumber
    }
    
    func getDoctor()->Doctor{
        doctor
    }
    
    func getStartTime()->Date{
        startTime
    }
    
    func getEndTime()->Date{
        endTime
    }
    
    func getdate()->Date{
        date
    }
}
