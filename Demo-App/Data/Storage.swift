//
//  Storage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


class Storage {
    
    var adminList        : [ String : Admin]
    
    var receptionistList : [ String : Receptionist]
    
    var cashierList      : [ String : Cashier ]
    
    var doctorList       : [ String : Doctor ]
    
    var availableDoctors : [ String : [DoctorAvailability] ]
    
    var userDetails      : [ String : any User ]
    
    var patientList      : [ String : Patient ]
    
    var visitorList      : [ String : [Visitor]]
    
    var reportsList      : [ String : [Report] ]
    
    var appointmentList  : [ String : Appointment]
    
    var BillList         : [ String : [Bill] ]
    
    var reviewList       : [ String : [Review] ]
    
    private init() {
        self.adminList        = [ String : Admin]()
        self.receptionistList = [ String : Receptionist]()
        self.cashierList      = [ String : Cashier ]()
        self.doctorList       = [ String : Doctor ]()
        self.availableDoctors = [ String : [DoctorAvailability] ]()
        self.userDetails      = [ String : any User ]()
        self.patientList      = [ String : Patient ]()
        self.visitorList      = [ String : [Visitor]]()
        self.reportsList      = [ String : [Report] ]()
        self.appointmentList  = [ String : Appointment]()
        self.BillList         = [ String : [Bill] ]()
        self.reviewList       = [ String : [Review] ]()
        
        
    }
    
    static var storage = Storage()
    
    static func createStorage(){
        _ = CreateStorage()
    }
     
}

class CreateStorage{
    
    init(){
        availDoc()
        addDoctors()
        setAvailableDoctors()
    }
    
    func setAvailableDoctors(){
        
        let doctors = Array(Storage.storage.doctorList.values)
        for day in 0...14{
           let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
            var availabeDoctors = [DoctorAvailability]()
            for doctor in doctors{
                availabeDoctors.append( DoctorAvailability(doctorId: doctor.employeeId,department: doctor.department, isAvailable: true))
            }
            Storage.storage.availableDoctors[dateFormat(date: date)] = availabeDoctors
       }
   }
   
   
   func availDoc(){
       
       let _ = Patient(userName: "", password: "D1234567", UserId: "userId@gmail.com", role: .Patient, name: "Steve Rogers", phoneNumber: "8452984578", sex: .Male, mail: "mail@gmail.com", address: "hd,d,dh,fjd", patientId: "P1", weight: 89, height: 182, AllergyTo: "None")
      // userDetails["userId@gmail.com"] = patientList["P1"]

       Storage.storage.doctorList["D1"] = Doctor(userName: "Doc", password: "Doc", UserId: "doctorId", employeeId: "D1", dateJoined: Date(), education: "Doc", role: .Doctor, name: "Doc", phoneNumber: "Doc", sex: .Male, mail: "Doc", address: "Doc", department: .Neurologist, experience: 23,languagesKnown: "english",appointmentFee: 300,image: "MaleDoctor1")
       
       Storage.storage.doctorList["D2"] = Doctor(userName: "Naveen kumar Dugar", password: "Doc", UserId: "Doc", employeeId: "D2", dateJoined: Date(), education: "Doc", role: .Doctor, name: "Naveen Kumar Duagar", phoneNumber: "Doc", sex: .Male, mail: "Doc", address: "Doc", department: .Cardiologist, experience: 2,languagesKnown: "english",appointmentFee: 300,image: "MaleDoctor2")
       
       Storage.storage.doctorList["D3"] = Doctor(userName: "Guhan", password: "Doc", UserId: "Doc", employeeId: "D3", dateJoined: Date(), education: "Doc", role: .Doctor, name: "Guhan", phoneNumber: "Doc", sex: .Male, mail: "Doc", address: "Doc", department: .Cardiologist, experience: 12,languagesKnown: "english",appointmentFee: 300,image: "MaleDoctor3")
       
       Storage.storage.doctorList["D4"] = Doctor(userName: "User name", password: "Doc", UserId: "Doc", employeeId: "D4", dateJoined: Date(), education: "Doc", role: .Doctor, name: "Arun Prasanth M", phoneNumber: "Doc", sex: .Male, mail: "Doc", address: "Doc", department: .Orthopedist, experience: 2,languagesKnown: "english",appointmentFee: 300,image: "MaleDoctor4")
       
   }
   
   
   func addDoctors(){
       
       let femaleDoctorNames : [String] =  ["Emma", "Olivia", "Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Evelyn", "Abigail", "Harper", "Emily", "Elizabeth", "Avery", "Sofia", "Ella", "Madison", "Scarlett", "Victoria", "Aria", "Grace", "Chloe", "Camila", "Penelope", "Riley", "Layla", "Lillian", "Nora", "Zoey", "Mila", "Aubrey", "Hannah", "Lily", "Addison", "Eleanor", "Natalie", "Savannah", "Brooklyn", "Leah", "Zoe", "Stella", "Hazel", "Ellie", "Paisley", "Audrey", "Skylar", "Violet", "Claire", "Bella", "Aurora", "Lucy", "Anna", "Samantha", "Caroline", "Genesis", "Aaliyah", "Kennedy", "Kinsley", "Allison", "Maya", "Sarah", "Madelyn", "Adeline", "Alexa", "Ariana", "Elena", "Gabriella", "Naomi", "Alice", "Sadie", "Hailey", "Eva", "Emilia", "Autumn", "Quinn", "Nevaeh", "Piper", "Ruby", "Serenity", "Willow", "Everly", "Cora", "Kaylee", "Lydia", "Aubree", "Arianna", "Eliana", "Peyton", "Melanie", "Gianna", "Isabelle", "Julia", "Valentina", "Nova", "Clara"]

       let maleDoctorNames = ["Apoo","Liam", "Noah","Chris", "William", "James", "Oliver", "Benjamin", "Elijah", "Lucas", "Mason", "Logan", "Alexander", "Ethan", "Jacob", "Michael", "Daniel", "Henry", "Jackson", "Sebastian", "Aiden", "Matthew", "Samuel", "David", "Joseph", "Carter", "Owen", "Wyatt", "John", "Jack", "Luke", "Jayden", "Dylan", "Gabriel", "Isaac", "Levi", "Nathan", "Connor", "Ezra", "Lincoln", "Aaron", "Ryan", "Adam", "Evan", "Nicholas", "Carson", "Landon", "Christopher", "Colton", "Jordan", "Isaiah", "Tyler", "Julian", "Ian", "Cole", "Hunter", "Justin", "Jaxon", "Leonardo", "Grayson", "Liam", "Caleb", "Brayden", "Dominic", "Joshua", "Max", "Miles", "Maxwell", "Axel", "Brody", "Jace", "Hudson", "Leo", "Chase", "Nicholas", "Tristan", "Cameron", "Oscar", "Wyatt", "Charles", "Adam", "Jake", "Alex", "Cade", "Blake", "Christian", "Cooper", "Declan", "Finn", "George", "Jasper", "Jude", "Kingston", "Louis", "Luca", "Mateo", "Oliver", "Parker", "Rhett", "Theo"]
       
       let allExperience : [Int] = [2,6,4,9,10,12,8,5]
       
       let allLanguages : [String] = ["Tamil","French","Kannada","Japanesh","Chinesh","Hindhi","Malayalam"]

       let allFees : [Int] = [300,400,450,350,750,500]
       
       let maleImage : [String] = ["MaleDoctor1","MaleDoctor2","MaleDoctor3","MaleDoctor4","MaleDoctor5","MaleDoctor6"]
       
       let femaleImage : [String] = ["femalDoctor1","femalDoctor2","femalDoctor3","femalDoctor4","femalDoctor5","femalDoctor6","femalDoctor7","femalDoctor8","femalDoctor9","femalDoctor10"]
       let departments = Department.allCases
       
       var number = 5
       for department in departments {
           
           
           
           
           for _ in 1...30 {
               
               let employeeId = "D\(number)"
               let maleName = "\(maleDoctorNames.randomElement()!) \(maleDoctorNames.randomElement()!)"
               let experience = allExperience.randomElement()
               let languageKnown = "English, \(allLanguages.randomElement()!)"
               let fee = allFees.randomElement()!
               let image = maleImage.randomElement()!
               
               Storage.storage.doctorList[employeeId] = Doctor(userName: maleName, password: maleName, UserId: "\(maleName)@gmail.com", employeeId: employeeId, dateJoined: Date(), education: "", role: .Doctor, name: maleName, phoneNumber: "", sex: .Male, mail: "\(maleName)@gmail.com", address: "", department: department, experience: experience!,languagesKnown: languageKnown,appointmentFee: fee,image: image)
               number += 1
           }
           
           for _ in 1...15{
               
               let employeeId = "D\(number)"
               let femaleName = "\(femaleDoctorNames.randomElement()!) \(maleDoctorNames.randomElement()!)"
               let experience = allExperience.randomElement()
               let languageKnown = "English, \(allLanguages.randomElement()!)"
               let fee = allFees.randomElement()!
               let image = femaleImage.randomElement()!
               
               Storage.storage.doctorList[employeeId] = Doctor(userName: femaleName, password: femaleName, UserId: "\(femaleName)@gmail.com", employeeId: employeeId, dateJoined: Date(), education: "", role: .Doctor, name: femaleName, phoneNumber: "", sex: .Female, mail: "\(femaleName)@gmail.com", address: "", department: department, experience: experience!,languagesKnown: languageKnown,appointmentFee: fee,image: image)
               
               number += 1
           }
       }
       
   }
}



