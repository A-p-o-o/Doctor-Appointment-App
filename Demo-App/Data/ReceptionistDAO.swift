//
//  ReceptionistDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation

struct ReceptionistDAO{
    
    func addReceptionist(receptionist : Receptionist){
        Storage.storage.receptionistList[receptionist.employeeId] = receptionist
    }
    
    func isExist(id:String)->Bool{
      return  Storage.storage.receptionistList.contains(where: {($0.key).caseInsensitiveCompare(id) == .orderedSame})
    }
    
    func update(receptionist : Receptionist){
        Storage.storage.receptionistList[receptionist.employeeId] = receptionist
    }
    
    func remove(id:String){
        Storage.storage.receptionistList[id] = nil
    }
    
    func getReceptionist(receptionist : Receptionist)->Receptionist?{
       return  Storage.storage.receptionistList[receptionist.employeeId]
    }
    
    func getReceptionist(id : String)->Receptionist?{
       return  Storage.storage.receptionistList[id]
    }
    
}
