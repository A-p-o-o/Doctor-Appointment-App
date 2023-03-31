//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import UIKit

class DoctorProfileController: UIViewController {
   
   
    let doctor : Doctor
    var patient : Patient
    
    var selectDate :String? = nil
    
    var isFavourite : Bool {
        patient.getFavouriteDoctors().contains(doctor)
    }
    
    var slots : (startTime:[String],endTime:[String],slotno:[Int]) = ([],[],[])
    
    var availableDatesOfDoctor : [String] {
        search.doctorAvailableDates(doctorId: doctor.employeeId)
    }
    
    var dateAndSlots : [String:(startTime:[String],endTime:[String],slotno:[Int])] {
        search.dateAndslots(dates: availableDatesOfDoctor, doctorId: doctor.employeeId)
    }
    
    
    let search = Search()
    let dao = DoctorDAO()
    
    
     init(doctor: Doctor, patient: Patient) {
         self.doctor = doctor
         self.patient = patient
         super.init(nibName: nil, bundle: nil)
         selectDate = availableDatesOfDoctor[0]
         selectedDate.text = "\(selectDate!)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let scrollView = UIScrollView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 0.4 * min(imageView.bounds.width, imageView.bounds.height)
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var favouriteView = FavouriteView(viewHeight: Viewheight * 0.1, viewWidth: Viewheight * 0.1)
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 999), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let departmentLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let LocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .lightGray
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationImageView  : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.circle")!.withTintColor(.red, renderingMode: .alwaysOriginal)
         imageView.contentMode = .scaleAspectFit
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
    
    
    let experience = LabelImageLabel()
    let patients : LabelImageLabel = {
        let label = LabelImageLabel()
        label.titleLabel.text = "Patients"
        label.infoLabel.text = "400+"
        label.image.image = UIImage(systemName: "person.fill")!.withTintColor(UIColor(named: "book")!, renderingMode: .alwaysOriginal)
        return label
    }()
    
    let rating : LabelImageLabel = {
        let label = LabelImageLabel()
        label.titleLabel.text = "Rating"
        label.infoLabel.text = "4.0"
        label.image.image = UIImage(systemName: "star.fill")!.withTintColor(UIColor(named: "ratings")!, renderingMode: .alwaysOriginal)
        return label
    }()
    
    
    let aboutTitleLabel :  UILabel = {
        let label = UILabel()
        label.text = "About"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .title2)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aboutLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .title2)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let languagesKnownTitle : UILabel = {
        let label = UILabel()
        label.text = "Languages Known"
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
    
    let languagesKnown : UILabel = {
        let label = UILabel()
        label.text = "English, Tamil, Telugu"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let consultationFeeTitle : UILabel = {
        let label = UILabel()
        label.text = "Consultation Fee"
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
    
    let consultationFee : UILabel = {
        let label = UILabel()
        label.text = "Rs. 300 only"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookAppointmentButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .white
        button.setTitle("Book an Appointment", for: .normal)
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let middleView = UIView()
    let availableDates = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
    
   
    let bottomView  = UIView()
    let pickUrDateLabel : UILabel = {
        let label = UILabel()
        label.text = "Pick your Date"
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
    
    let selectedDateTitle : UILabel = {
        let label = UILabel()
        label.text = "Date Selected"
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
    
    let selectedDate : UILabel = {
        let label = UILabel()
        label.text = "dd-MM-yyyy"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   let availableSlotsTitle : UILabel = {
        let label = UILabel()
        label.text = "Select Hour"
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
    
    let availableSlots = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        slots = dateAndSlots[selectDate!]!
        availableSlots.reloadData()
        view.backgroundColor = UIColor(named: "background")
        
        profileImageView.image = UIImage(named: doctor.image)
        consultationFee.text = "Rs.\(doctor.appointmentFee)"
        languagesKnown.text = doctor.languagesKnown
        departmentLabel.text = doctor.department.departmentName
        setViews()
        setDetails()
        
        title = "Doctor Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.tabBar.isHidden = true

    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
       
        
    }
    
    func setDetails(){
        nameLabel.text = "Dr. \(doctor.name)"
        departmentLabel.text = doctor.department.departmentName
    }
    
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    var heightSpacing : CGFloat  { Viewheight * 0.02 }
    var widthSpacing : CGFloat { viewWidth * 0.03 }

    
    func setViews(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(favouriteView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(departmentLabel)
        scrollView.addSubview(locationImageView)
        scrollView.addSubview(LocationLabel)
        scrollView.addSubview(experience)
        scrollView.addSubview(patients)
        scrollView.addSubview(rating)
        scrollView.addSubview(aboutTitleLabel)
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(languagesKnownTitle)
        scrollView.addSubview(languagesKnown)
        scrollView.addSubview(consultationFeeTitle)
        scrollView.addSubview(consultationFee)
        scrollView.addSubview(middleView)
        scrollView.addSubview(bottomView)
        
        view.addSubview(bookAppointmentButton)
        
        scrollView.delegate = self
        
        scrollView.tag = 0
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),

        ])
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: Viewheight * 0.2),
            profileImageView.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
            profileImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        
        
        profileImageView.layer.cornerRadius = (Viewheight * 0.2) / 2
        
        favouriteView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favouriteView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            favouriteView.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            favouriteView.widthAnchor.constraint(equalToConstant: Viewheight * 0.05),
            favouriteView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: -Viewheight * 0.2*0.3)
        ])
        favouriteView.layer.cornerRadius = (Viewheight * 0.05)/2
        favouriteView.favouritebutton.isSelected = isFavourite
        favouriteView.favouritebutton.addTarget(self, action: #selector(favouriteButtonTapped(_:)), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            departmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            departmentLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            departmentLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            departmentLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            departmentLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        
        let viewWidthExp = viewWidth * 0.25
        
        NSLayoutConstraint.activate([
            LocationLabel.topAnchor.constraint(equalTo: departmentLabel.bottomAnchor),
            LocationLabel.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor,constant: 10),
            LocationLabel.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor, constant: -10),
            LocationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            LocationLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
        ])
        
        NSLayoutConstraint.activate([
            locationImageView.centerYAnchor.constraint(equalTo: LocationLabel.centerYAnchor),
           locationImageView.widthAnchor.constraint(equalToConstant: Viewheight * 0.03),
           locationImageView.heightAnchor.constraint(equalToConstant: Viewheight * 0.03),
            locationImageView.trailingAnchor.constraint(equalTo: LocationLabel.leadingAnchor, constant: -5)
        ])
        
        experience.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            experience.topAnchor.constraint(equalTo: LocationLabel.bottomAnchor,constant: heightSpacing),
            experience.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant:  10),
            experience.widthAnchor.constraint(equalToConstant: viewWidthExp),
            experience.heightAnchor.constraint(equalToConstant: Viewheight * 0.06)
        ])
        
        
        
        patients.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            patients.topAnchor.constraint(equalTo: LocationLabel.bottomAnchor,constant: heightSpacing),
            patients.widthAnchor.constraint(equalToConstant: viewWidthExp),
            patients.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            patients.heightAnchor.constraint(equalToConstant: Viewheight * 0.06)
        ])
        
        
        rating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: LocationLabel.bottomAnchor,constant: heightSpacing),
            rating.widthAnchor.constraint(equalToConstant: viewWidthExp),
            rating.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -10),
            rating.heightAnchor.constraint(equalToConstant: Viewheight * 0.06)
        ])
        
        NSLayoutConstraint.activate([
            aboutTitleLabel.topAnchor.constraint(equalTo: rating.bottomAnchor,constant: heightSpacing),
            aboutTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            aboutTitleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            aboutTitleLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
        
        let aboutsize = aboutLabel.sizeThatFits(CGSize(width: viewWidth , height: CGFLOAT_MAX))
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor,constant: 10),
            aboutLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            aboutLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            aboutLabel.heightAnchor.constraint(equalToConstant: aboutsize.height),
            aboutLabel.widthAnchor.constraint(equalToConstant: viewWidth - 20)
        ])
        
        NSLayoutConstraint.activate([
            languagesKnownTitle.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor,constant: heightSpacing),
            languagesKnownTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            languagesKnownTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            languagesKnownTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
        
        NSLayoutConstraint.activate([
           languagesKnown.topAnchor.constraint(equalTo: languagesKnownTitle.bottomAnchor,constant: 10),
           languagesKnown.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
           languagesKnown.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
           languagesKnown.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
        
        NSLayoutConstraint.activate([
            consultationFeeTitle.topAnchor.constraint(equalTo: languagesKnown.bottomAnchor,constant: heightSpacing),
            consultationFeeTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            consultationFeeTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            consultationFeeTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
        
        NSLayoutConstraint.activate([
           consultationFee.topAnchor.constraint(equalTo: consultationFeeTitle.bottomAnchor,constant: 10),
           consultationFee.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
           consultationFee.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
           consultationFee.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
           //consultationFee.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        
        bookAppointmentButton.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        bookAppointmentButton.layer.shadowOpacity = 0.7
        bookAppointmentButton.layer.shadowOffset = CGSize(width: -2, height: -2)
        bookAppointmentButton.layer.shadowRadius = 5
        bookAppointmentButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            bookAppointmentButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.06),
            bookAppointmentButton.widthAnchor.constraint(equalToConstant: viewWidth - 20),
            bookAppointmentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookAppointmentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        bookAppointmentButton.addTarget(self, action: #selector(buttontapped), for: .touchUpInside)
        
        
        middleView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: consultationFee.bottomAnchor,constant: heightSpacing),
            middleView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            middleView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -10),
            middleView.heightAnchor.constraint(equalToConstant: Viewheight * 0.15 )
        ])
        
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor,constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -10),
            bottomView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: Viewheight * 0.6)
        ])

        setMiddleView()
        setbottomView()
    }
    
    @objc func buttontapped(_ sender : UIButton){
        let point = CGPoint(x: 0, y: aboutLabel.frame.origin.y - scrollView.contentInset.top)
            scrollView.setContentOffset(point, animated: true)
        sender.isHidden = true
    }
    
    @objc func favouriteButtonTapped(_ sender : UIButton){
        
        if !isFavourite{
           patient.addTofavourites(doctor: doctor)
            
            let alert = UIAlertController(title: "Favourite Added", message: "This Doctor has been added to your favourites.", preferredStyle: .actionSheet)
            present(alert, animated: true, completion: nil)
            
            let time = DispatchTime.now() + 0.7
            DispatchQueue.main.asyncAfter(deadline: time) {
                alert.dismiss(animated: true, completion: nil)
            }
            sender.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
            
        }
        else{
            patient.removeFromfavourites(doctor: doctor)
            sender.setImage(UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
 
    func setMiddleView(){
        middleView.addSubview(pickUrDateLabel)
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
            pickUrDateLabel.topAnchor.constraint(equalTo: middleView.topAnchor),
            pickUrDateLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            pickUrDateLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            pickUrDateLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor)
            
        ])
    
        NSLayoutConstraint.activate([
            availableDates.topAnchor.constraint(equalTo: pickUrDateLabel.bottomAnchor),
            availableDates.bottomAnchor.constraint(equalTo: middleView.bottomAnchor),
            availableDates.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            availableDates.trailingAnchor.constraint(equalTo: middleView.trailingAnchor)
            
        ])
    }
    
    func setbottomView(){
        bottomView.addSubview(selectedDateTitle)
        bottomView.addSubview(selectedDate)
        bottomView.addSubview(availableSlotsTitle)
        bottomView.addSubview(availableSlots)
        
        availableSlots.tag = 2
        
        NSLayoutConstraint.activate([
            selectedDateTitle.topAnchor.constraint(equalTo: bottomView.topAnchor),
            selectedDateTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            selectedDateTitle.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            selectedDateTitle.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])

        
        NSLayoutConstraint.activate([
            selectedDate.topAnchor.constraint(equalTo: selectedDateTitle.bottomAnchor,constant: 5),
            selectedDate.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            selectedDate.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            selectedDate.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            availableSlotsTitle.topAnchor.constraint(equalTo: selectedDate.bottomAnchor,constant: 5),
            availableSlotsTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            availableSlotsTitle.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            availableSlotsTitle.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])
        
        
        availableSlots.register(Slots.self, forCellWithReuseIdentifier: Slots.identifier)

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)

        availableSlots.translatesAutoresizingMaskIntoConstraints = false

        availableSlots.dataSource = self
        availableSlots.delegate = self
        availableSlots.showsVerticalScrollIndicator = false
        availableSlots.showsHorizontalScrollIndicator = true

        availableSlots.collectionViewLayout = flowLayout

        availableSlots.backgroundColor = .clear
        availableSlots.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            availableSlots.topAnchor.constraint(equalTo: availableSlotsTitle.bottomAnchor,constant: 10),
            availableSlots.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            availableSlots.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            availableSlots.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])

    }
    
    
   
   
}

extension DoctorProfileController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            return availableDatesOfDoctor.count
        }
        else {
            
            return slots.startTime.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableDates.identifier, for: indexPath) as! AvailableDates
            
            let date = availableDatesOfDoctor[indexPath.row]
            cell.titleLabel.text = date
            
            
            let slots : Int = dateAndSlots[date]?.startTime.count ?? 0
            cell.infoLabel.text = slots == 0 ? "No slots Available" : "\(slots) slots Available"
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Slots.identifier, for: indexPath) as! Slots
            
            cell.titleLabel.text  =  "\(slots.startTime[indexPath.row])"
            cell.titleLabel.textAlignment = .center
            return cell
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
            let height = Viewheight * 0.1
            let width = (viewWidth - 40) * 0.35
            

            
            return CGSize(width: width, height: height)
        }
        else {
            let height = Viewheight  / 10.5
            let width = (viewWidth - 40) / 3 - 20
            
            return CGSize(width: width, height: height)
        }
    }
    
}


extension DoctorProfileController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
       
        
        if collectionView.tag == 1 {
            
           let cell =  collectionView.cellForItem(at: indexPath)! as! AvailableDates
            selectedDate.text = cell.titleLabel.text!
            selectDate = cell.titleLabel.text!
            slots = dateAndSlots[cell.titleLabel.text!]!
            availableSlots.reloadData()
            
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(named: "book")?.cgColor
            
        }
        
        else if collectionView.tag == 2{
            collectionView.deselectItem(at: indexPath, animated: false)
            
            
            let viewController = BookAppointmentController(doctor: self.doctor, patient: self.patient, startTime: slots.startTime[indexPath.row],endTime: slots.endTime[indexPath.row], date: selectDate!,slotNo: slots.slotno[indexPath.row])
            navigationController?.pushViewController(viewController, animated: true)
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


extension DoctorProfileController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 0{
            if consultationFee.frame.intersects(scrollView.bounds){
                bookAppointmentButton.isHidden = true
            }
            else {
                bookAppointmentButton.isHidden = false
            }
        }
    }
}









