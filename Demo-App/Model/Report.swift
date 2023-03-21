//
//  Report.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Report{
    
    let reportId : String
    let patient : Patient
    let generatedOn : Date
    let description : String
    let treatmentProvided : String
    let medicinePrescribed : String
    let generatedBy : Doctor
    
    init(reportId: String, patient: Patient, generatedOn: Date, description: String, treatmentProvided: String, medicinePrescribed: String,generatedBy : Doctor) {
        self.reportId = reportId
        self.patient = patient
        self.generatedOn = generatedOn
        self.description = description
        self.treatmentProvided = treatmentProvided
        self.medicinePrescribed = medicinePrescribed
        self.generatedBy = generatedBy
    }
}
