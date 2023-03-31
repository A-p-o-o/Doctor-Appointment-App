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
    
    let departmentData : [Department] = Department.allCases
    
    let title  :  UILabel = {
        let label = UILabel()
        label.text = "Specialist Category "
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewAll  :  UILabel = {
        let label = UILabel()
        label.text = "View All"
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "book")
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let height : CGFloat
    let width : CGFloat
    
    
    init(patient : Patient,height : CGFloat,width : CGFloat) {
        self.patient = patient
        self.height = height
        self.width = width
        super.init(frame: .zero)
        setHeader()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeader(){
        addSubview(title)
        addSubview(viewAll)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.09),
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            title.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            viewAll.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            viewAll.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.07),
            viewAll.leadingAnchor.constraint(equalTo: title.trailingAnchor),
            viewAll.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
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


extension SpecialistView : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialistCell.identifier, for: indexPath) as! SpecialistCell
        
        cell.departmentName.text = "\(departmentData[indexPath.row].departmentName)"
        cell.departmentImage.image = UIImage(named: "\(departmentData[indexPath.row].departmentName)")
        
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (width / 2.2) - 20
        let cellHeight = height * 0.8
        
            return CGSize(width: cellWidth, height:cellHeight)
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = ViewDepartment(patient: self.patient)
        viewController.department = departmentData[indexPath.row].departmentName
        self.viewController?.navigationController?.pushViewController(viewController, animated: false)
    }
    
   
    
    
   

    
    
}
