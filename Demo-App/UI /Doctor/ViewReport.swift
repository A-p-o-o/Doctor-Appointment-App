//
//  ViewReport.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 21/03/23.
//

import UIKit

class ViewReport: UIViewController {

    let doctor : Doctor
    
    init (doctor : Doctor){
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
