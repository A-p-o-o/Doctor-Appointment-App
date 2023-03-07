//
//  Bill.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Bill{
    
    let billId : String
    let patientId : String
    let billGenerateddate : Date
    let time : Date
    let billGivenBy : Cashier
    let consultantFees : Double
    let medicineFees : Double
    var status : Bool 
    
    var total : Double {
        consultantFees+medicineFees
    }
    
    init(billId: String, patientId: String, billGenerateddate: Date, time: Date, billGivenBy: Cashier, consultantFees: Double, medicineFees: Double, status: Bool) {
        self.billId = billId
        self.patientId = patientId
        self.billGenerateddate = billGenerateddate
        self.time = time
        self.billGivenBy = billGivenBy
        self.consultantFees = consultantFees
        self.medicineFees = medicineFees
        self.status = status
    }
}
