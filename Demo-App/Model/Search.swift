//
//  Search.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import Foundation

struct Search{
    
    
    func searchDepartment(text:String)->[Department]{
        var matchedDepartments = [Department]()
        
        for department in Department.allCases{
            let departmentname = "\(department)".lowercased()
            
            if departmentname.contains(text.lowercased()){
                matchedDepartments.append(department)
            }
        }
        return matchedDepartments
        
    }
    
}
