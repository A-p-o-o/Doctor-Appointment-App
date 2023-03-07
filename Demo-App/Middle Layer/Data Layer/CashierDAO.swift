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
    
    func update(cashier : Cashier){
        Storage.storage.cashierList[cashier.employeeId] = cashier
    }
    
    func remove(cashier : Cashier){
        Storage.storage.cashierList[cashier.employeeId] = nil
    }
    
    func getCashier(cashier : Cashier)->Cashier?{
       return  Storage.storage.cashierList[cashier.employeeId]
    }
    
    
}
