//
//  RecordsPage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class ReportsPage: UIViewController ,UIDocumentPickerDelegate{

    
  
    
    let noReportsImageView : ImageAndLabel = {
        let ImageAndLabel = ImageAndLabel()
        ImageAndLabel.imageView.image = UIImage(named: "noreports")
        ImageAndLabel.label.text = "No Reports Found"
        ImageAndLabel.translatesAutoresizingMaskIntoConstraints = false
        ImageAndLabel.label.textAlignment = .center
        ImageAndLabel.alpha = 0.4
        return ImageAndLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
     
        
        navigationController?.navigationBar.backgroundColor = .white
        
        setImageView()
        setBarButton()
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    func setImageView(){
        view.addSubview(noReportsImageView)
        
        
        NSLayoutConstraint.activate([
            noReportsImageView.heightAnchor.constraint(equalToConstant: viewWidth * 0.7),
            noReportsImageView.widthAnchor.constraint(equalToConstant: viewWidth * 0.5 ),
            noReportsImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noReportsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }
    
    func setBarButton(){
        let addBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
        addBarButton.tintColor = .black
        navigationItem.title = "My Reports"
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func addTapped(){
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = true
        present(documentPicker, animated: true, completion: nil)
    
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        let selectedFileURL = urls.first

        print("Selected file URL: \(selectedFileURL!)")
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
