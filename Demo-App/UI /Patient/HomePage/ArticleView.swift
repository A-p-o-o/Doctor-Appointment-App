//
//  ArticleView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class ArticleView: UIView {

    var data = [UIImageView]()
    
    let stackView = UIStackView()
    let scrollView = UIScrollView()
     
    let pageControl = UIPageControl()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollView()
        giveData()
        setStack()
        
        addData()
        setPageControl()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setScrollView()
        giveData()
        setStack()
        
        addData()
        setPageControl()
    }
    
    func setScrollView(){
        addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    func setStack(){
        scrollView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.backgroundColor = .red
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(lessThanOrEqualTo: scrollView.frameLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.frameLayoutGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: CGFloat(data.count))
        ])
        
    }
    
    func setPageControl(){
        addSubview(pageControl)

        pageControl.currentPageIndicatorTintColor = .green
        pageControl.tintColor = .red
        pageControl.numberOfPages = data.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            pageControl.widthAnchor.constraint(equalToConstant: 200),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        pageControl.addTarget(self, action:#selector(changePage) , for: .valueChanged)
    }
    
    func giveData(){
        for i in 1...6{
            let imageView = UIImageView()
            imageView.image = UIImage(named: "article\(i)")
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
            data.append(imageView)
        }
    }
    
    func addData(){
        
        data.forEach{
            image in
           // image.contentMode = .scaleAspectFit
            image.clipsToBounds = true
            stackView.addArrangedSubview(image)
        }
    }
    
    @objc func changePage(){
        let offset = CGFloat(pageControl.currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
}

extension ArticleView : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let page = (round(scrollView.contentOffset.x/scrollView.frame.width))
        
        if !page.isNaN {
            pageControl.currentPage = Int(page)
        }
       
    }
    
    
    
}



