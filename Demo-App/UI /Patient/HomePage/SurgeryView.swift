//
//  SurgeryView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class SurgeryView: UIView {
    
    
    
    let images = [UIImage(named: "neckSurgery"),UIImage(named: "kneeSurgery"),UIImage(named: "cardiacSurgery"),UIImage(named: "handSurgery")]
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.text = "Safe and Secure surgeries by Expert Surgeons "
        label.font = UIFont(name: "futura", size: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
   
   //Middle view
    let middleView = UIView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let pageControl = UIPageControl()
        
        
        

  
    let bottomStackView : UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    let leftLabel : UILabel = {
        let label = UILabel()
        label.text = "All insurances accepted & No Cost EMI available"
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.sizeToFit()
        label.font = UIFont(name: "futura", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightLabel : UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "Book Appointment")
        text.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 16))
        label.textAlignment = .center
        label.attributedText = text
        label.font = UIFont(name: "futura", size: 15)
        label.backgroundColor =  UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 0.6)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMiddleView()
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
        setMiddleView()
    }
    

    
    
    
    func setView(){
        
        
        addSubview(titleLabel)
        addSubview(bottomStackView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.backgroundColor = .green
        
        bottomStackView.addArrangedSubview(leftLabel)
        bottomStackView.addArrangedSubview(rightLabel)
        
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor,constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            
            bottomStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            bottomStackView.widthAnchor.constraint(equalTo: widthAnchor,constant: -40),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
       
        
        
       
    }
    
    func setMiddleView(){
        addSubview(middleView)
        middleView.layer.cornerRadius = 10
        middleView.clipsToBounds = true
        
        middleView.addSubview(scrollView)
        
        
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
       
        
        scrollView.backgroundColor = .systemGray4
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        
        scrollView.addSubview(stackView)
        
        for i in 0...3{
            let image = UIImageView()
            image.image =    images[i]
            image.contentMode = .scaleToFill
            image.clipsToBounds = true
            stackView.addArrangedSubview(image)

        }
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topAnchor),
            middleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: middleView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: middleView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
           // stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(lessThanOrEqualTo: scrollView.frameLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.frameLayoutGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: CGFloat(4))
        ])
        
        middleView.addSubview(pageControl)

        pageControl.currentPageIndicatorTintColor = .green
        pageControl.tintColor = .red
        pageControl.numberOfPages = 4
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: middleView.bottomAnchor,constant: -5),
            pageControl.widthAnchor.constraint(equalToConstant: 200),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        pageControl.addTarget(self, action:#selector(changePage) , for: .valueChanged)
        
    }
    
    
    
    @objc func changePage(){
        let offset = CGFloat(pageControl.currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
   

}

extension SurgeryView: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let page = (round(scrollView.contentOffset.x/scrollView.frame.width))
        
        if !page.isNaN {
            pageControl.currentPage = Int(page)
        }
       
    }
    
}

