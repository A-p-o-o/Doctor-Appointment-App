//
//  Storage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


class Storage {
    
    var adminList        : [String : Admin]
    
    var receptionistList : [String : Receptionist]
    
    var cashierList      : [ String : Cashier ]
    
    var doctorList       : [ String : Doctor ]
    
    var availableDoctors : [ Date : [Doctor] ]
    
    var userDetails      : [ String : User ]
    
    var patientList      : [ String : Patient ]
    
    var visitorList      : [Date : [Visitor]]
    
    var reportsList      : [ String : Report ]
    
    var appointmentList  : [ Date : [Appointment] ]
    
    var BillList         : [ Date : [Bill] ]
    
    
    private init() {
        self.adminList        = [String : Admin]()
        self.receptionistList = [String : Receptionist]()
        self.cashierList      = [ String : Cashier ]()
        self.doctorList       = [ String : Doctor ]()
        self.availableDoctors = [ Date : [Doctor] ]()
        self.userDetails      = [ String : User ]()
        self.patientList      = [ String : Patient ]()
        self.visitorList      = [Date : [Visitor]]()
        self.reportsList      = [ String : Report ]()
        self.appointmentList  = [ Date : [Appointment] ]()
        self.BillList         = [ Date : [Bill] ]()
    }
    
    static var storage = Storage()
    
    
}
