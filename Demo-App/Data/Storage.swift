//
//  Storage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


class Storage {
    
    var adminList        : [ String : Admin]
    
    var receptionistList : [ String : Receptionist]
    
    var cashierList      : [ String : Cashier ]
    
    var doctorList       : [ String : Doctor ]
    
    var availableDoctors : [ String : [DoctorAvailability] ]
    
    var userDetails      : [ String : any User ]
    
    var patientList      : [ String : Patient ]
    
    var visitorList      : [ String : [Visitor]]
    
    var reportsList      : [ String : [Report] ]
    
    var appointmentList  : [ String : [Appointment] ]
    
    var BillList         : [ String : [Bill] ]
    
    var reviewList       : [ String : [Review] ]
    
    private init() {
        self.adminList        = [ String : Admin]()
        self.receptionistList = [ String : Receptionist]()
        self.cashierList      = [ String : Cashier ]()
        self.doctorList       = [ String : Doctor ]()
        self.availableDoctors = [ String : [DoctorAvailability] ]()
        self.userDetails      = [ String : any User ]()
        self.patientList      = [ String : Patient ]()
        self.visitorList      = [ String : [Visitor]]()
        self.reportsList      = [ String : [Report] ]()
        self.appointmentList  = [ String : [Appointment] ]()
        self.BillList         = [ String : [Bill] ]()
        self.reviewList       = [ String : [Review] ]()
        availDoc()
        setAvailableDoctors()
        
    }
    
    static var storage = Storage()
    
    
     func setAvailableDoctors(){
         
         let doctors = Array(doctorList.values)
         for day in 0...14{
            let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
             var availabeDoctors = [DoctorAvailability]()
             for doctor in doctors{
                 availabeDoctors.append( DoctorAvailability(doctorId: doctor.employeeId,department: doctor.department, isAvailable: true))
             }
             self.availableDoctors[dateFormat(date: date)] = availabeDoctors
        }
    }
    
    func availDoc(){
        doctorList["D1"] = Doctor(userName: "Doc", password: "Doc", UserId: "Doc", employeeId: "D1", dateJoined: Date(), education: "Doc", role: .Doctor, name: "Doc", phoneNumber: "Doc", sex: .Male, mail: "Doc", address: "Doc", department: .Neurologist, experience: 23)
    }
    
}
