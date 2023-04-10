//
//  CreateVerticalView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/04/23.
//

import UIKit

class CreateVerticalView: UIView {

    func createView(leftSide : [String],rightSide : [String])->UIView{
        
        let verticalStack : UIStackView = {
            
            let verticalStack = UIStackView()
            verticalStack.axis = .vertical
            verticalStack.spacing = 5
            verticalStack.distribution = .fill
            
            verticalStack.translatesAutoresizingMaskIntoConstraints = false
            
            return verticalStack
        }()
        
        for index in 0..<leftSide.count{
            
            if index == 0 {
                let label =  createLabel(text: leftSide[index])
                label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
               let horizontalStack = createHorizontalStack(labels: [label])
               verticalStack.addArrangedSubview(horizontalStack)
            }
            else {
                let leftLabel = createLabel(text: leftSide[index])
                let rightLabel = createLabel(text: rightSide[index])
                let horizontalStack = createHorizontalStack(labels: [leftLabel,rightLabel])
                verticalStack.addArrangedSubview(horizontalStack)
            }
        }
        
        addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        backgroundColor = UIColor(named: "white")
        
        return self
    }
    
    
    func createHorizontalStack(labels : [UIView])->UIStackView{
        let horizontalStack  = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 10
            horizontalStack.distribution = .fill
            horizontalStack.alignment = .top
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        for label in labels {
            horizontalStack.addArrangedSubview(label)
        }
        horizontalStack.sizeToFit()
        
        return horizontalStack
    }
    
    func createSpacing()->UIView{
          let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 10).isActive = true
            return view
    }
    
    func createLabel(text : String)->UILabel{
            let label = UILabel()
            label.text = text
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
        
        let size = label.sizeThatFits(CGSize(width: 100, height: CGFLOAT_MAX))
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: (size.height + 10))
        ])
            return label
    }
    
}
