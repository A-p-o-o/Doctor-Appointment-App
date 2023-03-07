//
//  Report.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Report{
    
    let reportId : String
    let PatientId : String
    let generatedOn : Date
    let description : String
    let treatmentProvided : String
    let medicinePrescribed : String
    
    init(reportId: String, PatientId: String, generatedOn: Date, description: String, treatmentProvided: String, medicinePrescribed: String) {
        self.reportId = reportId
        self.PatientId = PatientId
        self.generatedOn = generatedOn
        self.description = description
        self.treatmentProvided = treatmentProvided
        self.medicinePrescribed = medicinePrescribed
    }
}
