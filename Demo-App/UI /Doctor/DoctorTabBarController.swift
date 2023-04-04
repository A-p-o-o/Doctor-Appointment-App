//
//  DoctorTabBarController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 04/04/23.
//

import UIKit

class DoctorTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    var doc : Doctor  = {
        let doctordao = DoctorDAO()
      return  doctordao.getDoctor(doctorId: "D1")!
    }()
    
    func setTabBar(){
        self.delegate = self
        
        let home = DoctorHomePageController(userName: "doctorId")
        let changeAvailability = ChangeAvailability(doctor: doc)
        let myAppointments = ViewAppointments(doctor: doc)
        
        home.tabBarItem = UITabBarItem(title: "Home", image:UIImage(systemName: "house") , tag: 0)
        changeAvailability.tabBarItem = UITabBarItem(title: "Change Availability", image:UIImage(systemName: "calendar.badge.clock") , tag: 1)
        myAppointments.tabBarItem = UITabBarItem(title: "My Appointments", image:UIImage(systemName: "person.badge.clock.fill") , tag: 2)
        
        setViewControllers( [home,myAppointments,changeAvailability], animated: false)
        
        modalPresentationStyle = .fullScreen
        
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
        
        selectedIndex = 0
    }

}
