//
//  Doctor.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Doctor : Employee,User,Equatable{
    
    
    typealias MyType = Doctor
    
    var userName: String
    
    var password: String
    
    var UserId: String
    
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
    
    var appointments : (upcoming :[String : [Appointment]]? ,completed : [String : [Appointment]]?) {
        appointmentDAO.getAppointment(doctor: self)
    }
    
    var reviews : [ Review ]? {
        reviewDAO.getReviews(doctorId: employeeId)
    }
    
    
    
    init(userName: String, password: String, UserId: String, employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String, department: Department, experience: Int) {
        self.userName = userName
        self.UserId = UserId
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
        self.password = password
        
    }
    
    static func == (lhs: Doctor, rhs: Doctor) -> Bool {
        if (lhs.name).caseInsensitiveCompare(rhs.name) == .orderedSame && (lhs.employeeId).caseInsensitiveCompare(rhs.employeeId) == .orderedSame
            && lhs.bloodGroup == rhs.bloodGroup{
            return true
        }
        else {
            return false
        }
    }
    
    func changePassword(newPassword: String) {
        userDAO.changePassword(userId: UserId, newPassword: password)
    }
    
    func viewProfile() -> Doctor {
        return self
    }
    
    func changeAvailability(date: Date){
        guard var availability = doctorDAO.getAvailableDoctors(on: date) else {
            return
        }
        for index in 0..<availability.count {
            if (availability[index].doctorId == self.employeeId){
                availability[index].isAvailable = !availability[index].isAvailable
            }
        }
        doctorDAO.changeDoctorAvailability(date: date, doctors: availability)
    }
    
    func generateReport(reportId: String, patient: Patient, description: String, treatmentProvided: String, medicinePrescribed: String){
       let report = Report(reportId: reportId, patient: patient, generatedOn: Date(), description: description, treatmentProvided: treatmentProvided, medicinePrescribed: medicinePrescribed,generatedBy: self)
        reportDAO.addReport(report: report)
    }
    
    func viewPatientReport(patientId : String)->[Report]?{
        reportDAO.getReports(patientId: patientId)
    }
    
    func changeSlot(date : Date,noOfSlot : Int,slots : [Slot]){
        guard let availableDoctors = doctorDAO.getAvailableDoctors(on: date) else {
            return
        }
        var doctorAvailability = [DoctorAvailability]()
        for var doctor in availableDoctors {
            if doctor.doctorId.caseInsensitiveCompare(self.employeeId) == .orderedSame &&
                doctor.department == self.department {
                doctor.slots = slots
            }
            doctorAvailability.append(doctor)
        }
        doctorDAO.updateDoctorAvailability(date: date, doctorAvailability: doctorAvailability)
    }
    
    
    

    
    
    private let doctorDAO = DoctorDAO()
    private let patientDAO = PatientDAO()
    private let userDAO = UserDAO()
    private let reportDAO = ReportDAO()
    private let reviewDAO = ReviewDAO()
    private let appointmentDAO = AppointmentDAO()
}
