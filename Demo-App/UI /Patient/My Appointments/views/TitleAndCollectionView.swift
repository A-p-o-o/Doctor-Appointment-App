//
//  TitleAndCollectionView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 31/03/23.
//

import UIKit

class TitleAndCollectionView: UIView {

    
      let titleLabel: UILabel = {
          let label = UILabel()
          label.text = "Title"
          label.lineBreakMode = .byWordWrapping
          label.textColor = .black
          label.adjustsFontSizeToFitWidth = true
          label.numberOfLines = 0
          label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
          
          let fontMetrics = UIFontMetrics(forTextStyle: .title2)
          label.font = fontMetrics.scaledFont(for: label.font)
          label.adjustsFontForContentSizeCategory = true
          
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
       
       let collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.minimumLineSpacing = 10
           
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.backgroundColor = UIColor(named: "white")
           collectionView.showsHorizontalScrollIndicator = false
           return collectionView
       }()
       
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupViews()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupViews()
       }
       
    
     func setupViews() {
           addSubview(titleLabel)
           addSubview(collectionView)
           
           NSLayoutConstraint.activate([
               titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
               titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
               titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
               titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 70),
               
               collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
               collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
               collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
               collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
           ])
       }
       
      
       func configure(withTitle title: String, collectionViewDataSource: UICollectionViewDataSource, collectionViewDelegate: UICollectionViewDelegate) {
           titleLabel.text = title
           collectionView.dataSource = collectionViewDataSource
           collectionView.delegate = collectionViewDelegate
           collectionView.reloadData()
       }

}
