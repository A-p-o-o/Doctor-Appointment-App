//
//  Appointment.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation

struct Appointment : Equatable{
    
    
    var patientId : String
    var patientName : String
    var patientMobileNumber : String
    var doctor : Doctor
    var date : Date
    var slot : Slot
    var status : Bool
    
    init(patientId: String, patientName: String, patientMobileNumber: String, doctor: Doctor, date: Date, slot: Slot) {
        self.patientId = patientId
        self.patientName = patientName
        self.patientMobileNumber = patientMobileNumber
        self.doctor = doctor
        self.date = date
        self.slot = slot
        self.status = false
    }
    
    static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        if (lhs.patientId).caseInsensitiveCompare(rhs.patientId) == .orderedSame && (lhs.patientName).caseInsensitiveCompare(rhs.patientName) == .orderedSame && (lhs.patientMobileNumber).caseInsensitiveCompare(rhs.patientMobileNumber) == .orderedSame && lhs.doctor == rhs.doctor &&
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
    
    mutating func setStatus(status : Bool){
        self.status = status
    }
    
    func getStatus() -> Bool{
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
}
