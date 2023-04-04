//
//  PatientTabBarController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientTabBarController: UITabBarController ,UITabBarControllerDelegate{

    
    var patient :Patient { Patient(userName: "", password: "", UserId: "", role: .Patient, name: "Arnold", phoneNumber: "", sex: .Male, mail: "", address: "", patientId: "", weight: 02, height: 2, AllergyTo: "") }
    
    
    var home : PatientHomePage? = nil
    var myAppointments : MyAppointments? = nil
    var search : BookAppointmentOfYourChoiceController? = nil
    var profile : MyAccountController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        home = PatientHomePage(patient: patient)
        myAppointments = MyAppointments(patient: patient)
        search = BookAppointmentOfYourChoiceController()
        search!.patient = patient
        profile = MyAccountController(patient: patient)
        set()
    }
    
    
    
    func set(){
        
        home!.tabBarItem = UITabBarItem(title: "Home", image:UIImage(systemName: "house") , tag: 0)
        search!.tabBarItem = UITabBarItem(title: "Book Appointment", image:UIImage(systemName: "calendar.badge.clock") , tag: 1)
        myAppointments!.tabBarItem = UITabBarItem(title: "Appointments", image:UIImage(systemName: "person.badge.clock.fill") , tag: 3)
        profile?.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle.fill"), tag: 4)
        
       
        
        setViewControllers( [home!,search!,myAppointments!,profile!], animated: false)
        
        modalPresentationStyle = .fullScreen
        
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
        
       
    }
    
    

}
