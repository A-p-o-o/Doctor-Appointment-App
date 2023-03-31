//
//  BookingConfirmedController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 27/03/23.
//

import UIKit

class BookingConfirmedController: UIViewController {

    var presentedByController : UIViewController? = nil
    
    let confirmTickImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "confirmtick")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let confirmationLabel :  UILabel = {
        let label = UILabel()
        label.text = "Congratulations Your Appointment has been booked Successfully"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let okButton :  UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .white
        button.setTitle("Okay", for: .normal)
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setConfirmTickImage()
        
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.isHidden = false 
    }
    
    var heightSpacing : CGFloat {
        Viewheight * 0.02
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
        
    
    func setConfirmTickImage(){
        view.addSubview(confirmTickImageView)
        view.addSubview(confirmationLabel)
        view.addSubview(okButton)
        
        NSLayoutConstraint.activate([
            confirmTickImageView.heightAnchor.constraint(equalToConstant: viewWidth * 0.7),
            confirmTickImageView.widthAnchor.constraint(equalToConstant: viewWidth * 0.7),
            confirmTickImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewWidth * 0.12),
            confirmTickImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Viewheight * 0.15)
        ])
        
        NSLayoutConstraint.activate([
              confirmationLabel.heightAnchor.constraint(lessThanOrEqualToConstant: Viewheight * 0.2),
            confirmationLabel.widthAnchor.constraint(equalToConstant: viewWidth * 0.7),
            confirmationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewWidth * 0.12),
            confirmationLabel.topAnchor.constraint(equalTo: confirmTickImageView.bottomAnchor,constant: heightSpacing)
        ])
        
        NSLayoutConstraint.activate([
            okButton.topAnchor.constraint(equalTo: confirmationLabel.bottomAnchor,constant: 2 * heightSpacing),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              okButton.heightAnchor.constraint(lessThanOrEqualToConstant: Viewheight * 0.1),
            okButton.widthAnchor.constraint(equalToConstant: viewWidth * 0.25),
        ])
        
        okButton.addTarget(self, action: #selector(okselected), for: .touchUpInside)
    }
    
    @objc func okselected(){
        dismiss(animated: true)
        presentedByController?.navigationController?.popToRootViewController(animated: true)
       
    }
    
}
