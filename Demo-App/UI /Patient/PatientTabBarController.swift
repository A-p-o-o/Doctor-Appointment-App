//
//  PatientTabBarController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientTabBarController: UITabBarController {

    
    var patient :Patient { Patient(userName: "", password: "", UserId: "", role: .Patient, name: "", phoneNumber: "", sex: .Male, mail: "", address: "", patientId: "", weight: 02, height: 2, AllergyTo: "") }
    
    
    var home : PatientHomePage? = nil
    var reports : ReportsPage? = nil
    var myAppointments : MyAppointments? = nil
    var search : PatientSearchController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        home = PatientHomePage(patient: patient)
        reports = ReportsPage()
        myAppointments = MyAppointments(patient: patient)
        search = PatientSearchController(patient: patient)
        set()
    }
    
    
    
    func set(){
        
        home!.tabBarItem = UITabBarItem(title: "Home", image:UIImage(systemName: "house") , tag: 0)
        search!.tabBarItem = UITabBarItem(title: "Book Appointment", image:UIImage(systemName: "calendar.badge.clock") , tag: 1)
        reports!.tabBarItem = UITabBarItem(title: "Reports", image:UIImage(systemName: "list.bullet.clipboard.fill") , tag: 2)
        myAppointments!.tabBarItem = UITabBarItem(title: "Appointments", image:UIImage(systemName: "person.badge.clock.fill") , tag: 3)
        
        setViewControllers([home!,search!,myAppointments!,reports!], animated: false)
        modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .lightGray
        
        tabBar.tintColor = .systemRed
    }

}
