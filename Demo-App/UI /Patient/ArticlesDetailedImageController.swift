//
//  ZoomableImageViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 30/03/23.
//

import UIKit

class ArticlesDetailedImageController : UIViewController, UIScrollViewDelegate {
        
        private let scrollView = UIScrollView()
        private let imageView = UIImageView()
        
        init(imageName: String) {
            super.init(nibName: nil, bundle: nil)
            imageView.image = UIImage(named: imageName)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationController?.navigationBar.isHidden = false 
            
            view.backgroundColor = .white
            
            
            scrollView.delegate = self
            scrollView.maximumZoomScale = 4.0
            scrollView.minimumZoomScale = 1.0
            view.addSubview(scrollView)
            
            
            imageView.backgroundColor = .gray
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            ])
        }
        
        
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            let imageViewSize = imageView.frame.size
            let scrollViewSize = scrollView.bounds.size
            let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
            let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
            scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        }
    }
