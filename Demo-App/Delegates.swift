//
//  Delegates.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//

import Foundation


protocol AppointmentDataDelegate: AnyObject {
    
    func didCreateAppointment(doctor: Doctor, patient: Patient, starTime: String, endTime: String, date: String, slotNo: Int, appointment: Appointment?, type: AppointmentType)
    
}
