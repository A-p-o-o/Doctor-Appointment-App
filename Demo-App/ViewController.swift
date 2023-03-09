//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        main()
    }
    
    
    func main(){
        
        let admin = Admin(userName: "dee", password: "pass", UserId: "123", role: .Admin, employeeId: "1", dateJoined: Date(), education: "B.E", name: "Naveen", phoneNumber: "999", sex: .Male, mail: "naveen@gmail.com", address: "Address")
        
        admin.addCashier(userName: "cashier", password: "cashier", UserId: "c1", name: "cashier", phoneNumber: "cashier", sex: .Male, mail: "cashier", address: "cashier", employeeId: "c1", dateJoined: Date(), education: "cashier", role: .Cashier)
        admin.addReceptionist(userName: "receptionist", password: "receptionist", UserId: "receptionist", name: "receptionist", phoneNumber: "receptionist", sex: .Female, mail: "receptionist", address: "receptionist", employeeId: "r1", dateJoined: Date(), education: "receptionist", role: .Receptionist)
        admin.addDoctor(userName: "doctor", password: "doctor", UserId: "doctor", employeeId: "d1", dateJoined: Date(), education: "doctor", name: "doctor", phoneNumber: "doctor", sex: .Male, mail: "doctor", address: "doctor", department: .neurologist, experience: 5)
        let adminDao = AdminDAO()
        let doctordao = DoctorDAO()
        let cashierdao = CashierDAO()
        let receDao = ReceptionistDAO()
        let patientDao = PatientDAO()
        
        var ad = adminDao.getAdmin(id: "1")!
        var cashier = cashierdao.getCashier(id: "c1")
        let receptionist = receDao.getReceptionist(id: "r1")
        let doctor = doctordao.getDoctor(doctorId: "D1")
        
        receptionist?.addPatient(name: "Patient", age: 34, bloodGroup: .O_positive, phoneNumber: "Patient", sex: .Male, dateOfBirth: Date(), mail: "Patient", address: "Patient", patientId: "Patient", weight: 34, height: 123, AllergyTo: "Patient", password: "Patient", userId: "Patient")
        
        var patient = patientDao.getPatient(patientId: "Patient")
        
        receptionist?.addVisitors(name: "visitor", phoneNumber: "visitor", sex: .Male, mail: "visitor", address: "visitor", patientVisiting: patient!, visitTime: Date())
        
        let slot : [Slot] = [.slot(number: 1, time: .coustomtime(start: "---", end: "---"))]
        doctor?.changeSlot(date: Date(), noOfSlot: 1, slots:slot )
       
       let appo = Appointment(patientId: patient!.patientId, patientName: patient!.name, patientMobileNumber: patient!.phoneNumber, doctor: doctor!, date: Date(), slot: .slot(number: 1, time: .time1()))
       //print( doctor?.appointments)
        print(patient?.createAppointment(doctor: appo.doctor, date: appo.date, slot: appo.slot))
      // print( patient?.createAppointment(doctor: appo.doctor, date: appo.date, slot: appo.slot))
       print("cancel", patient?.cancelAppointment(appointment: appo))
      // print( doctor?.appointments)
//
//        print( patient?.createAppointment(doctor: appo.doctor, date: appo.date, slot: appo.slot))
//
//        print( doctor?.appointments)
//
//        print(Storage.storage.cashierList)
//        print(Storage.storage.receptionistList)
//        print(Storage.storage.userDetails)
 //      print(Storage.storage.patientList)
//        print(Storage.storage.BillList)
        print(Storage.storage.appointmentList)
        //print(Storage.storage.visitorList)
        //print(Storage.storage.reportsList)
        //doctor?.changeAvailability(date: Date())
          print(Storage.storage.availableDoctors[dateFormat(date: Date())])
     //   print(Storage.storage.reviewList)
    }


}

