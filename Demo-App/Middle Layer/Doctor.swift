//
//  Doctor.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Doctor : Employee,Equatable{
    
    
    var employeeId: String
    
    var dateJoined: Date
    
    var education: String
    
    var role: Role = .Doctor
    
    var name: String
    
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var phoneNumber: String
    
    var sex: Sex
    
    var dateOfBirth: Date?
    
    var mail: String
    
    var address: String
    
    let department : Department
    
    var experience : Int
    
    var appointments : [ Date : [Slot?]]
    
    var reviews : [ Review ]
    
    
    static func == (lhs: Doctor, rhs: Doctor) -> Bool {
        if (lhs.name).caseInsensitiveCompare(rhs.name) == .orderedSame && (lhs.employeeId).caseInsensitiveCompare(rhs.employeeId) == .orderedSame
            && lhs.bloodGroup == rhs.bloodGroup{
            return true
        }
        else {
            return false
        }
    }
    
    init(employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String, department: Department, experience: Int) {
        self.employeeId = employeeId
        self.dateJoined = dateJoined
        self.education = education
        self.role = role
        self.name = name
        self.age = age
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail
        self.address = address
        self.department = department
        self.experience = experience
        self.appointments = [ Date : [Slot?]]()
        self.reviews = [Review]()
    }
    
    func changeAvailability(date: Date){
        guard let doctors = doctorDAO.getAvailableDoctors(on: date) else {
            return
        }
        var availableDoctors = [Doctor]()
        if doctors.contains(where: {$0 == self}){
            for doctor in doctors {
                if(doctor != self){
                    availableDoctors.append(doctor)
                }
            }
        }
        else{
            availableDoctors = doctors
            availableDoctors.append(self)
        }
        doctorDAO.changeDoctorAvailability(date: date, doctors: availableDoctors)
        
    
    }
    
    func generateReport(reportId: String, PatientId: String, generatedOn: Date, description: String, treatmentProvided: String, medicinePrescribed: String){
        var patient = patientDAO.getPatient(patientId: PatientId)!
        patient.reports?.append(Report(reportId: reportId, PatientId: PatientId, generatedOn: generatedOn, description: description, treatmentProvided: treatmentProvided, medicinePrescribed: medicinePrescribed))
        patientDAO.updatePatient(patient: patient)
    }
    
    func viewPatientReport(patientId : String)->[Report]?{
         let patient = patientDAO.getPatient(patientId: patientId)!
        return patient.reports
    }
    
    mutating func changeSlot(date : Date,noOfSlot : Int){
        appointments[date] = Array(repeating: nil, count: noOfSlot)
        doctorDAO.update(doctor: self)
    }
    
    func viewAppointment(date: Date)->[Slot?]?{
        return appointments[date]
    }
    
    func setSlotTime(date : Date,index:Int,startTime : Date , endtime : Date){
        var slot = appointments[date]!
        slot[index]?.startTime = startTime
        slot[index]?.endTime = endtime
        doctorDAO.update(doctor: self)
    }
    
    func defaultSlot(){
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 0

        let startTimes:[Date] = []
    }
    
    
    
    private let doctorDAO = DoctorDAO()
    private let patientDAO = PatientDAO()
}
