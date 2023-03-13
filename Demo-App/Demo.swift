//
//  Demo.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class Demo: UIViewController {
   

        let scrollView = UIScrollView()
        let stackView = UIStackView()
        let itemSize: CGFloat = 50 // Change this to your desired item size
        var numberOfRows: Int = 2 // Change this to your desired number of rows
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            setScrollView()
            setStackView()
            addItemsToStackView()
        }
        
        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            print("s")
            super.viewWillTransition(to: size, with: coordinator)
            
            // Update number of rows and stack view height based on orientation
            if UIDevice.current.orientation.isLandscape {
                numberOfRows = 1
                updateStackViewHeight()
            } else {
                numberOfRows = 2
                updateStackViewHeight()
            }
        }
        
        func setScrollView() {
            view.addSubview(scrollView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
        }
        
        func setStackView() {
            scrollView.addSubview(stackView)
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 20 // Change this to your desired spacing
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                stackView.heightAnchor.constraint(equalToConstant: itemSize * CGFloat(numberOfRows) + CGFloat(numberOfRows - 1) * stackView.spacing),
            ])
        }
        
        func addItemsToStackView() {
            for _ in 0..<8 {
                let itemView = UIView()
                itemView.backgroundColor = .blue
                itemView.layer.cornerRadius = itemSize / 2
                itemView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    itemView.heightAnchor.constraint(equalToConstant: itemSize),
                    itemView.widthAnchor.constraint(equalToConstant: itemSize),
                ])
                
                stackView.addArrangedSubview(itemView)
            }
        }
        
        func updateStackViewHeight() {
            let newHeight = itemSize * CGFloat(numberOfRows) + CGFloat(numberOfRows - 1) * stackView.spacing
            stackView.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
        }

    }



