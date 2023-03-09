//
//  CashierDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct CashierDAO{
    
    func addCashier(cashier : Cashier){
        Storage.storage.cashierList[cashier.employeeId] = cashier
    }
    
    func isExist(id:String)->Bool{
      return  Storage.storage.cashierList.contains(where: {($0.key).caseInsensitiveCompare(id) == .orderedSame})
    }
    
    func update(cashier : Cashier){
        Storage.storage.cashierList[cashier.employeeId] = cashier
    }
    
    func remove(id:String){
        Storage.storage.cashierList[id] = nil
    }
    
    func getCashier(cashier : Cashier)->Cashier?{
       return  Storage.storage.cashierList[cashier.employeeId]
    }
    
    func getCashier(id : String)->Cashier?{
       return  Storage.storage.cashierList[id]
    }
    
}
