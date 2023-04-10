//
//  SearchResultsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 31/03/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchResultsController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    let patient : Patient? =  Patient(userName: "deepak", password: "", UserId: "", role: .Admin, name: "Arnold", phoneNumber: "", sex: .Female, mail: "", address: "", patientId: "", weight: 2, height: 2, AllergyTo: "")
    
    var data : [Any] = []
    
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        orientationChanged()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        view.backgroundColor = UIColor(named: "background")
        collectionView.backgroundColor = .clear
         self.clearsSelectionOnViewWillAppear = true
        
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: SearchResultsCell.identifier)
        collectionView.register(ResultDoctorCell.self, forCellWithReuseIdentifier: ResultDoctorCell.identifier)

        orientationChanged()
        
       
        navigationController?.navigationBar.tintColor = UIColor(named: "book")
        
        
    }
    

    func orientationChanged(){
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { [self] _ in
            
            let orientation = UIDevice.current.orientation
            switch orientation {
            case .portrait:
                collectionView.reloadData()
            case .landscapeLeft, .landscapeRight:
                collectionView.reloadData()
            default:
                break
            }
        }
        
    }
    
    
    func updateData(data : [Any]){
        self.data = data
        collectionView.reloadData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let indexValue = data[indexPath.row]
        if  indexValue is Department {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCell.identifier, for: indexPath) as! SearchResultsCell

            let department = data[indexPath.row] as! Department
            cell.leftLabel.text = department.departmentName
            cell.rightImage.image = UIImage(named: "\(department.departmentName)")
            cell.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.6)
            
       
            return cell
        }
        else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell

            let doctor = indexValue as! Doctor
            cell.name.text = doctor.name
            cell.department.text = doctor.department.departmentName
            cell.experience.text = "\(doctor.experience) years of experience"
            cell.profile.layer.cornerRadius = (cell.contentView.frame.height - 10) / 2
            cell.profile.image  = UIImage(named: doctor.image)
            cell.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.6)
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = Viewheight * 0.1
        let width = collectionView.frame.width - 20
       return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        
        
                if item is Doctor {
                    let doc = item as! Doctor
                    let viewController = DoctorProfileController(doctor: doc,userId: patient!.UserId)
                    navigationController?.pushViewController(viewController, animated: true)
                }
                if item is Department {
                    let department = item as! Department
                    let viewController = ViewDepartment(userId: patient!.UserId)
                    viewController.department = department.departmentName
                    navigationController?.pushViewController(viewController, animated: true)
                }
        
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
