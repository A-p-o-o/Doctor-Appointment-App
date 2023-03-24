//
//  GenerateReport.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 21/03/23.
//

import UIKit

class GenerateReport: UIViewController {

    let doctor : Doctor
  //  let patient : Patient
    
    
//    let treatementProvided
//    let medicinePrescribed
//    let description
//
    init (doctor : Doctor){
        self.doctor = doctor
     //   self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    
    
    

}
