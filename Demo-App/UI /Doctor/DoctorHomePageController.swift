//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 02/04/23.
//

import UIKit

class DoctorHomePageController: UIViewController {
    
    let userName : String
    
    var doctor : Doctor {
        userDetails.getDoctor(userId: userName)!
    }
    
    var UpcomingAppointments : [Appointment]{
        doctor.appointments.upcoming[dateFormat(date: Date())] ?? []
    }
    
    private let userDetails : UserDetails = UserDetails()
    
    init(userName: String) {
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let TopView = UIView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: "white")
        imageView.layer.cornerRadius = 0.4 * min(imageView.bounds.width, imageView.bounds.height)
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "Good Morning"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Mr Name"
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
    
    let searchPatientview : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let searchPatientLabel : UILabel = {
        let label = UILabel()
        label.text = "Need to see a Patient Details?"
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
    
    let searchfield = UISearchBar()
    
    let appointmentsView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let appointmentsLabel : UILabel = {
        let label = UILabel()
        label.text = "Upcoming Appointments"
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
    
    let appointmentsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let viewAllAppointments : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .black
        button.setTitle("View All", for: .normal)
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "book")?.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let remainderView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let remainderLabel : UILabel = {
        let label = UILabel()
        label.text = "My To-Do List"
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
    
    let remainderCollectionView =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let ViewAllRemainder : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .black
        button.setTitle("View All", for: .normal)
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "book")?.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let changeAvailabilityView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let changeAvailabilityLabel : UILabel = {
        let label = UILabel()
        label.text = "Has Another Work ?"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setContainerViews()
        setTopView()
       // setSearchPatientView()
        setAppointmentView()
        setRemainderView()
      //  setAvailabilityView()
        
        setWelcomeMessage()
        
        tabBarController?.navigationController?.navigationBar.tintColor = UIColor(named: "barcolour")
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    
    
    func setWelcomeMessage(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        switch hour {
        case 4..<12 :
            welcomeLabel.text  = "Good Morning "
        case 12..<18 :
            welcomeLabel.text = "Good Afternoon"
        case 18..<22 :
            welcomeLabel.text = "Good Evening"
        default :
            welcomeLabel.text = "Good Night"
        }
    }
    
    func setContainerViews(){
        view.addSubview(scrollView)
        
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
                ])
    }
    
    func setTopView(){
        stackView.addArrangedSubview(TopView)
        
        let topViewheight = Viewheight * 0.1
        let heightSpacing = topViewheight * 0.05
        
        TopView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            TopView.heightAnchor.constraint(equalToConstant: topViewheight)
        ])
        
        
        TopView.addSubview(profileImageView)
        TopView.addSubview(welcomeLabel)
        TopView.addSubview(nameLabel)
       
       
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: (topViewheight - 20)),
            profileImageView.heightAnchor.constraint(equalToConstant: topViewheight - 20),
            profileImageView.leadingAnchor.constraint(equalTo: TopView.leadingAnchor,constant: heightSpacing),
            profileImageView.centerYAnchor.constraint(equalTo: TopView.centerYAnchor)
        ])
        
        profileImageView.layer.cornerRadius = (topViewheight - 20) / 2
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.heightAnchor.constraint(equalToConstant: (topViewheight / 3.7)),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: heightSpacing),
            welcomeLabel.widthAnchor.constraint(equalToConstant: viewWidth/3),
            welcomeLabel.topAnchor.constraint(equalTo: TopView.topAnchor,constant: heightSpacing)

        ])
        
        
        NSLayoutConstraint.activate([
            
            nameLabel.heightAnchor.constraint(equalToConstant: (topViewheight / 2.8)),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: heightSpacing),
            nameLabel.widthAnchor.constraint(equalToConstant: viewWidth/3),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 5)

        ])
        
     
        
        TopView.backgroundColor = UIColor(named: "white")
        
        TopView.layer.cornerRadius = topViewheight / 2
        TopView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        TopView.layer.shadowOpacity = 0.5
        TopView.layer.shadowOffset = CGSize(width: 2, height: 2)
        TopView.layer.shadowRadius = 5
        
    }
    
    
    func setSearchPatientView(){
        stackView.addArrangedSubview(searchPatientview)
        
        searchPatientview.spacing = 10
        searchPatientview.addArrangedSubview(searchPatientLabel)
        searchPatientview.addArrangedSubview(searchfield)
        
        NSLayoutConstraint.activate([
            searchPatientLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            searchfield.heightAnchor.constraint(equalToConstant: Viewheight * 0.05)
        ])
    }
    
    func setAppointmentView(){
        stackView.addArrangedSubview(appointmentsView)
        
        appointmentsView.spacing = 10
        appointmentsView.addArrangedSubview(appointmentsLabel)
        appointmentsView.addArrangedSubview(appointmentsCollectionView)
        appointmentsView.addArrangedSubview(viewAllAppointments)
        
        NSLayoutConstraint.activate([
            appointmentsLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            appointmentsCollectionView.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
            viewAllAppointments.heightAnchor.constraint(equalToConstant: Viewheight * 0.05)
        ])
        viewAllAppointments.addTarget(self, action: #selector(viewAllAppointmentsClicked), for: .touchUpInside)
        
        appointmentsCollectionView.register(PatientCell.self, forCellWithReuseIdentifier: PatientCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        appointmentsCollectionView.collectionViewLayout = layout
        
        appointmentsCollectionView.dataSource = self
        appointmentsCollectionView.delegate = self
        appointmentsCollectionView.tag = 0
        appointmentsCollectionView.backgroundColor = .clear
        appointmentsCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func setRemainderView(){
        stackView.addArrangedSubview(remainderView)
        
        remainderView.spacing = 10
        remainderView.addArrangedSubview(remainderLabel)
        remainderView.addArrangedSubview(remainderCollectionView)
        remainderView.addArrangedSubview(ViewAllRemainder)
        
        NSLayoutConstraint.activate([
            remainderLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            remainderCollectionView.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
            ViewAllRemainder.heightAnchor.constraint(equalToConstant: Viewheight * 0.05)
        ])
    }
    
    func setAvailabilityView(){
        stackView.addArrangedSubview(changeAvailabilityView)
        
        changeAvailabilityView.addArrangedSubview(changeAvailabilityLabel)
        
        NSLayoutConstraint.activate([
            changeAvailabilityLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
        ])
    }
    
    
    @objc func viewAllAppointmentsClicked(){
        
        let viewController = ViewAppointments(doctor: doctor)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    }

extension DoctorHomePageController : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PatientCell.identifier, for: indexPath) as! PatientCell
        
        if indexPath.row % 2 == 0 {
            cell.name.text = "name"
            cell.timing.text = "Time : 9;00 Am"
            cell.online()
            
        }
        else {
            cell.name.text = "name"
            cell.timing.text = "Time : 9;00 Am"
            cell.Offline()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (viewWidth / 2.2) - 40
        let cellHeight = Viewheight * 0.19
        
            return CGSize(width: cellWidth, height:cellHeight)
    }
    
    
    
}
