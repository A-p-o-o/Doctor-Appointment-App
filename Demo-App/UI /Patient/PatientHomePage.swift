//
//  PatientHomePage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class PatientHomePage: UIViewController {
    
    let scrollView = UIScrollView()
    let stack = UIStackView()
    let surgery = SurgeryView()
    lazy var sysmptoms = SymptomsView(patient : patient,height: Viewheight * 0.2, width: viewWidth * 0.97)
    lazy var specialist = SpecialistView(patient: patient, height: Viewheight * 0.3, width: viewWidth * 0.97)
    lazy var findDoctors = SelectDoctors(height: Viewheight * 0.30, width: viewWidth * 0.97)
    let articles = ArticleView()
    
    
    let patient : Patient
    
    
    
    let TopView = UIView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
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
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favouriteView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favouriteImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")!.withTintColor(.red, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
         title = "Home"
        nameLabel.text = "Mr. \(patient.name)"
    
        setScroll()
        setStack()
        setSurgery()
        setSymptomsView()
        setSpecialist()
        setDoctors()
        setArticles()
        
        findDoctors.patient = self.patient
       
        setWelcomeMessage()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black
    }
    
    
    init(patient : Patient){
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
   
    func setScroll(){
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
//        if #available(iOS 14.0, *) {
//                    let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
//                    let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
//                    additionalSafeAreaInsets = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
//                }
            
    }
    
    
    func setStack(){
        scrollView.addSubview(stack)
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
                    stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                    stack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
                ])
        setTopView()
    }
    
    
    
    func setTopView(){
        
        
        
        stack.addArrangedSubview(TopView)
        
        let topViewheight = Viewheight * 0.1
        let heightSpacing = topViewheight * 0.05
        
        TopView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            TopView.heightAnchor.constraint(equalToConstant: topViewheight),
            TopView.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.94)
        ])
        
        
        TopView.addSubview(profileImageView)
        TopView.addSubview(welcomeLabel)
        TopView.addSubview(nameLabel)
        TopView.addSubview(favouriteView)
       
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: (topViewheight - 20)),
            profileImageView.heightAnchor.constraint(equalToConstant: topViewheight - 20),
            profileImageView.leadingAnchor.constraint(equalTo: TopView.leadingAnchor,constant: heightSpacing),
            profileImageView.topAnchor.constraint(equalTo: TopView.topAnchor,constant: heightSpacing)
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
        
        
        NSLayoutConstraint.activate([
            favouriteView.centerYAnchor.constraint(equalTo: TopView.centerYAnchor),
            favouriteView.heightAnchor.constraint(equalToConstant: topViewheight/2),
            favouriteView.widthAnchor.constraint(equalToConstant: topViewheight/2),
            favouriteView.trailingAnchor.constraint(equalTo: TopView.trailingAnchor,constant: -40),
            
        ])
        
        favouriteView.addSubview(favouriteImage)
        
        favouriteView.layer.cornerRadius = (topViewheight/2) / 2
        favouriteView.clipsToBounds = true
        
        let likeSpace : CGFloat = 7
        NSLayoutConstraint.activate([
            favouriteImage.topAnchor.constraint(equalTo: favouriteView.topAnchor,constant: likeSpace),
            favouriteImage.bottomAnchor.constraint(equalTo: favouriteView.bottomAnchor,constant: -likeSpace),
            favouriteImage.leadingAnchor.constraint(equalTo: favouriteView.leadingAnchor,constant: likeSpace),
            favouriteImage.trailingAnchor.constraint(equalTo: favouriteView.trailingAnchor,constant: -likeSpace),
        ])
        
        
        TopView.backgroundColor = .white
        
        TopView.layer.cornerRadius = topViewheight / 2
        TopView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        TopView.layer.shadowOpacity = 0.5
        TopView.layer.shadowOffset = CGSize(width: 2, height: 2)
        TopView.layer.shadowRadius = 5
        
        
        favouriteView.layer.shadowColor = UIColor.black.cgColor
        favouriteView.layer.shadowOpacity = 0.9
        favouriteView.layer.shadowOffset = CGSize(width: 20, height: 20)
        favouriteView.layer.shadowRadius = 5
        favouriteView.layer.borderWidth = 1
        favouriteView.layer.borderColor = UIColor(named: "shadow")?.cgColor
        
        favouriteView.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(favouriteSelected))
        
        favouriteView.addGestureRecognizer(tapgesture)
    }
    
    @objc func favouriteSelected(){
        
        let viewController = FavouriteDoctorsController(patient: patient)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setSurgery(){
        stack.addArrangedSubview(surgery)
        surgery.translatesAutoresizingMaskIntoConstraints = false
        surgery.layer.cornerRadius = 10
       
        
        NSLayoutConstraint.activate([
            surgery.heightAnchor.constraint(equalToConstant: Viewheight * 0.30),
            surgery.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.94)
        ])
        
        surgery.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(surgeryViewTapped))
        surgery.addGestureRecognizer(tapGesture)
        
       
    }
    
   func setSymptomsView(){
        stack.addArrangedSubview(sysmptoms)
       
       sysmptoms.layer.cornerRadius = 10
       sysmptoms.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
           sysmptoms.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.2),
           sysmptoms.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
       ])
       sysmptoms.viewAll.isUserInteractionEnabled = true
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(symptomsViewAllClicked))
       sysmptoms.viewAll.addGestureRecognizer(tapGesture)
       
       sysmptoms.viewController = self
    }
    
    @objc func symptomsViewAllClicked(){
        let viewController = AllSymptomsController(patient: patient)
        viewController.title = "View All Symptoms"
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func setSpecialist(){
        specialist.layer.cornerRadius = 10
        specialist.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(specialist)

        NSLayoutConstraint.activate([
            specialist.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.3),
            specialist.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
        ])
        
        
        
        specialist.viewController = self
        
        specialist.viewAll.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(specialistViewAllClicked))
        specialist.viewAll.addGestureRecognizer(tapGesture)
    }
    
    @objc func specialistViewAllClicked(){
        let viewController = AllDepartmentsController(patient: patient)
        viewController.title = "View All Specialist"
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func setDoctors(){
       
        findDoctors.layer.cornerRadius = 10
        findDoctors.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(findDoctors)

        NSLayoutConstraint.activate([
            findDoctors.heightAnchor.constraint(equalToConstant: Viewheight * 0.30),
            findDoctors.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.97)
        ])
        
        findDoctors.viewController = self
        
        findDoctors.viewAll.isUserInteractionEnabled = true
        findDoctors.viewAll.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(viewAllSpecialist)))
        
    }
    
    
    
    func setArticles(){
        articles.layer.cornerRadius = 10
        articles.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(articles)

        NSLayoutConstraint.activate([
            articles.heightAnchor.constraint(equalToConstant: Viewheight * 0.55),
            articles.widthAnchor.constraint(equalTo: stack.widthAnchor,multiplier: 0.94)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        articles.addGestureRecognizer(tapGesture)

        
    }
    
    @objc func imageTapped(_ gesture: UITapGestureRecognizer) {
        let page = articles.pageControl.currentPage
        let imageName = "article\(page + 1)"
        let zoomableVC = ArticlesDetailedImageController(imageName: imageName)
        navigationController?.pushViewController(zoomableVC, animated: true)
    }

    
    
  
    
    @objc func viewAllSpecialist(){
        
        let vc = AllDepartmentsController(patient: self.patient)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func surgeryViewTapped(){
        tabBarController?.selectedIndex = 1
    }
    
 
    
}


