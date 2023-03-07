//
//  Patient.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Patient : Person{
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var dateOfBirth: Date?
    
    var name: String
    
    var phoneNumber: String
    
    var sex: Sex
    
    var mail: String
    
    var address: String
    
    let patientId : String
    
    var weight : Double
    
    var height : Double
    
    var AllergyTo : String
    
    var reports : [Report]?
    
    init(name: String, age: Int, bloodGroup: BloodGroup, phoneNumber: String, sex: Sex, dateOfBirth: Date, mail: String, address: String, patientId: String, weight: Double, height: Double, AllergyTo: String) {
        self.name = name
        self.age = age
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail
        self.address = address
        self.patientId = patientId
        self.weight = weight
        self.height = height
        self.AllergyTo = AllergyTo
    }
    
    func createAppointment( doctor: Doctor, date: Date,slot : Int){
        
        var appointments : [Slot?]? = doctor.viewAppointment(date: date)
        
        let appointment = Appointment(patientId: patientId, patientName: name, patientMobileNumber: phoneNumber, doctor: doctor, date: date, startTime: startTime, endTime: endTime, status: <#T##Bool#>)
        appointments![slot] = appointment
        doctorDAO.update(doctor: doctor)
        
    }
    
    func cancelAppointment(appointment : Appointment){
        appointmentDAO.cancelAppointment(appointment: appointment)
    }
    
    func viewAppointment()->[Appointment]?{
       return appointmentDAO.getAppointment(patientId: patientId)
    }
    
    func viewReports()->[Report]?{
        return reports
    }
    
    func giveReview(doctor: Doctor, reviewGivenBy: Person, time: Date, Date: Date, star: Int, content: String){
        let review = Review(doctor: doctor, reviewGivenBy: self, time: time, Date: Date, star: star, content: content)
        var doc =  doctor
        doc.reviews.append(review)
        doctorDAO.update(doctor:doc)
    }
    
    func viewBill()->[Bill]?{
        return billDAO.get(forPatientId: patientId)
    }
    
    private let patientDAO = PatientDAO()
    private let doctorDAO = DoctorDAO()
    private let appointmentDAO = AppointmentDAO()
    private let billDAO = BillDAO()
}
