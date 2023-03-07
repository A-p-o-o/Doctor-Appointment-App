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
    
    func update(receptionist : Receptionist){
        Storage.storage.receptionistList[receptionist.employeeId] = receptionist
    }
    
    func remove(receptionist : Receptionist){
        Storage.storage.receptionistList[receptionist.employeeId] = nil
    }
    
    func getCashier(receptionist : Receptionist)->Receptionist?{
       return  Storage.storage.receptionistList[receptionist.employeeId]
    }
    
}
