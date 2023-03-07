//
//  Admin.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation




struct Admin : Employee{
    var employeeId: String
    
    var dateJoined: Date
    
    var education: String
    
    var role: Role = .Admin
    
    var name: String
    
    var age: Int?
    
    var bloodGroup: BloodGroup?
    
    var phoneNumber: String
    
    var sex: Sex
    
    var dateOfBirth: Date?
    
    var mail: String
    
    var address: String
    
    
    
    init(employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int, bloodGroup: BloodGroup, phoneNumber: String, sex: Sex, dateOfBirth: Date, mail: String, address: String) {
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
    }
    
    
    
    
    func createNewAdmin(employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int, bloodGroup: BloodGroup, phoneNumber: String, sex: Sex, dateOfBirth: Date, mail: String, address: String){
        
       let admin = Admin(employeeId: employeeId, dateJoined: dateJoined, education: education, role: role, name: name, age: age, bloodGroup: bloodGroup, phoneNumber: phoneNumber, sex: sex, dateOfBirth: dateOfBirth, mail: mail, address: address)
    }
    
    func addDoctor(employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String, department: Department, experience: Int){
        
        let doctor = Doctor(employeeId: employeeId, dateJoined: dateJoined, education: education, role: .Doctor, name: name, age: age, bloodGroup: bloodGroup, phoneNumber: phoneNumber, sex: sex, dateOfBirth: dateOfBirth, mail: mail, address: address,department: department, experience: experience)
        
    }
    
    func addReceptionist(name: String, phoneNumber: String, sex: Sex, mail: String, address: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, dateOfBirth: Date? = nil, employeeId: String, dateJoined: Date, education: String, role: Role){
        
        let receptionist = Receptionist(name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address, employeeId: employeeId, dateJoined: dateJoined, education: education, role: .Receptionist)
    }
    
    func addCashier(employeeId: String, dateJoined: Date, education: String, role: Role, name: String, age: Int? = nil, bloodGroup: BloodGroup? = nil, phoneNumber: String, sex: Sex, dateOfBirth: Date? = nil, mail: String, address: String){
        
        let cashier = Cashier(employeeId: employeeId, dateJoined: dateJoined, education: education, role: .Cashier, name: name, phoneNumber: phoneNumber, sex: sex, mail: mail, address: address)
    }
    
    func removeEmployee(){
        
    }
    
    func viewEmployee(){
        
    }
    
    func viewPatient(search : String)->[Patient]?{
        return patientDAO.getPatient(search: search)
    }
    
    func viewAll(){
        
    }
    
    func viewProfile(){
        
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
