//
//  PatientHomePage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class PatientHomePage: UIViewController {
    
    let scrollView = UIScrollView()
    let stack = UIStackView()
    let surgery = SurgeryView()
    let sysmptoms = SymptomsView()
    let specialist : SpecialistView
    let findDoctors = SelectDoctors()
    let articles = ArticleView()
    
    
    let patient : Patient
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
       // setGradient()
        setScroll()
        setStack()
        setSurgery()
        setSymptomsView()
        setSpecialist()
        setDoctors()
        setArticles()
        
        findDoctors.patient = self.patient
        
    }
    
    init(patient : Patient){
        self.patient = patient
        self.specialist = SpecialistView(patient: patient)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    func setScroll(){
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    func setStack(){
        scrollView.addSubview(stack)
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
                    stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                    stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
                ])
        
    }
    
    func setSurgery(){
        stack.addArrangedSubview(surgery)
        surgery.translatesAutoresizingMaskIntoConstraints = false
        surgery.layer.cornerRadius = 10
       
        
        NSLayoutConstraint.activate([
            surgery.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.30),
            surgery.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
        ])
        
        surgery.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(surgeryViewTapped))
        surgery.addGestureRecognizer(tapGesture)
        
       
    }
    
   func setSymptomsView(){
        stack.addArrangedSubview(sysmptoms)
       
       sysmptoms.layer.cornerRadius = 10
       sysmptoms.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        sysmptoms.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.45),
           sysmptoms.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
       ])
    }
    
    func setSpecialist(){
        specialist.layer.cornerRadius = 10
        specialist.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(specialist)

        NSLayoutConstraint.activate([
            specialist.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.75),
            specialist.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
        ])
        
        
        
        specialist.viewController = self
        
        
    }
    
    func setDoctors(){
       
        findDoctors.layer.cornerRadius = 10
        findDoctors.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(findDoctors)

        NSLayoutConstraint.activate([
            findDoctors.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.30),
            findDoctors.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
        ])
        
        findDoctors.viewController = self
        
        findDoctors.footer.addTarget(self, action: #selector(viewAllSpecialist), for: .touchUpInside)
        
    }
    
    
    
    func setArticles(){
        articles.layer.cornerRadius = 10
        articles.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(articles)

        NSLayoutConstraint.activate([
            articles.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.55),
            articles.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
        ])
        
    }
    
    func setGradient(){
        if view.layer.sublayers?.count != nil {
            view.layer.sublayers![0].removeFromSuperlayer()
        }
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = view.bounds
        gradientLayer2.colors = [UIColor(named: "black")!.cgColor,UIColor(named:"white")!.cgColor,UIColor.blue.cgColor]
        gradientLayer2.startPoint = CGPoint(x: 0, y: 0)
        view.layer.insertSublayer(gradientLayer2, at: 0)
    }
    
    @objc func viewAllSpecialist(){
        print("button")
        let vc = PatientSearchController(patient: patient)
        vc.searchField.placeholder = "Enter Doctor Name"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func surgeryViewTapped(){
        tabBarController?.selectedIndex = 1
    }
    
 
    
}
