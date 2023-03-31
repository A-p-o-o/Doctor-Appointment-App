//
//  SymptomsView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SymptomsView: UIView {
    
    let SymptomsData :  [String] = Symptomps().allDepartmentAndSymptoms[.General_Physician]!
    
    weak var viewController : UIViewController? = nil
    
    var patient : Patient
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    
    let title  :  UILabel = {
        let label = UILabel()
        label.text = "Not Feeling Well ?"
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
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "book")
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let height : CGFloat
    let width : CGFloat
    
    init(patient : Patient,height : CGFloat,width : CGFloat ) {
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
            title.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.15),
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            title.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.7)
        ])
        

        
        NSLayoutConstraint.activate([
            viewAll.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            viewAll.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.15),
            viewAll.leadingAnchor.constraint(equalTo: title.trailingAnchor),
            viewAll.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            
        ])
        self.sizeToFit()
        
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
        self.sizeToFit()
    }
    
}


extension SymptomsView : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SymptomsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiseaseAndNameCCell.identifier, for: indexPath) as! DiseaseAndNameCCell
        cell.layer.cornerRadius = 10
        cell.label.text = self.SymptomsData[indexPath.row]
        cell.imageView.image = UIImage(named: "\(SymptomsData[indexPath.row])")
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (width / 3) - 20
        let cellHeight = height * 0.7
        
            return CGSize(width: cellWidth, height:cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = ViewDepartment(patient: patient,department: Department.General_Physician.departmentName)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
  
}



