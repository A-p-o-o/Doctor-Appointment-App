//
//  SymptomsView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SymptomsView: UIView {

//    let topView = UIView()
//
//    let label1 : UILabel = {
//        let label = UILabel()
//        label.lineBreakMode = .byWordWrapping
//        label.numberOfLines = 1
//        label.text = "Not feeling too well ?"
//        label.font = UIFont(name: "futura", size: 25)
//        label.adjustsFontSizeToFitWidth = true
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let label2 : UILabel = {
//        let label = UILabel()
//        label.lineBreakMode = .byWordWrapping
//        label.numberOfLines = 1
//        label.text = "Treat Common symptoms with top specialists"
//        label.font = UIFont(name: "futura", size: 20)
//        label.adjustsFontSizeToFitWidth = true
//        label.textColor = .lightGray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let imageView : UIImageView = {
//        let imageview = UIImageView()
//        imageview.image = UIImage(systemName: "thermometer.high")
//        imageview.contentMode = .scaleAspectFit
//        imageview.clipsToBounds = true
//        imageview.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        imageview.translatesAutoresizingMaskIntoConstraints = false
//        return imageview
//    }()
//
//
//   // let middleView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    let middleView = UIStackView()
//
//    let bottomView : UIButton = {
//        let button = UIButton()
//        button.configuration = .bordered()
//        button.configuration?.baseForegroundColor = .black
//        button.layer.borderWidth = 2
//        button.layer.cornerRadius = 10
//        button.clipsToBounds = true
//        button.layer.borderColor = UIColor.black.cgColor
//        button.setTitle("View All Symptoms", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setViews()
//        setTopView()
//        setMiddleView()
//        setBottomView()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setViews()
//        setTopView()
//        setMiddleView()
//        setBottomView()
//    }
//
//
//    func setViews(){
//        addSubview(topView)
//        addSubview(middleView)
//        addSubview(bottomView)
//
//        topView.translatesAutoresizingMaskIntoConstraints = false
//       // topView.backgroundColor = .purple
//        NSLayoutConstraint.activate([
//            topView.topAnchor.constraint(equalTo: topAnchor),
//            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
//            topView.widthAnchor.constraint(equalTo: widthAnchor)
//        ])
//
//    }
//
//    func setTopView(){
//        topView.addSubview(imageView)
//        topView.addSubview(label1)
//        topView.addSubview(label2)
//
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: topView.topAnchor),
//            imageView.heightAnchor.constraint(equalTo: topView.heightAnchor),
//            imageView.widthAnchor.constraint(equalTo: topView.heightAnchor),
//            imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 6)
//        ])
//
//        NSLayoutConstraint.activate([
//            label1.topAnchor.constraint(equalTo: topView.topAnchor),
//            label1.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
//            label1.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.6),
//            label1.widthAnchor.constraint(equalTo: topView.widthAnchor,multiplier: 0.85)
//        ])
//
//        NSLayoutConstraint.activate([
//            label2.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
//            label2.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
//            label2.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.4),
//            label2.widthAnchor.constraint(equalTo: topView.widthAnchor,multiplier: 0.85)
//        ])
//
//    }
//
//    func setMiddleView(){
//
//
//        middleView.translatesAutoresizingMaskIntoConstraints = false
//        middleView.backgroundColor = .green
//
//
//        NSLayoutConstraint.activate([
//            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
//            middleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
//            middleView.widthAnchor.constraint(equalTo: widthAnchor)
//        ])
//    }
//
//    func setBottomView(){
//        bottomView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor),
//            bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
//            bottomView.widthAnchor.constraint(equalTo: widthAnchor)
//        ])
//    }
//
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCollectionView()
    }
    
    
    
    func setCollectionView(){
        addSubview(collectionView)
        
        collectionView.register(DiseaseAndNameCCell.self, forCellWithReuseIdentifier: DiseaseAndNameCCell.identifier)
        
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        
        collectionView.register(CollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionFooterView.identifier)
        
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
    
        collectionView.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
}


extension SymptomsView : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiseaseAndNameCCell.identifier, for: indexPath) as! DiseaseAndNameCCell
        cell.layer.cornerRadius = 10
        cell.imageView.layer.borderColor = UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1.0).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = cell.bounds.height * 0.75 / 2
        //cell.backgroundColor = .red
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width / 3) - 20
        let cellHeight = (collectionView.bounds.height - (2 * collectionView.bounds.height * (1 / 10))) / 2 - 20
        
            return CGSize(width: cellWidth, height:cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as! CollectionHeaderView
            header.title.text = "Not Feeling Too Well ?"
            return header
        }
        
        else {
            let Footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionFooterView.identifier, for: indexPath) as! CollectionFooterView
            Footer.button.setTitle("View All Symptoms", for: .normal)
            return Footer
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let HeaderHeight = collectionView.bounds.height * (1 / 10)
        return CGSize(width: collectionView.bounds.width, height: HeaderHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        let HeaderHeight = collectionView.bounds.height * (1 / 10)
        return CGSize(width: collectionView.bounds.width, height: HeaderHeight)
    }

}



