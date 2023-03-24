//
//  SpecialistView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SpecialistView: UIView {
    
    weak var viewController : UIViewController?
    let patient : Patient
    
    let title : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Specialist Category"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.layer.cornerRadius = 10
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
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    
    init(patient : Patient) {
        self.patient = patient
        super.init(frame: .zero)
        setHeader()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeader(){
        addSubview(title)
        addSubview(viewAllButton)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.09),
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
        
        collectionView.register(SpecialistCell.self, forCellWithReuseIdentifier: SpecialistCell.identifier)
        
     
        collectionView.dataSource = self
        collectionView.delegate = self
    
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
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
        
        
        collectionView.tag = 1
        
    }
    
}


extension SpecialistView : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialistCell.identifier, for: indexPath)
        
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width / 2.2) - 20
        let cellHeight = collectionView.frame.height - 20
        
            return CGSize(width: cellWidth, height:cellHeight)
    }
    

    
    @objc func viewAllSpecialist(){
        print("button")
        let vc = PatientSearchController(patient: patient)
        vc.searchField.placeholder = "Enter department Name"
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
   

    
    
}
