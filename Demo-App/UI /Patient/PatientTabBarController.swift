//
//  PatientTabBarController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientTabBarController: UITabBarController ,UITabBarControllerDelegate{

    var patient : Patient! = nil
    
    var home : PatientHomePage? = nil
    var myAppointments : MyAppointments? = nil
    var search : BookAppointmentOfYourChoiceController? = nil
    var profile : MyAccountController? = nil
    
    init(userId : String) {
       
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        home = PatientHomePage(userId: patient.UserId)
        myAppointments = MyAppointments(userId: patient.UserId)
        search = BookAppointmentOfYourChoiceController()
        search!.patient = patient
        profile = MyAccountController(userId: patient.UserId)
        set()
    }
    
    
    
    func set(){
        
        home!.tabBarItem = UITabBarItem(title: "Home", image:UIImage(systemName: "house") , tag: 0)
        search!.tabBarItem = UITabBarItem(title: "Book Appointment", image:UIImage(systemName: "calendar.badge.clock") , tag: 1)
        myAppointments!.tabBarItem = UITabBarItem(title: "Appointments", image:UIImage(systemName: "person.badge.clock.fill") , tag: 3)
        profile?.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle.fill"), tag: 4)
        
       let homeNC = UINavigationController(rootViewController: home!)
        let searchNC = UINavigationController(rootViewController: search!)
        let myAppointmentsNC = UINavigationController(rootViewController: myAppointments!)
        let profileNC = UINavigationController(rootViewController: profile!)
        
        setViewControllers( [homeNC,searchNC,myAppointmentsNC,profileNC], animated: false)
        
        modalPresentationStyle = .fullScreen
        
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = UIColor(named: "white")
        
       
    }
    
    

}
