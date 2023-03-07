//
//  BillDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct BillDAO{
    
    
    func add(bill : Bill){
        
        var bills : [Bill]
      guard  var billsOnDate = Storage.storage.BillList[Date()]
        else {
          bills = [Bill]()
      }
        bills = billsOnDate
        bills.append(bill)
        Storage.storage.BillList[Date()] = bills
    }
    
    func get(forPatientId  patientId : String )->[Bill]?{
        
        var patientBills : [Bill]?
        
        let allBills = Storage.storage.BillList.values
        
        for perDayBill in allBills {
            for bill in perDayBill {
                if (bill.patientId).caseInsensitiveCompare(patientId) == .orderedSame{
                    patientBills?.append(bill)
                }
            }
            
        }
        return patientBills
    }
    
    func getAmmount(forDate date: Date)->Double{
        var ammount = 0.0
        
        guard let billsPerDay = Storage.storage.BillList[date] else {
            return ammount
        }
        
        for bill in billsPerDay{
            ammount += bill.total
        }
        return ammount
    }
    
    func getAmmount(from date1 : Date ,to date2 : Date = Date())->Double{
        let timeInterval = date2.timeIntervalSince(date1)
        
        if timeInterval == 0 {
            return getAmmount(forDate: date1)
        }
        else {
            var ammount = 0.0
            let noOfdays = Int(timeInterval/86400)
            for day in 0...noOfdays {
                let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
                ammount += getAmmount(forDate: date)
            }
            return ammount
        }
    }
}
