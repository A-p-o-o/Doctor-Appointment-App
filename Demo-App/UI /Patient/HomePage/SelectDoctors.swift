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
        var doc : [Doctor] = []
        doc.append(contentsOf: Array(Storage.storage.doctorList.values))
        doc.append(contentsOf: Array(Storage.storage.doctorList.values))
        return doc
    }
    
    let Title : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Popular Doctors"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    func setHeader(){
        addSubview(Title)
        addSubview(viewAllButton)
        Title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: topAnchor),
            Title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            Title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            Title.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(equalTo: topAnchor),
            viewAllButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            viewAllButton.leadingAnchor.constraint(equalTo: Title.trailingAnchor),
            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
    }
    
    func setCollectionView(){
        addSubview(collectionView)
        collectionView.register(DoctorCell.self, forCellWithReuseIdentifier: DoctorCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        collectionView.tag = 2
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: Title.bottomAnchor,constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
    }
   
    
    @objc func bookselected(_ sender : UIButton){
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        let viewController = ViewDoctor(doctor: doctorData[indexPath.row],patient: patient)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func favouriteViewTap(_ sender: UITapGestureRecognizer) {
        let tappedView = sender.view!
            
            guard let cell = tappedView.superview?.superview as? DoctorCell else {
                return
            }
            
        cell.favouriteImage.isHidden = !cell.favouriteImage.isHidden
            cell.favouriteImageSelected.isHidden = !cell.favouriteImageSelected.isHidden
    }
    
}

extension SelectDoctors : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCell.identifier, for: indexPath) as! DoctorCell
        
        let doctor = doctorData[indexPath.row]
        cell.name.text = "Dr.\(doctor.name)"
        cell.department.text = "\(doctor.department)"
        cell.bookButton.addTarget(self, action: #selector(bookselected), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favouriteViewTap))
        cell.favouriteView.addGestureRecognizer(tapGesture)

        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width / 2.2 - 20
        let cellHeight = collectionView.bounds.height / 2 - 10
        
            return CGSize(width: cellWidth, height:cellHeight)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected")
    }
    
}
