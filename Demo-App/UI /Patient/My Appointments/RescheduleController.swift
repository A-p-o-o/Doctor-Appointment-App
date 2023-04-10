//
//  RescheduleController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/04/23.
//

import UIKit

class RescheduleController: UIViewController {
    
    var appointment : Appointment? = nil
    var delegate: RescheduleControllerDelegate?
    
    init(appointment: Appointment) {
        self.appointment = appointment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let noteLabel :  UILabel = {
        let label = UILabel()
        label.text = "*Note :- By Selecting the below options Your Previous Appointment will be Cancelled"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .red
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   let rescheduleWithLabel :  UILabel = {
       let label = UILabel()
       label.text = "Reschedule With"
       label.lineBreakMode = .byWordWrapping
       label.textColor = .black
       label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
       
       let fontMetrics = UIFontMetrics(forTextStyle: .body)
       label.font = fontMetrics.scaledFont(for: label.font)
       label.adjustsFontForContentSizeCategory = true
       
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()

    let sameDoctor = ImageAndLabelView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "Same Doctor")
    
    let differentDoctor = ImageAndLabelView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "Different Doctor Same Time")
    
    let differentDoctorAndTime = ImageAndLabelView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "Different Doctor And Time")
    
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
        
        stackView.addArrangedSubview(rescheduleWithLabel)
        stackView.addArrangedSubview(noteLabel)
        stackView.addArrangedSubview(sameDoctor)
        stackView.addArrangedSubview(differentDoctor)
        stackView.addArrangedSubview(differentDoctorAndTime)
        
        NSLayoutConstraint.activate([
            rescheduleWithLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.08),
            sameDoctor.heightAnchor.constraint(equalToConstant: Viewheight * 0.08),
            differentDoctor.heightAnchor.constraint(equalToConstant: Viewheight * 0.08),
            differentDoctorAndTime.heightAnchor.constraint(equalToConstant: Viewheight * 0.08),

        ])
        
        
        for views in stackView.arrangedSubviews {
            
            guard let imageAndLabel = views as? ImageAndLabelView else { continue }
            
            imageAndLabel.layer.cornerRadius = 10
            imageAndLabel.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            imageAndLabel.layer.shadowOpacity = 0.5
            imageAndLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
            imageAndLabel.layer.shadowRadius = 5
            imageAndLabel.backgroundColor = UIColor(named: "white")
            
        }
        
        sameDoctor.isUserInteractionEnabled = true
        differentDoctor.isUserInteractionEnabled = true
        differentDoctorAndTime.isUserInteractionEnabled = true
        
        let sameDoctorGesture = UITapGestureRecognizer(target: self, action: #selector(sameDoctorClicked))
        let differentDoctorSameTimeGesture = UITapGestureRecognizer(target: self, action: #selector(differentDoctorSameTimeClicked))
        let differentDoctorAndTimeGesture = UITapGestureRecognizer(target: self, action: #selector(differentDoctorAndTimeClicked))
        
        
        sameDoctor.addGestureRecognizer(sameDoctorGesture)
        differentDoctor.addGestureRecognizer(differentDoctorSameTimeGesture)
        differentDoctorAndTime.addGestureRecognizer(differentDoctorAndTimeGesture)
    }
    
    @objc func sameDoctorClicked(){
        
      
        cancelAppointment()
        
        delegate?.clickedReshedule(.sameDoc, appointment: appointment)

    }
    
    @objc func differentDoctorSameTimeClicked(){
       

        
        cancelAppointment()

        delegate?.clickedReshedule(.DiffDocSameTime, appointment: appointment)


    }
    
    func cancelAppointment(){
      let _ =  appointment?.bookedBy.cancelAppointment(appointment: appointment!, reason: "Re - Scheduled")
      
        navigationController?.popViewController(animated: false)

    }
    
    @objc func differentDoctorAndTimeClicked(){
       

        
        cancelAppointment()
        delegate?.clickedReshedule(.DiffDocAndTime, appointment: appointment)
    }

}

enum clickedVC {
    
    case sameDoc
    case DiffDocSameTime
    case DiffDocAndTime
}

protocol RescheduleControllerDelegate: AnyObject {
    
    func clickedReshedule(_ selectedVC: clickedVC, appointment: Appointment?) -> Void
}

