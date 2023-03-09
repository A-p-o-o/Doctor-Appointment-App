//
//  VisitorDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation

struct VisitorDAO{
    
    
    func addVisitor(visitor : Visitor,date : Date){
        
        if var visitors = Storage.storage.visitorList[dateFormat(date: date)]{
            visitors.append(visitor)
            Storage.storage.visitorList[dateFormat(date: date)] = visitors
        }
        else {
            Storage.storage.visitorList[dateFormat(date: date)] = [visitor]
        }
        
        
    }
    
    func getVisitor(date : Date)->[Visitor]?{
        return  Storage.storage.visitorList[dateFormat(date: date)]
    }
    
    func getvisitor(patientId : String , date : Date)->[Visitor]?{
        guard let visitors = Storage.storage.visitorList[dateFormat(date: date)] else { return nil }
        
        var visitedPerson = [Visitor]()
        for visitor in visitors {
            
            if visitor.patientVisiting.patientId == patientId{
                visitedPerson.append(visitor)
            }
        }
        return visitedPerson
    }
    
    
}
