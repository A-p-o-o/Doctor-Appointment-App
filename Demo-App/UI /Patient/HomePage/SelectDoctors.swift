//
//  SelectDoctors.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SelectDoctors: UIView {
    

    var patient : Patient? = nil
    var viewController : UIViewController? = nil
    var doctorData :[Doctor] {
        Array(Storage.storage.doctorList.values)
        
    }
    
    let stack = UIStackView()
    let header : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Title"
        label.font = UIFont(name: "Avenir next", size: 25)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let footer : UIButton = {
        let button = UIButton()
         button.configuration = .borderedTinted()
         button.setTitle("View All Doctors", for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStack()
        setHeader()
        setCollectionView()
        setFooter()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setStack(){
        addSubview(stack)
        stack.axis = .vertical
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
    }
    
    func setHeader(){
        stack.addArrangedSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
        ])
    }
    
    func setCollectionView(){
        stack.addArrangedSubview(collectionView)
        collectionView.register(DoctorCell.self, forCellWithReuseIdentifier: DoctorCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        collectionView.tag = 2
        
    }
    
    func setFooter(){
        stack.addArrangedSubview(footer)
        footer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
        ])
    }
    
}

extension SelectDoctors : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCell.identifier, for: indexPath) as! DoctorCell
        cell.name.text = "Dr. \(doctorData[indexPath.row].name)"
        cell.department.text = "\(doctorData[indexPath.row].department)"
        cell.experience.text = "\(doctorData[indexPath.row].experience) years of experience"
        cell.imageview.layer.cornerRadius = cell.frame.height / 2
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width * (3/4)
        let cellHeight = collectionView.bounds.height / 2 - 20
        
            return CGSize(width: cellWidth, height:cellHeight)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("SD selected")
        let viewController = ViewDoctor(doctor: doctorData[indexPath.row],patient: patient)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
