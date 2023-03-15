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
}

enum Time : Equatable{
    case time(start:String,end:String)
}
