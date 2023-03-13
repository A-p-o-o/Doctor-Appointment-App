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

enum Time : CaseIterable ,Equatable{
    static var allCases:[Time] {
        return [.time1(),time2(),.time3(),.time4(),.time5()]
    }
    
    case time1(start:String = "09:00-AM",end:String = "09:25-AM"),
         time2(start:String = "09:30-AM",end:String = "09:55-AM"),
         time3(start:String = "10:00-AM",end:String = "10:25-AM"),
         time4(start:String = "02:00-PM",end:String = "02:25-PM"),
         time5(start:String = "02:30-PM",end:String = "02:55-PM"),
         coustomtime(start:String,end:String)
    
}
