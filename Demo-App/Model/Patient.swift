//
//  Patient.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Patient : Person,User{
    typealias MyType = Patient
    
    var userName: String
    
    var password: String 
    
    var UserId: String
    
    var role: Role
    
    var age: Int? {
        Int(Date().timeIntervalSince(dateOfBirth!)/(86400*365))
    }
    
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
    
    var reports : [Report]? {
        reportDAO.getReports(patientId: patientId)
    }
    
    init(userName: String, password: String, UserId: String, role: Role, bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, name: String, phoneNumber: String, sex: Sex, mail: String, address: String, patientId: String, weight: Double, height: Double, AllergyTo: String) {
        self.userName = userName
        self.UserId = UserId
        self.role = role
        self.bloodGroup = bloodGroup
        self.dateOfBirth = dateOfBirth
        self.name = name
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.mail = mail
        self.address = address
        self.patientId = patientId
        self.weight = weight
        self.height = height
        self.AllergyTo = AllergyTo
        self.password = password
    }
    
    func changePassword(newPassword : String) {
        userDAO.changePassword(userId: UserId, newPassword: newPassword)
    }
    
    mutating func UpdateInfo( bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, name: String, phoneNumber: String, sex: Sex, mail: String, address: String, weight: Double, height: Double, AllergyTo: String) {
       
        self.name = name
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail
        self.address = address
        self.weight = weight
        self.height = height
        self.AllergyTo = AllergyTo
    }
    
    func viewProfile() -> Patient {
        return self
    }
    
    func createAppointment(doctor: Doctor, date: Date,slot : Slot)->Bool{
        
        var appointment = Appointment(patientId: self.patientId, patientName: self.name, patientMobileNumber: self.phoneNumber,doctor: doctor, date: date, slot:slot )
       return appointmentDAO.add(appointment: &appointment)
    }
    
    func cancelAppointment(appointment : Appointment)->Bool{
       return  appointmentDAO.cancelAppointment(appointment: appointment)
    }
    
    func viewAppointment()->(upcoming:[Appointment]? , completed:[Appointment]?){
       return appointmentDAO.getAppointment(patientId: patientId)
    }
    
    func viewReports()->[Report]?{
        return reports
    }
    
    func giveReview(doctor: Doctor, reviewGivenBy: String, time: Date, Date: Date, star: Int, content: String){
        let review = Review(doctor: doctor, reviewGivenBy: reviewGivenBy, time: time, Date: Date, star: star, content: content)
        reviewDAO.addReview(review: review)
    }
    
    func viewBill()->[Bill]?{
        return billDAO.get(forPatientId: patientId)
    }
    
    func searchDoctor(text : String)->[Doctor]{
       return  doctorDAO.searchDoctor(searchText: text)
    }
    
    func searchDepartmentDoctor(department: Department)->[Doctor]{
        return doctorDAO.searchDepartment(department: department)
    }
    
    private let patientDAO = PatientDAO()
    private let doctorDAO = DoctorDAO()
    private let appointmentDAO = AppointmentDAO()
    private let billDAO = BillDAO()
    private let userDAO = UserDAO()
    private let reportDAO = ReportDAO()
    private let reviewDAO = ReviewDAO()
}
