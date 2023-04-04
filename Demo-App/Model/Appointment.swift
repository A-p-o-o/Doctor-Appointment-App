//
//  Appointment.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation

struct Appointment : Equatable{
    
    
    var appointmentId : String? = nil
    let patientName : String
    let patientMobileNumber : String
    let email : String
    let age : Int
    let gender : Sex
    let reason : String
    let doctor : Doctor
    let date : Date
    let slot : Slot
    let type : AppointmentType
    var status : AppointmentStatus
    let bookedBy : Patient
    
    init( patientName: String, patientMobileNumber: String,email : String,age : Int,gender : Sex,reason : String, doctor: Doctor, date: Date, slot: Slot,bookedBy : Patient,type : AppointmentType) {
        self.patientName = patientName
        self.patientMobileNumber = patientMobileNumber
        self.email = email
        self.age = age
        self.gender = gender
        self.reason = reason
        self.doctor = doctor
        self.date = date
        self.slot = slot
        self.type = type
        self.status = .upcoming
        self.bookedBy = bookedBy
    }
    
    static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        if  (lhs.patientName).caseInsensitiveCompare(rhs.patientName) == .orderedSame && (lhs.patientMobileNumber).caseInsensitiveCompare(rhs.patientMobileNumber) == .orderedSame &&
            lhs.email == rhs.email &&
            lhs.age == rhs.age &&
            lhs.gender == rhs.gender &&
            lhs.reason == rhs.reason &&
            lhs.doctor == rhs.doctor &&
            lhs.date == rhs.date &&
            isequal(slot: lhs.slot) == isequal(slot: rhs.slot)
        {
            return true
        }
        else {
            return false
        }
        
        func isequal(slot : Slot)->(slotNo : Int,time : Time){
            switch slot{
            case .slot(let no ,let time,_) :
                return (no , time)
            }
        }
    }
    
    func isequal(slot : Slot)->(slotNo : Int,time : Time){
        switch slot{
        case .slot(let no ,let time,_) :
            return (no , time)
        }
    }
    
    mutating func setStatus(status : AppointmentStatus){
        self.status = status
        
    }
    
    func getStatus() -> AppointmentStatus{
        return status
    }
    
    func getPatientName()->String?{
        patientName
    }
    
    func getPatientMobileNumber()->String?{
        patientMobileNumber
    }
    
    func getDoctor()->Doctor?{
        doctor
    }
    
    func getSlot()->Slot?{
        slot
    }
    
    func getdate()->Date?{
        date
    }
    
    func getTime()->(start:String,end:String){
        switch slot{
        case .slot(_, let time ,_) :
            switch time {
            case .time(let start, let end ) :
                return (start,end)
            }
        }
    }
    
    let appointmentDao = AppointmentDAO()
}
