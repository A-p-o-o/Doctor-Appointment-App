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
    
    func isExist(id:String)->Bool{
      return  Storage.storage.adminList.contains(where: {($0.key).caseInsensitiveCompare(id) == .orderedSame})
    }
    
    func update(admin : Admin){
        Storage.storage.adminList[admin.employeeId] = admin
    }
    
    func remove(id : String){
        Storage.storage.adminList[id] = nil
    }
    
    func getAdmin(admin : Admin)->Admin?{
       return  Storage.storage.adminList[admin.employeeId]
    }
    
    func getAdmin(id : String)->Admin?{
       return  Storage.storage.adminList[id]
    }
}
