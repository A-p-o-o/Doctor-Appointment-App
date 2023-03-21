//
//  ReportsDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 08/03/23.
//

import Foundation

struct ReportDAO{
    
    
    func addReport(report:Report){
        if var reports = Storage.storage.reportsList[report.patient.patientId]{
            reports.append(report)
            Storage.storage.reportsList[report.patient.patientId] = reports
        }
        else{
            Storage.storage.reportsList[report.patient.patientId] = [report]
        }
    }
    
    func getReports(patientId : String)->[Report]?{
      return  Storage.storage.reportsList[patientId]
    }
}
