//
//  EditSlot.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 23/03/23.
//

import UIKit

class EditCurrentSlot: UIViewController {

    let doctor : Doctor
    let date : Date
    var slots : [Slot]
    
    var selectedSlots = [Int]()
    
    let editSlotLabel :  UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Edit Slots"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let procedureLabel :  UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Please select slots you don't want"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let doneButton : UIButton = {
        let button = UIButton()
        button.configuration = .plain()
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
    }()
    
    
    let slotCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init (doctor : Doctor,slots : [Slot],date : Date){
        self.doctor = doctor
        self.slots = slots
        self.date  = date
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Current Slots"
        view.backgroundColor = UIColor(named: "white")
        
        setConstrainsts()
        doneButtonconfigure()
    }
    
    
    var widthspace : CGFloat { view.frame.width * 0.02 }
    var heightspace : CGFloat { view.frame.height * 0.02 }
    
   func setConstrainsts(){
        view.addSubview(editSlotLabel)
       view.addSubview(doneButton)
        view.addSubview(procedureLabel)
        
       let editSlotLabelHeight = view.frame.height * 0.04
       
        NSLayoutConstraint.activate([
            editSlotLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            editSlotLabel.heightAnchor.constraint(equalToConstant: editSlotLabelHeight),
            editSlotLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace),
            editSlotLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace)
        ])
       
       
       NSLayoutConstraint.activate([
          doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          doneButton.heightAnchor.constraint(equalToConstant:editSlotLabelHeight),
          doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace)
       ])
       
       
       NSLayoutConstraint.activate([
        procedureLabel.topAnchor.constraint(equalTo: editSlotLabel.bottomAnchor,constant: heightspace),
           procedureLabel.heightAnchor.constraint(equalToConstant: editSlotLabelHeight),
           procedureLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace),
           procedureLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace)
       ])
       
       setSlotTimingsCollectionView()
       
    }
    
    func setSlotTimingsCollectionView(){
        view.addSubview(slotCollectionView)
        slotCollectionView.translatesAutoresizingMaskIntoConstraints =  false
        
        
        slotCollectionView.register(SlotTimingsCell.self, forCellWithReuseIdentifier: SlotTimingsCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        slotCollectionView.collectionViewLayout = flowLayout

        slotCollectionView.dataSource = self
        slotCollectionView.delegate = self

        NSLayoutConstraint.activate([
            slotCollectionView.topAnchor.constraint(equalTo: procedureLabel.bottomAnchor,constant: heightspace),
            slotCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            slotCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            slotCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    func doneButtonconfigure(){
        doneButton.addTarget(self, action: #selector(doneClicked), for: .touchUpInside)
    }
    
    @objc func doneClicked(){
        let alertController = UIAlertController(title: "Hello Dr.\(doctor.name)", message: "Save Changes?", preferredStyle: .actionSheet)
        
       
        
        let cancelAction = UIAlertAction(title: "NO", style: .destructive)
        let okAction = UIAlertAction(title: "YES", style: .default){_ in
            let changedSlots : [Slot] = self.slots.filter { !self.selectedSlots.contains($0.number-1) }
              self.doctor.changeSlot(date: self.date, slots:changedSlots )
              self.dismiss(animated: true)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }

}

    

extension EditCurrentSlot : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotTimingsCell.identifier, for: indexPath) as! SlotTimingsCell
        
        switch slots[indexPath.row]{
            
        case .slot(let slotNo,let Time,_) :
            cell.slotNoLabel.text = "Slot No \(slotNo)"
            
            switch Time {
                
            case .time(let startTime,let endTime) :
                cell.startTimeLabel.text = "Start Time : \(startTime)"
                cell.endTimeLabel.text = "End Time : \(endTime)"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (slotCollectionView.frame.height  - (6 * 24)) / 5
        let width = (slotCollectionView.frame.width - (3 * 10)-20)  / 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
}

extension EditCurrentSlot : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)!
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.systemRed.cgColor
        cell.contentView.backgroundColor = .systemRed.withAlphaComponent(0.3)
        
        
        if selectedSlots.contains(where: { $0 == indexPath.row}){
           let index = selectedSlots.firstIndex(of: indexPath.row)
            selectedSlots.remove(at: index!
            )
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
            cell.contentView.backgroundColor = .white
        }
        else {
            selectedSlots.append(indexPath.row)
            
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor.systemRed.cgColor
            cell.contentView.backgroundColor = .systemRed.withAlphaComponent(0.3)
        }
    }
}
