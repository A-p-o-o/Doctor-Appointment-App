//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 04/04/23.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {
   
        let reminderTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter Reminder"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        let datePicker: UIDatePicker = {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .dateAndTime
            datePicker.minimumDate = Date()
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            return datePicker
        }()
        
        let repeatSegmentedControl: UISegmentedControl = {
            let segmentedControl = UISegmentedControl(items: ["None", "Daily", "Custom"])
            segmentedControl.selectedSegmentIndex = 0
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            return segmentedControl
        }()
        
        let saveButton: UIButton = {
            let button = UIButton(type: .system)
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = UIColor(named: "book")
            button.setTitle("Save Reminder", for: .normal)
            button.addTarget(ViewController.self, action: #selector(saveReminder), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor(named: "background")
            title = "Create Reminder"
            setupViews()
            
            NotificationCenter.default.addObserver(self, selector: #selector(systemTimeDidChange), name: UIApplication.significantTimeChangeNotification, object: nil)
        }
    
    @objc func systemTimeDidChange() {
        let currentTime = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: currentTime)
        let currentMinute = calendar.component(.minute, from: currentTime)

        let components = DateComponents(hour: currentHour, minute: currentMinute)
        let minimumDate = calendar.date(byAdding: components, to: currentTime)
           datePicker.minimumDate = minimumDate
        datePicker.date = Date()
       }
    
        func setupViews() {
            view.addSubview(reminderTextField)
            view.addSubview(datePicker)
            view.addSubview(repeatSegmentedControl)
            view.addSubview(saveButton)
            
            NSLayoutConstraint.activate([
                reminderTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                reminderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                reminderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                reminderTextField.heightAnchor.constraint(equalToConstant: 44),
                
                datePicker.topAnchor.constraint(equalTo: reminderTextField.bottomAnchor, constant: 16),
                datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                repeatSegmentedControl.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
                repeatSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                repeatSegmentedControl.heightAnchor.constraint(equalToConstant: 30),
                
                saveButton.topAnchor.constraint(equalTo: repeatSegmentedControl.bottomAnchor, constant: 32),
                saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                saveButton.heightAnchor.constraint(equalToConstant: 44),
                saveButton.widthAnchor.constraint(equalToConstant: 150)
            ])
        }
        
        @objc func saveReminder() {
            let content = UNMutableNotificationContent()
            content.title = reminderTextField.text ?? ""
            content.body = "Reminder"
            
            let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: datePicker.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request) { (error) in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                } else {
                    print("Notification scheduled successfully.")
                }
            }
        }
    }
