//
//  ViewDoctor.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class ViewDoctor: UIViewController {
    
    var doctor : Doctor? = nil
    var patient : Patient? = nil
    
    var slots : [String] = []
    
    var availableDatesOfDoctor : [String] {
        search.doctorAvailableDates(doctorId: doctor!.employeeId)
    }
    
    var dateAndSlots : [String : [String] ] {
        search.dateAndslots(dates: availableDatesOfDoctor, doctorId: doctor!.employeeId)
    }
    
    
    let search = Search()
    let dao = DoctorDAO()
    //Doctor Profile

    let topView = UIView()
    let photo : UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleAspectFill

         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Dr. Naveen Kumar Dugar "
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Avenir Next", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .red
        return label
    }()
    
    let department : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Department"
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .blue
        return label
    }()
    
    let experience :  UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Avenir next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.text = "2 years of experience"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    let likes :
    
    //Available slots
    let middleView = UIView()
    let availableDates = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
    
    //slots on particular date
    let bottomView  = UIView()
    let selectedDate : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "dd-mm-yyyy"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let availableSlots = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setViews()
    }
    
    func setViews(){
        
        view.addSubview(topView)
        view.addSubview(middleView)
        view.addSubview(bottomView)
        
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        middleView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.backgroundColor = .white
        middleView.backgroundColor = .white
        bottomView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height * 0.15)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 10),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.13)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor,constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setTopView()
        setMiddleView()
        setbottomView()
    }
    
    
    func setTopView(){
        
        topView.addSubview(photo)
        topView.addSubview(name)
        topView.addSubview(department)
        topView.addSubview(experience)
        
        name.text = "Dr \(doctor!.name)"
        department.text = "\(doctor!.department)".uppercased()
        experience.text = "\(doctor!.experience) years of experience"
        
        
        
        NSLayoutConstraint.activate([
            photo.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            photo.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8),
            photo.widthAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8),
            photo.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10)
        ])
        
        
        photo.layer.cornerRadius = (view.bounds.height) * 0.15 * 0.8 / 2
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            name.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            name.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.35)
        ])
        
        
        
        NSLayoutConstraint.activate([
            department.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            department.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            department.topAnchor.constraint(equalTo: name.bottomAnchor,constant: -10),
            department.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.35)
        ])
        
        NSLayoutConstraint.activate([
            experience.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            experience.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            experience.topAnchor.constraint(equalTo: department.bottomAnchor,constant: -10),
            experience.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.2)
        ])
        
        

        
    }
    
    func setMiddleView(){
        middleView.addSubview(availableDates)
        
        availableDates.register(AvailableDates.self, forCellWithReuseIdentifier: AvailableDates.identifier)
        
        availableDates.backgroundColor = .clear
        availableDates.tag = 1
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        availableDates.translatesAutoresizingMaskIntoConstraints = false
        
        availableDates.dataSource = self
        availableDates.delegate = self
        availableDates.showsVerticalScrollIndicator = false
        availableDates.showsHorizontalScrollIndicator = true
        
        availableDates.collectionViewLayout = flowLayout
        
        
        availableDates.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            availableDates.topAnchor.constraint(equalTo: middleView.topAnchor),
            availableDates.bottomAnchor.constraint(equalTo: middleView.bottomAnchor),
            availableDates.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            availableDates.trailingAnchor.constraint(equalTo: middleView.trailingAnchor)
            
        ])
    }
    
    func setbottomView(){
        bottomView.addSubview(selectedDate)
        bottomView.addSubview(availableSlots)
        
        availableSlots.tag = 2
        
        NSLayoutConstraint.activate([
            selectedDate.topAnchor.constraint(equalTo: bottomView.topAnchor),
            selectedDate.heightAnchor.constraint(equalTo: bottomView.heightAnchor,multiplier: 0.07),
            selectedDate.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            selectedDate.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])
        
        availableSlots.backgroundColor = .green
        
        availableSlots.register(Slots.self, forCellWithReuseIdentifier: Slots.identifier)

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20

        availableSlots.translatesAutoresizingMaskIntoConstraints = false

        availableSlots.dataSource = self
        availableSlots.delegate = self
        availableSlots.showsVerticalScrollIndicator = false
        availableSlots.showsHorizontalScrollIndicator = true

        availableSlots.collectionViewLayout = flowLayout


        availableSlots.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            availableSlots.topAnchor.constraint(equalTo: selectedDate.bottomAnchor,constant: 10),
            availableSlots.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            availableSlots.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            availableSlots.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])

    }
    
    
   
   
}

extension ViewDoctor : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            return availableDatesOfDoctor.count
        }
        else {
            
            return slots.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableDates.identifier, for: indexPath) as! AvailableDates
            
            let date = availableDatesOfDoctor[indexPath.row]
            cell.titleLabel.text = date
            
            let slots : Int = dateAndSlots[date]?.count ?? 0
            cell.infoLabel.text = slots == 0 ? "No slots Available" : "\(slots) slots Available"
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Slots.identifier, for: indexPath) as! Slots
            
            cell.titleLabel.text  =  slots[indexPath.row]
            
            return cell
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
            let height = collectionView.frame.height * 0.8
            let width = collectionView.frame.width * 0.35
            
            return CGSize(width: width, height: height)
        }
        else {
            let height = collectionView.frame.height  / 6
            let width = collectionView.frame.width / 3 - 30
            
            return CGSize(width: height, height: width)
        }
    }
    
}


extension ViewDoctor : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
       
        
        if collectionView.tag == 1 {
            
           let cell =  collectionView.cellForItem(at: indexPath)! as! AvailableDates
            cell.layer.borderColor = UIColor.green.cgColor
            cell.layer.borderWidth = 2
            selectedDate.text = cell.titleLabel.text!
            slots = dateAndSlots[cell.titleLabel.text!]!
            availableSlots.reloadData()
            
            print(slots)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1 {
            let cell = collectionView.cellForItem(at: indexPath)
                cell?.layer.borderWidth = 0.0
                cell?.layer.borderColor = nil
        }
    }
}
