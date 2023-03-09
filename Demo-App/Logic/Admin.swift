//
//  Admin.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation




struct Admin : Employee,User{
    
    typealias MyType = Admin
    
    var userName: String
    
    var password: String
    
    var UserId: String
    
    var role: Role
    
    var employeeId: String
    
    var dateJoined: Date
    
    var education: String
    
    var name: String
    
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var phoneNumber: String
    
    var sex: Sex
    
    var dateOfBirth: Date?
    
    var mail: String
    
    var address: String
    
    
    
    init(userName: String, password: String, UserId: String, role: Role, employeeId: String, dateJoined: Date, education: String, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String) {
        self.userName = userName
        self.UserId = UserId
        self.role = role
        self.employeeId = employeeId
        self.dateJoined = dateJoined
        self.education = education
        self.name = name
        self.age = age
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail
        self.address = address
        self.password = password
        add()
    }
    
    
    mutating func changePassword(newPassword : String) {
        password = newPassword
        userDAO.changePassword(userId: UserId, newPassword: newPassword)
    }
    
    func viewProfile()->MyType{
        return self
    }
    
    mutating func UpdateInfo( education: String, name: String, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String) {
        self.education = education
        self.name = name
        self.bloodGroup = bloodGroup
        self.phoneNumber = phoneNumber
        self.sex = sex
        self.dateOfBirth = dateOfBirth
        self.mail = mail
        self.address = address
        
    }
    
    func add(){
        adminDAO.addAdmin(admin: self)
        userDAO.adduser(user: self)
    }
    
    func createNewAdmin(userName: String, password: String, UserId: String, role: Role, employeeId: String, dateJoined: Date, education: String, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String){
        
        let admin = Admin(userName: userName, password: password, UserId: UserId, role: .Admin, employeeId: employeeId, dateJoined: dateJoined, education: education, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address)
        adminDAO.addAdmin(admin: admin)
        userDAO.adduser(user: admin)
    }
    
    func addDoctor(userName: String, password: String, UserId: String, employeeId: String, dateJoined: Date, education: String, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String, department: Department, experience: Int){
        
        let doctor = Doctor(userName: userName, password: password, UserId: UserId, employeeId: employeeId, dateJoined: dateJoined, education: education, role: .Doctor, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, department: department, experience: experience)
        doctorDAO.add(doctor: doctor)
        userDAO.adduser(user: doctor)
    }
    
    func addReceptionist(userName: String, password: String, UserId: String, name: String, phoneNumber: String, sex: Sex, mail: String, address: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, employeeId: String, dateJoined: Date, education: String, role: Role){
        
        let receptionist = Receptionist(userName: userName, password: password, UserId: UserId, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, employeeId: employeeId, dateJoined: dateJoined, education: education, role: .Receptionist)
        receptionistDAO.addReceptionist(receptionist: receptionist)
        userDAO.adduser(user: receptionist)
    }
    
    func addCashier(userName: String, password: String, UserId: String, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String, employeeId: String, dateJoined: Date, education: String, role: Role){
        
        let cashier = Cashier(userName: userName, password: password, UserId: UserId, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, employeeId: employeeId, dateJoined: dateJoined, education: education, role: .Cashier)
        cashierDAO.addCashier(cashier: cashier)
        userDAO.adduser(user: cashier)
    }
    
    func removeEmployee(id : String){
        guard employeeId != id else{
            return
        }
        if adminDAO.isExist(id: id){
            adminDAO.remove(id: id)
        }
        else if cashierDAO.isExist(id: id){
            cashierDAO.remove(id: id)
        }
        else if doctorDAO.isDoctorExist(doctorId: id){
            doctorDAO.removeDoctor(doctorId: id)
        }
        else if receptionistDAO.isExist(id: id){
            receptionistDAO.remove(id: id)
        }
    }
    
    func viewEmployee(id : String){
        if adminDAO.isExist(id: id){
            adminDAO.remove(id: id)
        }
        else if cashierDAO.isExist(id: id){
            cashierDAO.remove(id: id)
        }
        else if doctorDAO.isDoctorExist(doctorId: id){
            doctorDAO.removeDoctor(doctorId: id)
        }
        else if receptionistDAO.isExist(id: id){
            receptionistDAO.remove(id: id)
        }
    }
    
    func viewPatient(search : String)->[Patient]?{
        return patientDAO.getPatient(search: search)
    }
    
    func viewAll(){
        
    }
    
    func searchDoctor(doctorId : String)->Doctor?{
        return doctorDAO.getDoctor(doctorId: doctorId)
    }
    
    func viewBill(patientId : String)->[Bill]?{
        return billDAO.get(forPatientId: patientId)
    }
    
    func viewAmount(date : Date)->Double{
        return billDAO.getAmmount(forDate: date)
    }
    
    private let doctorDAO = DoctorDAO()
    private let billDAO = BillDAO()
    private let patientDAO = PatientDAO()
    private let userDAO = UserDAO()
    private let receptionistDAO = ReceptionistDAO()
    private let cashierDAO = CashierDAO()
    private let adminDAO = AdminDAO()
    
}
