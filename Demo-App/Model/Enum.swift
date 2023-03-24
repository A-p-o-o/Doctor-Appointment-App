//
//  User.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation

enum BloodGroup{
    case O_positive
}

enum Role {
    case Admin,Doctor,Receptionist,Cashier,Patient
}

enum Sex{
    case Male,Female,NonBinary
}

enum Department{
    
    static var allCases:[Department]{
        return [.Neurologist,.Cardiologist,.General_Physician,.Orthopedist,.Dermatologist,.Ear_Nose_throat,.Urologist,.Psychiatry,.Diabetology,.Nephrology,.Rheumatology]
    }
    
    case Neurologist,Cardiologist,General_Physician,Orthopedist,Dermatologist,Ear_Nose_throat,Urologist,Psychiatry,Diabetology,Nephrology,Rheumatology
}

enum Slot : Equatable{
    case slot(number : Int, time : Time, isBooked : Bool = false)
    
    var number: Int {
        set {
            self = .slot(number: newValue, time: self.time)
        }
        get{
            switch self {
            case .slot(let number, _,_):
                return number
            }
            
        }
        }
    
    var time: Time {
        set {
            self = .slot(number: self.number, time: newValue)
        }
        get{
            switch self {
            case .slot(_, let time,_):
                return time
            }
        }
    }
    
    var isBooked: Bool {
        set {
            self = .slot(number: self.number, time: self.time,isBooked: newValue)
        }
        get{
            switch self {
            case .slot(_, _, let isBooked):
                return isBooked
            }
        }
    }
}

enum Time : Equatable{
    case time(start:String,end:String)
    
    var startTime : String {
        set {
            self = .time(start: newValue, end: self.endTime)
        }
        get{
            switch self {
            case .time(let startTime,_) :
                return startTime
            }
        }
    }
    
    var endTime : String {
        set {
            self = .time(start: self.startTime, end: newValue)
        }
        get{
            switch self {
            case .time(_,let endTime) :
                return endTime
            }
        }
    }
}
