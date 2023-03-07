//
//  AdminDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation

struct AdminDAO{
    
    
    func addAdmin(admin : Admin){
        Storage.storage.adminList[admin.employeeId] = admin
    }
    
    func update(admin : Admin){
        Storage.storage.adminList[admin.employeeId] = admin
    }
    
    func remove(admin : Admin){
        Storage.storage.adminList[admin.employeeId] = nil
    }
    
    func getCashier(admin : Admin)->Admin?{
       return  Storage.storage.adminList[admin.employeeId]
    }
}
