//
//  NewTaskView.swift
//  TestDiary
//
//  Created by Anatoliy on 10.01.2022.
//

import UIKit

class NewTaskView: UIView {
    
    // MARK: - UI Elements properties
    private(set) lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.placeholder = "Enter task name"
        textField.textAlignment = .center
        return textField
    }()
    
    private let startTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Start:"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "End:"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Task description:"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.systemBlue.cgColor
        return textView
    }()
    
    // MARK: - UIDatepickers properties
    private(set) lazy var startDatePicker = UIDatePicker()
    private(set) lazy var endDatePicker = UIDatePicker()
    
    private(set) var startTextField: UITextField?
    private(set) var endTextFiled: UITextField?
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC+3")
        formatter.dateFormat = "d MMM yyyy, HH:mm"
        return formatter
    }()
    
    // MARK: - Other properties
    private var tapGestureRecognizer = UITapGestureRecognizer()
    weak var output: ViewToControllerOutput?
    
    // MARK: - Value properties
    var taskName = "" {
        didSet {
            output?.inputValueChanged(name: taskName, startDate: startDate, endDate: endDate, description: taskDescription)
        }
    }
    var taskDescription: String? {
        didSet {
            output?.inputValueChanged(name: taskName, startDate: startDate, endDate: endDate, description: taskDescription)
        }
    }
    var startDate = Date() {
        didSet {
            output?.inputValueChanged(name: taskName, startDate: startDate, endDate: endDate, description: taskDescription)
        }
    }
    var endDate = Date() {
        didSet {
            output?.inputValueChanged(name: taskName, startDate: startDate, endDate: endDate, description: taskDescription)
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        
        startDatePicker.date = Date()
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        nameTextField.delegate = self
        descriptionTextView.delegate = self
        
        backgroundColor = .white
        
        tapGestureRecognizer.addTarget(self, action: #selector(self.viewTapped))
        addGestureRecognizer(tapGestureRecognizer)
        
        addSubviews([nameTextField, startTimeLabel, endTimeLabel, descriptionLabel, descriptionTextView])
        
        NSLayoutConstraint.activate([nameTextField.heightAnchor.constraint(equalToConstant: 35),
                                     nameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
                                     nameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     nameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 40)])
        
        setupDatePickers()
        
        NSLayoutConstraint.activate([descriptionLabel.heightAnchor.constraint(equalToConstant: 30),
                                     descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
                                     descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     descriptionLabel.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([descriptionTextView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
                                     descriptionTextView.heightAnchor.constraint(equalTo: descriptionTextView.widthAnchor, multiplier: 0.5),
                                     descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5)])
    }
    
    // MARK: - Setup DatePickers
    private func setupDatePickers() {
        if #available(iOS 14, *) {
            addSubviews([startDatePicker, endDatePicker])
            
            startDatePicker.preferredDatePickerStyle = .compact
            endDatePicker.preferredDatePickerStyle = .compact
            
            NSLayoutConstraint.activate([startDatePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                         startDatePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30)])
            
            NSLayoutConstraint.activate([endDatePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                         endDatePicker.topAnchor.constraint(equalTo: startDatePicker.bottomAnchor, constant: 10)])
            
            NSLayoutConstraint.activate([startTimeLabel.heightAnchor.constraint(equalToConstant: 30),
                                         startTimeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15),
                                         startTimeLabel.trailingAnchor.constraint(equalTo: startDatePicker.leadingAnchor, constant: 5),
                                         startTimeLabel.centerYAnchor.constraint(equalTo: startDatePicker.centerYAnchor)])
            
            NSLayoutConstraint.activate([endTimeLabel.heightAnchor.constraint(equalToConstant: 30),
                                         endTimeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15),
                                         endTimeLabel.trailingAnchor.constraint(equalTo: endDatePicker.leadingAnchor, constant: 5),
                                         endTimeLabel.centerYAnchor.constraint(equalTo: endDatePicker.centerYAnchor)])
            
        } else {
            startTextField = {
                let textField = UITextField()
                textField.layer.borderWidth = 0.5
                textField.layer.cornerRadius = 5
                textField.layer.borderColor = UIColor.systemBlue.cgColor
                textField.textAlignment = .center
                textField.text = dateFormatter.string(from: Date())
                return textField
            }()
            
            endTextFiled = {
                let textField = UITextField()
                textField.layer.borderWidth = 0.5
                textField.layer.cornerRadius = 5
                textField.layer.borderColor = UIColor.systemBlue.cgColor
                textField.textAlignment = .center
                return textField
            }()
            
            guard let startTextField = startTextField else { return }
            guard let endTextFiled = endTextFiled else { return }
            
            startTextField.inputView = startDatePicker
            endTextFiled.inputView = endDatePicker
            
            startDatePicker.backgroundColor = .white
            endDatePicker.backgroundColor = .white
            
            addSubviews([startTextField, endTextFiled])
            
            NSLayoutConstraint.activate([startTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                         startTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
                                         startTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
                                         startTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor)])
            
            NSLayoutConstraint.activate([endTextFiled.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                         endTextFiled.topAnchor.constraint(equalTo: startTextField.bottomAnchor, constant: 10),
                                         endTextFiled.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
                                         endTextFiled.widthAnchor.constraint(equalTo: nameTextField.widthAnchor)])
            
            NSLayoutConstraint.activate([startTimeLabel.heightAnchor.constraint(equalToConstant: 30),
                                         startTimeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15),
                                         startTimeLabel.trailingAnchor.constraint(equalTo: startTextField.leadingAnchor, constant: 5),
                                         startTimeLabel.centerYAnchor.constraint(equalTo: startTextField.centerYAnchor)])
            
            NSLayoutConstraint.activate([endTimeLabel.heightAnchor.constraint(equalToConstant: 30),
                                         endTimeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15),
                                         endTimeLabel.trailingAnchor.constraint(equalTo: endTextFiled.leadingAnchor, constant: 5),
                                         endTimeLabel.centerYAnchor.constraint(equalTo: endTextFiled.centerYAnchor)])
        }
        
        startDatePicker.minimumDate = Date()
        endDatePicker.minimumDate = Date()
        
        //startDatePicker.timeZone = TimeZone(abbreviation: "GMT")
        //endDatePicker.timeZone = TimeZone(abbreviation: "GMT")
        
        startDatePicker.addTarget(self, action: #selector(self.datePickerValueChanged(datePicker:)), for: .valueChanged)
        endDatePicker.addTarget(self, action: #selector(self.datePickerValueChanged(datePicker:)), for: .valueChanged)
    }
    
    // MARK: - Date Pickers values changed
    @objc private func datePickerValueChanged(datePicker: UIDatePicker) {
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+3")
        //        dateFormatter.dateFormat = "d MMM yyyy, HH:mm"
        
        if datePicker == startDatePicker {
            startTextField?.text = dateFormatter.string(from: datePicker.date)
            startDate = datePicker.date
            endDatePicker.minimumDate = datePicker.date
            
        } else if datePicker == endDatePicker {
            endTextFiled?.text = dateFormatter.string(from: datePicker.date)
            endDate = datePicker.date
        }
        
        //        guard let endDate = endDate else { return }
        //        guard let startDate = startDate else { return }
        
        if endDate < startDate {
            endTextFiled?.text = ""
            //self.endDate = nil
        }
    }
    // MARK: - Hide keyboard
    @objc func viewTapped() {
        endEditing(true)
    }
}

// MARK: - Text values changed
extension NewTaskView: UITextViewDelegate, UITextFieldDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            taskDescription = nil
        } else {
            taskDescription = textView.text
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        taskName = text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewTapped()
        return true
    }
}
