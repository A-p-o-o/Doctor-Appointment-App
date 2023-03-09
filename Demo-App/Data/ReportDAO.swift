//
//  ReportsDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 08/03/23.
//

import Foundation

struct ReportDAO{
    
    
    func addReport(report:Report){
        if var reports = Storage.storage.reportsList[report.PatientId]{
            reports.append(report)
            Storage.storage.reportsList[report.PatientId] = reports
        }
        else{
            Storage.storage.reportsList[report.PatientId] = [report]
        }
    }
    
    func getReports(patientId : String)->[Report]?{
      return  Storage.storage.reportsList[patientId]
    }
}
