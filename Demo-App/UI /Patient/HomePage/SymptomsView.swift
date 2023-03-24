//
//  SymptomsView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SymptomsView: UIView {

    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let title : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Not feeling well ?"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.layer.cornerRadius = 10
        let fontMetrics = UIFontMetrics.default
        label.font = fontMetrics.scaledFont(for: label.font)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewAllButton : UIButton = {
         let button = UIButton()
         button.configuration = .plain()
         button.setTitle("View All", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHeader()
        setCollectionView()
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCollectionView()
    }
    
    
    func setHeader(){
        addSubview(title)
        addSubview(viewAllButton)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            title.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(equalTo: topAnchor),
            viewAllButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07),
            viewAllButton.leadingAnchor.constraint(equalTo: title.trailingAnchor),
            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
    }
    
    
    func setCollectionView(){
        addSubview(collectionView)
        
        collectionView.register(DiseaseAndNameCCell.self, forCellWithReuseIdentifier: DiseaseAndNameCCell.identifier)
        
        
       
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
    }
    
}


extension SymptomsView : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiseaseAndNameCCell.identifier, for: indexPath) as! DiseaseAndNameCCell
        cell.layer.cornerRadius = 10
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width / 3) - 20
        let cellHeight = collectionView.bounds.height
        
            return CGSize(width: cellWidth, height:cellHeight)
    }
    
   
  
}



