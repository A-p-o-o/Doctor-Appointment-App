//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 30/03/23.
//

import UIKit

class PrescribeMedicineController: UIViewController{

    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
       setNavigationBar()
       setViews()
        view.backgroundColor = UIColor(named: "background")
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    func setNavigationBar(){
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "barcolour")
        
        let addbarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMedicine))
        addbarButton.tintColor = .black
        
        let removeBarButton = UIBarButtonItem(image: UIImage(systemName: "minus"), style: .plain, target: self, action: #selector(removeMedicine))
        removeBarButton.image = UIImage(systemName: "minus")
        removeBarButton.tintColor = .black
        
        let okBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneSelected))
        okBarButton.tintColor = .black
        
        navigationController?.navigationItem.titleView?.tintColor = .black
        navigationItem.rightBarButtonItems = [okBarButton,removeBarButton,addbarButton]
        
    }
    
    func setViews(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 20)
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let medicineView = MedicineView()
        medicineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            medicineView.heightAnchor.constraint(equalToConstant: Viewheight * 0.43)
        ])
        
        stackView.addArrangedSubview(medicineView)
    }
    
    func scrollToView(view : UIView){
        scrollView.layoutIfNeeded()
        let newY = stackView.convert(view.frame.origin, to: scrollView).y
        scrollView.setContentOffset(CGPoint(x: 0, y: newY), animated: true)
    }
    
    func animateView(view : UIView){
        view.layer.borderWidth = 0
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse], animations: {
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.red.cgColor
        }, completion: nil)

    }
    
    @objc func addMedicine(){
        let count = stackView.arrangedSubviews.count
        
        let medicineView = MedicineView()
        
        medicineView.title.text = "Medicine \(count + 1)"
        
        medicineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            medicineView.heightAnchor.constraint(equalToConstant: Viewheight * 0.43)
        ])
        
        
        stackView.addArrangedSubview(medicineView)
        
        print(stackView.arrangedSubviews.count)
        
        scrollToView(view: medicineView)
    }
   
    
    @objc func removeMedicine(){
        
        if stackView.arrangedSubviews.count > 1 {
            let lastView = stackView.arrangedSubviews[stackView.arrangedSubviews.count - 1]
            
            stackView.removeArrangedSubview(lastView)
            lastView.isHidden = true
        }
    }
    
    @objc func doneSelected(){
        
        for views in stackView.arrangedSubviews {
            
            guard  let medicineView = views as? MedicineView else { return }
        
             
            if  medicineView.medicineNameField.text!.isEmpty {
                print("medicine Name empty")
                print(medicineView.medicineNameField.text)
                scrollToView(view: medicineView)
                animateView(view: medicineView)
                return
            }
            
            var medicineTime : Bool = false
            if medicineView.morning.checkboxButton.isSelected ||
                medicineView.afterNoon.checkboxButton.isSelected ||
                medicineView.night.checkboxButton.isSelected {
                medicineTime = true
            }
            
            if !medicineTime {
                print("Time not given")
                scrollToView(view: medicineView)
                animateView(view: medicineView)

                return
            }
            
            if  medicineView.noOfDaysField.text!.isEmpty {
                print("medicine days empty")
                scrollToView(view: medicineView)
                animateView(view: medicineView)

                return
            }
            
            var mealTime : Bool = false
            if  medicineView.beforeMeal.checkboxButton.isSelected ||
                    medicineView.afterMeal.checkboxButton.isSelected {
                mealTime = true
            }
            
            if !mealTime {
                print("meal time not Given")
                scrollToView(view: medicineView)
                animateView(view: medicineView)

                return
            }
            medicineView.layer.borderWidth = 0
        }
        
        let alertController = UIAlertController(title: "Do you want to prescribe this?", message: nil, preferredStyle: .alert)
        
        let OkAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            print("Everything ok")
         }
        
        let CancelAction = UIAlertAction(title: "No", style: .destructive) { (_) in
            print("Everything not ok")
         }
        
        alertController.addAction(CancelAction)
        alertController.addAction(OkAction)
        present(alertController,animated: true,completion: nil)
        
    }
}
