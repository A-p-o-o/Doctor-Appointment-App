import UIKit

class EditPatientProfileController: UIViewController {
    
    
    var patient : Patient
    
    let detailsDataTitle  : [String] = ["Name","Phone Number","E-Mail","Date of Birth","Gender","Blood Group","Height (Cm)","Weight (Kg)"]
    
    lazy var details : [String] = ["\(patient.name)","\(patient.phoneNumber)","\(patient.mail)","\(dateFormat(date: patient.dateOfBirth ?? Date()) )","\(patient.sex)","\(patient.bloodGroup?.name ??  BloodGroup.aNegative.name)","\(patient.height)","\(patient.weight)","\(patient.AllergyTo)","\(patient.address)"]
    
    
    
    var name : String? = nil
    var phoneNumber : String? = nil
    var email : String? = nil
    var dateOfBirth : Date? = nil
    var gender : Sex? = nil
    var bloodGroup : BloodGroup? = nil
    var height : Double? = nil
    var weight : Double? = nil
    
    init(userId : String) {
       
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
        
    let scrollView = UIScrollView()
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let imagePicker = UIImagePickerController()
    
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
    
    let editButton : UIButton = {
       let button = UIButton()
       button.configuration = .borderless()
       button.configuration?.baseBackgroundColor = UIColor(named: "book")
       button.configuration?.baseForegroundColor = .black
       button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setBarButton()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
    }

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    func setBarButton(){
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked))
        
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc func doneClicked(){
        
        if validateFields(){
            patient.UpdateInfo(name: name!, phoneNumber: phoneNumber!, sex: gender!, mail: email!, address: "", weight: weight!, height: height!, AllergyTo: "")
            navigationController?.popViewController(animated: true)
        }
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
        
       // stackView.spacing = view.frame.height * 0.03
        
        stackView.addArrangedSubview(profileImageView)
        profileImageView.addSubview(profileImage)
        profileImageView.addSubview(editButton)
        
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: (Viewheight * 0.3) + 20)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: Viewheight * 0.3),
            profileImage.heightAnchor.constraint(equalToConstant: Viewheight * 0.3),
            profileImage.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
            editButton.topAnchor.constraint(equalTo: profileImage.topAnchor),
            editButton.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 10),
            editButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            editButton.widthAnchor.constraint(equalToConstant: Viewheight * 0.05)
        ])
        profileImageView.sizeToFit()
        profileImage.layer.cornerRadius = Viewheight * 0.3 / 2
        
        editButton.addTarget(self, action: #selector(uploadButtonPressed(_:)), for: .touchUpInside)
        
    
        for index in 0..<detailsDataTitle.count {
            let labelAndField = LabelAndField()
            
            labelAndField.translatesAutoresizingMaskIntoConstraints = false
            labelAndField.label.text = "\(detailsDataTitle[index])"
         //   labelAndField.errorLabel.isHidden = true
            labelAndField.textField.text = "\(details[index])"
            
            NSLayoutConstraint.activate([
                labelAndField.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.08),
                labelAndField.textField.bottomAnchor.constraint(equalTo: labelAndField.bottomAnchor, constant: -10)
            ])
            
            labelAndField.textField.clearButtonMode = .whileEditing
            labelAndField.sizeToFit()
//            labelAndField.layer.cornerRadius = 5
//            labelAndField.layer.shadowColor = UIColor(named: "shadow")?.cgColor
//            labelAndField.layer.shadowOpacity = 0.8
//            labelAndField.layer.shadowOffset = CGSize(width: 4, height: 4)
//            labelAndField.layer.shadowRadius = 5
//            labelAndField.backgroundColor = .white.withAlphaComponent(0.6)

            labelAndField.textField.placeholder = ""
            scrollView.showsVerticalScrollIndicator = false
            stackView.addArrangedSubview(labelAndField)
            labelAndField.tag = index
            setKeyboard(labelAndField: labelAndField)
        }
        
        imagePicker.delegate = self
    }
    
    
    func setKeyboard(labelAndField : LabelAndField){
        
        switch labelAndField.tag {
        case 0 : labelAndField.textField.keyboardType = .alphabet
            
        case 1,6,7 : labelAndField.textField.keyboardType = .default
        case 2 : labelAndField.textField.keyboardType = .emailAddress
        case 3 : labelAndField.asDateOfBirth()
        case 4 : labelAndField.setGenderPicker()
        case 5  : labelAndField.setBloodGroupPicker()
        default : labelAndField.textField.keyboardType = .default
            
        }
    }
    
    func validateFields()->Bool{
        for views in stackView.arrangedSubviews{
            guard let labelAndField = views as? LabelAndField else { continue  }
            
            switch labelAndField.tag {
            case 0 : if !(labelAndField.isValidName(name: &name)){
                return false
            }
            case 1 : if !(labelAndField.isValidPhoneNumber(phoneNumber: &phoneNumber)){
                return false
            }
            case 2 : if !(labelAndField.isValidEmail(email: &email)){
                return false
            }
            case 3 :  if labelAndField.isTextEmpty(){
                return false
            }
                else {
                    dateOfBirth = labelAndField.selectedDate
                }
            case 4 : if !labelAndField.isValidGender(gender: &gender){
                return false
            }
            case 5 : if !labelAndField.isValidBloodGroup(bloodGroup: &bloodGroup){
                return false
            }
            case 6 : if !labelAndField.isValidHeight(height: &height){
                return false
            }
            case 7 : if !labelAndField.isValidWeight(weight: &weight){
                return false
            }
            default : continue
                
            }
        }
        return true
    }
    
    @objc func uploadButtonPressed(_ sender: UIButton) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
        
        
}

extension EditPatientProfileController : UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}

extension EditPatientProfileController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFit
            profileImage.image = pickedImage
        }

        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
}

