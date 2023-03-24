//
//  ChangeAvailability.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 21/03/23.
//

import UIKit

class ChangeAvailability: UIViewController {

    let doctor : Doctor
    
    var availabilityData : [(date:Date,availability:Bool,slots:[Slot])] {
        doctor.getAvailableDates()
    }
    
    let datesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init (doctor : Doctor){
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       setDatesCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        datesCollectionView.reloadData()
    }
    
    
    

    
    func setDatesCollectionView(){
        view.addSubview(datesCollectionView)
        
        datesCollectionView.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.identifier)
        datesCollectionView.dataSource = self
        datesCollectionView.delegate = self
        
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
       // flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        flowLayout.minimumInteritemSpacing = 20
//        flowLayout.minimumLineSpacing = 20
        
        datesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            datesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            datesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            datesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
   

}

extension ChangeAvailability : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        availabilityData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as! CalendarCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
         let date = availabilityData[indexPath.row].date
            dateFormatter.dateFormat = "MMMM yyyy"
            let month = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "d"
            let dateNo = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "EEEE"
            let day = dateFormatter.string(from: date)
            
            
            cell.date.text = dateNo
            cell.day.text = day
            cell.month.text = month
        
        if !availabilityData[indexPath.row].availability {
            cell.backgroundColor = .systemRed.withAlphaComponent(0.1)
            cell.availability.text = "Closed"
            cell.availability.textColor = .systemRed
        }
        else{
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.1)
            cell.availability.text = "\(availabilityData[indexPath.row].slots.count) Slots"
            cell.availability.textColor = .systemPurple
        }
       
        return cell
    }
    
}


extension ChangeAvailability : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (datesCollectionView.frame.height - 50) / 4
        let width = (datesCollectionView.frame.width - 30) / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension ChangeAvailability : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let availability = availabilityData[indexPath.row].availability
        let date = availabilityData[indexPath.row].date
        let viewController = ChangeAvailabilityAndSlots(doctor: doctor, availability: availability, date: date)
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
        //present(viewController, animated: true)
    }
}
