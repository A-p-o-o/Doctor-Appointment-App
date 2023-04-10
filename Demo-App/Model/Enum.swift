//
//  User.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation

enum BloodGroup{
    case oPositive,oNegative,aPositive,aNegative,abPositive,abNegative,bPositive,bNegative
    
    var name : String {
        switch self {
        case .oPositive : return "O+ Positive"
        case .oNegative:
            return "O- Negative"
        case .aPositive:
            return "A+ Positive"
        case .aNegative:
            return "A- Negative"
        case .abPositive:
            return "AB+ Positive"
        case .abNegative:
            return "AB- Negative"
        case .bPositive:
            return "B+ Positive"
        case .bNegative:
            return "B- Negative"
        }
    }
    
    static func getBloodGroup(from string: String) -> BloodGroup? {
            switch string {
            case BloodGroup.oPositive.name:
                return .oPositive
            case BloodGroup.oNegative.name:
                return .oNegative
            case BloodGroup.aPositive.name :
                return .aPositive
            case BloodGroup.aNegative.name:
                return .aNegative
            case BloodGroup.abPositive.name:
                return .abPositive
            case BloodGroup.abNegative.name:
                return .abNegative
            case BloodGroup.bPositive.name:
                return .bPositive
            case BloodGroup.bNegative.name:
                return .bNegative
            default:
                return nil
            }
        }
    
}

enum Role {
    case Admin,Doctor,Receptionist,Cashier,Patient
}

enum Sex{
    case Male,Female,NonBinary
    
    var name : String {
        switch self {
        case .Male : return "Male"
        case .Female : return "Female"
        case .NonBinary : return "Non Binary"
        }
    }
    
    static func getSex(from string: String) -> Sex? {
           switch string {
           case "Male": return .Male
           case "Female": return .Female
           case "Non Binary": return .NonBinary
           default: return nil
           }
       }
}

enum Department{
    
    static var allCases:[Department]{
        return [.Neurologist,.Cardiologist,.General_Physician,.Orthopedist,.Dermatologist,.Ear_Nose_throat,.Psychiatry,.Diabetology,.Nephrology,.Rheumatology,.Dentist,.Veterinary,.Ophthalmologist,.Gynaecologist,.Andrologist,.Paediatrician,.Dietitian]
    }
    
    case Neurologist,
         Cardiologist,
         General_Physician,
         Orthopedist,
         Dermatologist ,
         Ear_Nose_throat,
         Psychiatry,
         Diabetology,
         Nephrology,
         Rheumatology,
         Dentist,
         Veterinary,
         Ophthalmologist ,
         Gynaecologist ,
         Andrologist,
         Paediatrician ,
         Dietitian
    
    var departmentName : String {
        switch self {
        case .Neurologist : return "Neurologist"
        case .Cardiologist : return "Cardiologist"
        case .General_Physician : return "General Physician"
        case .Orthopedist : return "Orthopedist"
        case .Dermatologist  : return "Dermatologist"
        case .Ear_Nose_throat : return "Ear Nose throat"
        case .Psychiatry : return "Psychiatry"
        case .Diabetology : return "Diabetology"
        case .Nephrology : return "Nephrology"
        case .Rheumatology : return "Rheumatology"
        case .Dentist : return "Dentist"
        case .Veterinary : return "Veterinary"
        case .Ophthalmologist  : return "Ophthalmologist"
        case .Gynaecologist  : return "Gynaecologist"
        case .Andrologist : return "Andrologist"
        case .Paediatrician  : return "Paediatrician"
        case .Dietitian  : return "Dietitian"
        }
    }
}

enum AppointmentType : Equatable {
    case Online,Offline
    
    var stringName : String {
        switch self {
        case .Offline : return "Physical"
        case .Online : return "Online"
        }
    }
}

enum AppointmentStatus : Equatable{
    case upcoming,completed,missed,doctorCancelled(reason:String),patientCancelled(reason:String)

    var cancellationReason: String? {
        switch self {
        case .doctorCancelled(let reason ) ,.patientCancelled(let reason): return reason
        default : return nil
        }
    }
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
