//
//  CallingController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 03/04/23.
//

import UIKit

class CallingController: UIViewController {

    
    let callerImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let attenderImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottomView : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let endButton : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 50
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setViews()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setViews (){
        
        view.addSubview(callerImage)
        view.addSubview(bottomView)
        view.addSubview(attenderImage)
        view.addSubview(endButton)
        
        NSLayoutConstraint.activate([
            callerImage.topAnchor.constraint(equalTo: view.topAnchor),
            callerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            callerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            callerImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -view.frame.height * 0.07),
            
            attenderImage.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2),
            attenderImage.heightAnchor.constraint(equalToConstant: view.frame.height * 0.2),
            attenderImage.trailingAnchor.constraint(equalTo: callerImage.trailingAnchor,constant: -20),
            attenderImage.bottomAnchor.constraint(equalTo: callerImage.bottomAnchor),
            
            bottomView.topAnchor.constraint(equalTo: callerImage.bottomAnchor ),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            endButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            endButton.centerYAnchor.constraint(equalTo: bottomView.topAnchor),
            endButton.widthAnchor.constraint(equalToConstant: 100),
            endButton.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(moveImage(_:)))
        attenderImage.addGestureRecognizer(panGesture)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(callEnded))
        endButton.addGestureRecognizer(tapGesture)
    }
    
    
    
    @objc func moveImage(_ sender: UIPanGestureRecognizer) {
        
        guard let imageView = sender.view as? UIImageView else { return }
            
            let translation = sender.translation(in: self.view)
        
        let newX =   imageView.center.x + translation.x
        let newY = imageView.center.y + translation.y
        
        if newX > callerImage.frame.minX + view.frame.width * 0.1 &&
            newX < callerImage.frame.maxX - view.frame.width * 0.1 &&
            newY > callerImage.frame.minY + view.frame.height * 0.1 &&
            newY < callerImage.frame.maxY - view.frame.height * 0.1 {
            
            imageView.center = CGPoint(x: newX, y: newY)
        }
        
            
            sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func callEnded(){
        let viewController = PrescribeMedicineController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
