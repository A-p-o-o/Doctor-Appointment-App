//
//  ChoiceViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/04/23.
//

import UIKit

class ChoiceViewController: UIViewController {

    
    let departmentData : [Department] = Department.allCases
    let timeData : [String] = ["09:00-AM","09:30-AM","10:00-AM","10:30-AM","11:00-AM","11:30-AM","02:00-PM","02:30-PM","03:00-PM","03:30-PM"]
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    
    let chooseDoctorLabel :  UILabel = {
        let label = UILabel()
        label.text = "Choose Your Doctor"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let orLabel  :  UILabel = {
        let label = UILabel()
        label.text = "Book Appointment of Your Convenience Time"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchBar: UISearchBar = {
           let searchBar = UISearchBar()
           searchBar.placeholder = "Search"
           searchBar.searchBarStyle = .minimal
           searchBar.translatesAutoresizingMaskIntoConstraints = false
           return searchBar
       }()
    
       let datePicker: UIDatePicker = {
           let datePicker = UIDatePicker()
           datePicker.datePickerMode = .date
           let calendar = Calendar.current
           let today = Date()
           let sevenDaysFromNow = calendar.date(byAdding: .day, value: 7, to: today)
           datePicker.minimumDate = today
           datePicker.maximumDate = sevenDaysFromNow
           datePicker.translatesAutoresizingMaskIntoConstraints = false
           datePicker.tag = 0
           return datePicker
       }()
       
       let timePicker: UIPickerView = {
           let timePicker = UIPickerView()
           timePicker.tag = 1
           timePicker.translatesAutoresizingMaskIntoConstraints = false
           return timePicker
       }()
       
       let departmentPicker: UIPickerView = {
           let departmentPicker = UIPickerView()
           departmentPicker.tag = 2
           departmentPicker.translatesAutoresizingMaskIntoConstraints = false
           return departmentPicker
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "background")
        setContainerViews()
        setupViews()
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    

    func setContainerViews(){
        view.addSubview(scrollView)
        
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
                ])
        
    }
    
    func setupViews(){
        
        
        
        stackView.addArrangedSubview(chooseDoctorLabel)
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(orLabel)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(timePicker)
        stackView.addArrangedSubview(departmentPicker)
        
        timePicker.delegate = self
        departmentPicker.delegate = self
        
        
        NSLayoutConstraint.activate([
                    
            chooseDoctorLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            chooseDoctorLabel.widthAnchor.constraint(equalToConstant: viewWidth - 40),
            
            searchBar.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            
            orLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.07),
            orLabel.widthAnchor.constraint(equalToConstant: viewWidth - 40),
            
            datePicker.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            datePicker.widthAnchor.constraint(equalToConstant: viewWidth / 2),

            timePicker.heightAnchor.constraint(equalToConstant: Viewheight * 0.1),
            timePicker.widthAnchor.constraint(equalToConstant: viewWidth / 2),

            departmentPicker.heightAnchor.constraint(equalToConstant: Viewheight * 0.1),            departmentPicker.widthAnchor.constraint(equalToConstant: viewWidth / 2),

                ])
            
        }
        
}

extension  ChoiceViewController : UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return timeData.count
        }
        else {
            return departmentData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return timeData[row]
        }
        else {
            return departmentData[row].departmentName
        }
    }
    
}
