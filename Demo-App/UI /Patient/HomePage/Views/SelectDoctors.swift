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
    let doctorData :[Doctor] = {
        var doc : [Doctor] = []
        var doctors =  Array(Storage.storage.doctorList.values)
        
        for _ in 1...10{
            doc.append(doctors.randomElement()!)
        }
       
        return doc
    }()
    
    var favouriteDoctors : [Doctor] { (patient?.getFavouriteDoctors())! }
    
    let Title  :  UILabel = {
        let label = UILabel()
        label.text = "Popular Doctors"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let viewAll  :  UILabel = {
        let label = UILabel()
        label.text = "View All"
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "book")
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let height : CGFloat
    let width : CGFloat
    init(height : CGFloat,width : CGFloat) {
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
        addSubview(Title)
        addSubview(viewAll)
        Title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: topAnchor),
            Title.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.04),
            Title.leadingAnchor.constraint(equalTo: leadingAnchor),
            Title.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.7)
        ])
       
    
        
        NSLayoutConstraint.activate([
            viewAll.centerYAnchor.constraint(equalTo: Title.centerYAnchor),
            viewAll.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.04),
            viewAll.leadingAnchor.constraint(equalTo: Title.trailingAnchor),
            viewAll.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        collectionView.tag = 2
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: Title.bottomAnchor,constant: 10),
          //  collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            collectionView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.85),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10)
        ])
        
        collectionView.sizeToFit()
    }
   
    
    @objc func bookselected(_ sender : UIButton){
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        print(indexPath.row)
        let viewController = DoctorProfileController(doctor: doctorData[indexPath.row],userId: patient!.UserId)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func favouriteViewTap(_ sender: UITapGestureRecognizer) {
        let tappedView = sender.view!
            
            guard let cell = tappedView.superview?.superview as? DoctorCell else {
                return
            }
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        if !cell.isFavourite {
           //buttonTapped()
            patient?.addTofavourites(doctor: doctorData[indexPath.row])
        }
        else {
            patient?.removeFromfavourites(doctor: doctorData[indexPath.row])
        }
        cell.isFavourite = !cell.isFavourite
        cell.favouriteImage.isHidden = !cell.favouriteImage.isHidden
        cell.favouriteImageSelected.isHidden = !cell.favouriteImageSelected.isHidden
    }
    
    func buttonTapped() {
        
        
        let alert = UIAlertController(title: "Favourite Added", message: "This Doctor has been added to your favourites.", preferredStyle: .actionSheet)
        viewController!.present(alert, animated: true, completion: nil)
        
        let time = DispatchTime.now() + 0.7
        DispatchQueue.main.asyncAfter(deadline: time) {
            alert.dismiss(animated: true, completion: nil)
               }
        }
    
}

extension SelectDoctors : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCell.identifier, for: indexPath) as! DoctorCell
        
        let doctor = doctorData[indexPath.row]
        cell.imageview.image = UIImage(named: doctor.image)
        cell.name.text = "Dr.\(doctor.name)"
        cell.department.text = doctor.department.departmentName
        
        if favouriteDoctors.contains(doctor){
            cell.favouriteImageSelected.isHidden = false
            cell.favouriteImage.isHidden = true
            cell.isFavourite = true
        }
        else {
            cell.favouriteImageSelected.isHidden = true
            cell.favouriteImage.isHidden = false
            cell.isFavourite = false
        }
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favouriteViewTap))
        cell.favouriteView.addGestureRecognizer(tapGesture)

        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = width / 2.2 - 20
        let cellHeight = height * 0.8
        
        
            return CGSize(width: cellWidth, height:cellHeight)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewController = DoctorProfileController(doctor: doctorData[indexPath.row],userId: patient!.UserId)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
