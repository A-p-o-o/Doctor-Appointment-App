//
//  Delegates.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//

import Foundation


protocol AppointmentdetailsControllerDelegate {
    
    func clickedReshedule(_ selectedVC: clickedVC,  appointment: Appointment?) -> Void
}


protocol AppointmentDataDelegate: AnyObject {
    
    func didCreateAppointment(doctor: Doctor, patient: Patient, starTime: String, endTime: String, date: String, slotNo: Int, appointment: Appointment?, type: AppointmentType)
    
}

protocol docotorInformationProtocol: AnyObject {
    func doctorInformations(_ doctor: Doctor)
    func departmentInformation(_ department: Department)
}

protocol PopPageFromPresentedProtocol : AnyObject {
    func popTheViewController()
}

protocol CalledEndedProtocol : AnyObject {
    func callEnded()
}
