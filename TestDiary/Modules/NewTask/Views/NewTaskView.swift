//
//  NewTaskView.swift
//  TestDiary
//
//  Created by Anatoliy on 10.01.2022.
//

import UIKit

class NewTaskView: UIView {
    
    // MARK: - Properties
    
    private(set) lazy var nameTextField = UITextField()
    let startTimeLabel = UILabel()
    private lazy var datePicker = UIDatePicker()
    let endTimeLabel = UILabel()
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    
    private var didSetupConstraints = false
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints() //пока что вызываю установку констрейнтов здесь, потому что через updateConstraints() не отрабатывает на ios 13
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Module functions
    private func setupViews() {
        backgroundColor = .white
        nameTextField.backgroundColor = .orange
        
        addSubviews([nameTextField])
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.backgroundColor = .white
        
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .compact
            nameTextField.isHidden = true
            addSubviews([datePicker])
            NSLayoutConstraint.activate([datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                        datePicker.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)])
            
            }
        
        nameTextField.inputView = datePicker
        
        

    }
    
        func setupConstraints() {
        print("констрейнты лейбла установлены")
        NSLayoutConstraint.activate([nameTextField.heightAnchor.constraint(equalToConstant: 50),
                                     nameTextField.widthAnchor.constraint(equalToConstant: 200),
                                     nameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     nameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)])
    }
}
