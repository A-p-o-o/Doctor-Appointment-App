////
////  PatientSearchController.swift
////  Demo-App
////
////  Created by deepak-pt6306 on 13/03/23.
////
//
//import UIKit
//
//class PatientSearchController: UIViewController , UISearchResultsUpdating{
//
//
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else {return}
////        guard let patient else {return}
//
//        data = []
//        data.append(contentsOf: patient.searchDoctor(text: text))
//        data.append(contentsOf: search.searchDepartment(text: text))
//
//        collectionView.reloadData()
//    }
//    
//
//
//    let patient : Patient
//    let search = Search()
//    let startTime = ["09:00-AM","09:30-AM","10:00-AM","10:30-AM","11:00-AM","11:30-AM","02:00-PM","02:30-PM","03:00-PM","03:30-PM"]
//
//    let dateFormatter: DateFormatter = {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "hh:mm-a"
//            return formatter
//        }()
//
////    let searchField : UISearchBar = {
////        let search = UISearchBar()
////        search.placeholder = "Search Doctor / Department"
////        search.searchBarStyle = .minimal
////        search.translatesAutoresizingMaskIntoConstraints = false
////        return search
////    }()
//
//    var Controller : UIViewController? = nil
//
//
//    var data :[Any] = []
//
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//
//
//    init(patient: Patient) {
//        self.patient = patient
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor(named: "background")
//       // setSearchBar()
//        setTableView()
//        //setDatePicker()
//        searchResult()
//        orientationChanged()
//    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        orientationChanged()
//    }
//
//    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
//    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
//
//    func orientationChanged(){
//
//        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
//
//
//        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { [self] _ in
//
//            let orientation = UIDevice.current.orientation
//            switch orientation {
//            case .portrait:
//                collectionView.reloadData()
//            case .landscapeLeft, .landscapeRight:
//                collectionView.reloadData()
//            default:
//                break
//            }
//        }
//
//    }
//
////    override func viewDidDisappear(_ animated: Bool) {
////        searchField.text = ""
////        data = []
////        //collectionView.reloadData()
////    }
//
//    func searchResult(){
//      //  data.append(contentsOf: search.searchDepartment(text: searchField.text ?? ""))
//        collectionView.reloadData()
//    }
//
//
////    func setSearchBar(){
////
////        view.addSubview(searchField)
////        searchField.delegate = self
////
////        NSLayoutConstraint.activate([
////            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
////            searchField.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
////            searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
////            searchField.heightAnchor.constraint(equalToConstant:  Viewheight * 0.07)
////        ])
////
////    }
//
//    func setTableView(){
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: SearchResultsCell.identifier)
//        collectionView.register(ResultDoctorCell.self, forCellWithReuseIdentifier: ResultDoctorCell.identifier)
//
//        collectionView.backgroundColor = .clear
//    }
//
//
//
//
//}
//
//
////extension PatientSearchController : UISearchBarDelegate {
////
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////
////        guard let text = searchBar.text else {return}
//////        guard let patient else {return}
////        data = []
////        data.append(contentsOf: patient.searchDoctor(text: text))
////        data.append(contentsOf: search.searchDepartment(text: text))
////
////        collectionView.reloadData()
////    }
////
////}
//
//
//extension PatientSearchController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = Viewheight * 0.1
//        let width = collectionView.frame.width - 20
//       return CGSize(width: width, height: height)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//
//        let indexValue = data[indexPath.row]
//        if  indexValue is Department {
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCell.identifier, for: indexPath) as! SearchResultsCell
//
//            let department = data[indexPath.row] as! Department
//            cell.leftLabel.text = department.departmentName
//            cell.rightImage.image = UIImage(named: "\(department.departmentName)")
//            cell.backgroundColor = .white.withAlphaComponent(0.6)
//
//
//            return cell
//        }
//        else {
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell
//
//            let doctor = indexValue as! Doctor
//            cell.name.text = doctor.name
//            cell.department.text = doctor.department.departmentName
//            cell.experience.text = "\(doctor.experience) years of experience"
//            cell.profile.layer.cornerRadius = (cell.contentView.frame.height - 10) / 2
//            cell.profile.image  = UIImage(named: doctor.image)
//            cell.backgroundColor = .white.withAlphaComponent(0.6)
//            return cell
//        }
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = data[indexPath.row]
//
//
//                if item is Doctor {
//                    let doc = item as! Doctor
//                    let viewController = DoctorProfileController(doctor: doc,patient: self.patient)
//                    navigationController?.pushViewController(viewController, animated: true)
//                }
//                if item is Department {
//                    let department = item as! Department
//                    let viewController = ViewDepartment(patient: self.patient)
//                    viewController.department = department.departmentName
//                        navigationController?.pushViewController(viewController, animated: false)
//                }
//
//
//    }
//
//
//
//
//
//
//}
//
//
