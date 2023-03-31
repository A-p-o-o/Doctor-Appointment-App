import UIKit

class EditPatientDetailsController: UIViewController {
    
    
    let patient : Patient
    
    let detailsDataTitle  : [String] = ["Name","Phone Number","E-Mail","Date of Birth","Height","Weight","Allergies","Address"]
    
    init(patient: Patient) {
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false 
        
        setBackground()
        setProfileImageView()
        setViews()
        orientationChanged()
    }
    
    lazy var Viewheight = view.frame.height
        lazy var viewWidth = view.frame.width
        
        func orientationChanged(){
                
                UIDevice.current.beginGeneratingDeviceOrientationNotifications()

                
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { [self] _ in
                   
                    let orientation = UIDevice.current.orientation
                    switch orientation {
                    case .portrait:
                        Viewheight = view.frame.height
                        viewWidth = view.frame.width
                        setBackground()
                        setProfileImageView()
                        setViews()
                        
                    case .landscapeLeft, .landscapeRight:
                        Viewheight = view.frame.width
                        viewWidth = view.frame.height
                        setBackground()
                        setProfileImageView()
                        setViews()
                        
                    default:
                        break
                    }
                }

            }
    
    let scrollView = UIScrollView()
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let profileImageView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 0.4 * min(imageView.bounds.width, imageView.bounds.height)
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    func setBackground(){
        view.backgroundColor = UIColor(named: "background")
        let backgroundImage = UIImage(named: "editprofile")
        let backgroundImageView = UIImageView(image: backgroundImage)
       
        backgroundImageView.contentMode = .scaleAspectFit
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: viewWidth * 0.4),
            backgroundImageView.widthAnchor.constraint(equalToConstant: viewWidth * 0.4)
        ])
    }
    
    
    func setProfileImageView(){
    }
    
    func setViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        stackView.spacing = view.frame.height * 0.03
        
        stackView.addArrangedSubview(profileImageView)
        profileImageView.addSubview(profileImage)
        
        profileImageView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: (Viewheight * 0.3) + 20)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: Viewheight * 0.3),
            profileImage.heightAnchor.constraint(equalToConstant: Viewheight * 0.3),
            profileImage.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ])
        profileImageView.sizeToFit()
        profileImage.layer.cornerRadius = Viewheight * 0.3 / 2
        
        profileImageView.layer.cornerRadius = 5
        profileImageView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        profileImageView.layer.shadowOpacity = 0.8
        profileImageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileImageView.layer.shadowRadius = 5
        profileImageView.backgroundColor = .white.withAlphaComponent(0.6)
       

        for details in detailsDataTitle {
            let field = LabelAndField()
            field.translatesAutoresizingMaskIntoConstraints = false
            field.label.text = "\(details)"
            field.errorLabel.isHidden = true
            NSLayoutConstraint.activate([
                field.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.08),
                field.textField.bottomAnchor.constraint(equalTo: field.bottomAnchor, constant: -10)
            ])
            field.textField.clearButtonMode = .whileEditing
            field.sizeToFit()
            field.layer.cornerRadius = 5
            field.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            field.layer.shadowOpacity = 0.8
            field.layer.shadowOffset = CGSize(width: 4, height: 4)
            field.layer.shadowRadius = 5
            field.backgroundColor = .white.withAlphaComponent(0.6)

            field.errorLabel.removeFromSuperview()
            field.textField.placeholder = ""
            scrollView.showsVerticalScrollIndicator = false
            stackView.addArrangedSubview(field)
        }
    }
}

extension EditPatientDetailsController : UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}

