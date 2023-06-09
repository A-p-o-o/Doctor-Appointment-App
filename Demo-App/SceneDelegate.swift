//
//  SceneDelegate.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
                window = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window?.windowScene = windowScene
           
        Storage.createStorage()
                let doctordao = DoctorDAO()
       let doc = doctordao.getDoctor(doctorId: "D1")
//        let patient = Patient(userName: "deepak", password: "", UserId: "", role: .Admin,bloodGroup: .aPositive,dateOfBirth: Date(), name: "Arnold", phoneNumber: "", sex: .Female, mail: "", address: "", patientId: "", weight: 2, height: 2, AllergyTo: "")
//        let d = doc!.getAvailableDates()
        
//        patient.createAppointment(patientName: "Arnold", patientMobileNumber: "", email: "", age: 1, gender: .Female, reason: "", doctor: doc!, date: Date(), slot: .slot(number: 1, time: .time(start: "", end: "")),type: .Offline, cost: 100)
//        patient.createAppointment(patientName: "Joseph", patientMobileNumber: "", email: "", age: 1, gender: .Female, reason: "", doctor: doc!, date: Date(), slot: .slot(number: 2, time: .time(start: "", end: "")),type: .Online, cost: 200)
        
        let rootViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
                
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

