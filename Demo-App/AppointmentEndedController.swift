//
//  AppointmentEndedController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/04/23.
//

import UIKit

class AppointmentEndedController: UIViewController {

    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let completedImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "completed")
         imageView.contentMode = .scaleAspectFit
         imageView.layer.cornerRadius = 10
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
    
    let completedLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Your Appointment Has been Completed Succcessfully"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pleaseRateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Please rate the Doctor"
        label.adjustsFontSizeToFitWidth = true
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startImages : RatingView = RatingView()
    
    let postYourComment : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Post Your Comment"
        label.numberOfLines = 0
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentBox : UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.5)
        textView.tintColor = UIColor(named: "book")
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(named: "book")?.cgColor
        textView.showsVerticalScrollIndicator = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let postButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = UIColor(named: "book")
        button.setTitle("Post", for: .normal)
        return button
    }()
    
    let backButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = .red
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setContainerViews()
        setUpViews()
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
        
        commentBox.delegate = self
        
    }
    
    
    func setUpViews(){
        
        stackView.addArrangedSubview(completedImage)
        stackView.addArrangedSubview(completedLabel)
        stackView.addArrangedSubview(pleaseRateLabel)
        stackView.addArrangedSubview(startImages)
        stackView.addArrangedSubview(postYourComment)
        stackView.addArrangedSubview(commentBox)
        stackView.addArrangedSubview(postButton)
        stackView.addArrangedSubview(backButton)
        
        startImages.translatesAutoresizingMaskIntoConstraints = false
        
        let completedlabelSize = completedLabel.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFLOAT_MAX))
        let rateDoctorlabelSize = pleaseRateLabel.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFLOAT_MAX))
        let postUrCommentSize = postYourComment.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFLOAT_MAX))
        let ratingSize = startImages.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFLOAT_MAX))
        
        NSLayoutConstraint.activate([
            completedImage.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
            completedLabel.heightAnchor.constraint(equalToConstant: completedlabelSize.height),
            pleaseRateLabel.heightAnchor.constraint(equalToConstant: rateDoctorlabelSize.height),
            startImages.heightAnchor.constraint(equalToConstant: ratingSize.height+20),
            postYourComment.heightAnchor.constraint(equalToConstant: postUrCommentSize.height),
            commentBox.heightAnchor.constraint(equalToConstant: Viewheight * 0.15),
            postButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            backButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),

        ])
        postButton.addTarget(self, action: #selector(postClicked), for: .touchUpInside)
        
        
    }
    
    @objc func postClicked(){
        
        view.endEditing(true)
        if commentBox.text.isEmpty{
            commentBox.layer.borderColor = UIColor.red.cgColor
            commentBox.text = "*required"
        }
        
        
    }
    
    

}

extension AppointmentEndedController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.layer.borderColor = UIColor(named: "book")?.cgColor
        textView.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.8)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.5)
    }
    
}
