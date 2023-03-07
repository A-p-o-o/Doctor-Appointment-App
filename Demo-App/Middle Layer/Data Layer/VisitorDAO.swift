//
//  VisitorDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation

struct VisitorDAO{
    
    
    func addVisitor(visitor : Visitor,date : Date){
        
        guard let visitorsOnDate = Storage.storage.visitorList[date] else {
            Storage.storage.visitorList[date] = [visitor]
        }
        
        var visitors = visitorsOnDate
        visitors.append(visitor)
        Storage.storage.visitorList[date] = visitors
        
    }
    
    func getVisitor(date : Date)->[Visitor]?{
        return  Storage.storage.visitorList[date]
    }
    
    func getvisitor(patientId : String , date : Date)->[Visitor]?{
        guard let visitors = Storage.storage.visitorList[date] else { return nil }
        
        let visitedPerson : [Visitor]?
        for visitor in visitors {
            
            if visitor.patientVisiting.patientId == patientId{
                visitedPerson?.append(visitor)
            }
        }
        return visitedPerson
    }
    
    
}
