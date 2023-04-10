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
        Int(Date().timeIntervalSince(dateOfBirth ?? Date())/(86400*365))
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
        self.UserId = UserId.lowercased()
        self.role = role
        self.bloodGroup = bloodGroup
        self.dateOfBirth = dateOfBirth
        self.name = name
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.mail = mail.lowercased()
        self.address = address
        self.patientId = "PA\(patientDAO.setPatientId())"
        self.weight = weight
        self.height = height
        self.AllergyTo = AllergyTo
        self.password = password
        addUser()
        addPatient()
    }
    
    func addUser(){
        userDAO.adduser(user: self)
    }
    
    func addPatient(){
        patientDAO.addPatient(patient: self)
    }
    
    mutating func changePassword(newPassword : String) {
        self.password = newPassword
        patientDAO.updatePatient(patient: self)
    }
    
    func deleteAccount(){
        userDAO.removeUser(userId: self.UserId)
    }
    
    mutating func UpdateInfo( bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, name: String, phoneNumber: String, sex: Sex, mail: String, address: String, weight: Double, height: Double, AllergyTo: String) {
       
        self.name = name
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail.lowercased()
        self.address = address
        self.weight = weight
        self.height = height
        self.AllergyTo = AllergyTo
        patientDAO.updatePatient(patient: self)
    }
    
    func viewProfile() -> Patient {
        return self
    }
    
    func createAppointment(patientName: String, patientMobileNumber: String,email : String,age : Int,gender : Sex,reason : String, doctor: Doctor, date: Date, slot: Slot,type : AppointmentType,cost : Int)->Bool{
        
        var appointment = Appointment(patientName: patientName, patientMobileNumber: patientMobileNumber, email: email, age: age, gender: gender, reason: reason, doctor: doctor, date: date, slot: slot, bookedBy: self,type: type,cost: cost ,bookedTime: Date())
        appointment.status = .upcoming
       return appointmentDAO.addAppointment(appointment: &appointment)
    }
    
    func cancelAppointment(appointment : Appointment,reason : String)->Bool{
        var cancelledAppointment = appointment
        cancelledAppointment.status = .patientCancelled(reason: reason)
        return  appointmentDAO.cancelAppointment(byPatient: cancelledAppointment)
    }
    
    func attendAppointment(appointment : Appointment){
        var attendedAppointment = appointment
        attendedAppointment.status = .completed
        appointmentDAO.updateAppointment(appointment: attendedAppointment)
    }
    
    func viewAppointment()->(upcoming:[Appointment] , completed:[Appointment], cancelled: [Appointment]){
        return appointmentDAO.getAppointment(patient: self)
    }
    
    func viewReports()->[Report]?{
        return reports
    }
    
    func giveReview(doctor: Doctor, reviewGivenBy: String, time: Date, Date: Date, star: Int, content: String){
        let review = Review(doctor: doctor, reviewGivenBy: reviewGivenBy, time: time, Date: Date, star: star, content: content)
        reviewDAO.addReview(review: review)
    }
    
    
    
    func addTofavourites(doctor : Doctor){
         mobileDAO.addToFavourites(doctor: doctor)
    }
    
    func removeFromfavourites(doctor : Doctor){
        mobileDAO.removeFromFavourites(doctor: doctor)
    }
    
    func getFavouriteDoctors()->[Doctor]{
       return  mobileDAO.getFavouriteDoctors()
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
    private let mobileDAO = MobileDAO()
}
