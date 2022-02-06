//
//  BaseTaskEditVC.swift
//  TestDiary
//
//  Created by Anatoliy on 22.01.2022.
//

import UIKit

class BaseTaskEditViewController: UIViewController, ViewToControllerOutput {
    
    private let customView = NewTaskView()
     var viewValues = EditTaskViewModel(name: "", startDate: Date(), endDate: Date(), description: nil)
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.output = self
        subscribeToKeyboardNotifications()
    }
    
    func close() {
        customView.hideKeyboard()
    }
    
    func setupWithViewModel(viewModel: EditTaskViewModel) {
        
        viewValues = viewModel
        
        customView.endDatePicker.minimumDate = viewModel.startDate
        
        customView.nameTextField.text = viewModel.name
        customView.startDatePicker.date = viewModel.startDate
        customView.endDatePicker.date = viewModel.endDate
        customView.descriptionTextView.text = viewModel.description
        
        customView.startDate = viewModel.startDate
        customView.endDate = viewModel.endDate
        customView.taskName = viewModel.name
        customView.taskDescription = viewModel.description
        
        if #available(iOS 14, *) {
        } else {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_Ru")
            formatter.timeZone = TimeZone(abbreviation: "UTC+3")
            formatter.dateFormat = "d MMM yyyy, HH:mm"
            customView.startTextField?.text = formatter.string(from: viewModel.startDate)
            customView.endTextFiled?.text = formatter.string(from: viewModel.endDate)
        }
    }
    
    func inputValueChanged(name: String, startDate: Date, endDate: Date, description: String?) {
        viewValues.name = name
        viewValues.endDate = endDate
        viewValues.startDate = startDate
        viewValues.description = description
    }

}

// MARK: - Keyboard show/hide logic
private extension BaseTaskEditViewController {
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let bottomOfTextView = customView.descriptionTextView.convert(customView.descriptionTextView.bounds, to: self.view).maxY
        let topOfKeyboard = self.view.frame.height - keyboardSize.height
        
        if bottomOfTextView > topOfKeyboard && customView.descriptionTextView.isFirstResponder == true {
            guard let navController = self.navigationController else { return }
            let difference = bottomOfTextView - topOfKeyboard
            self.view.frame.origin.y = 0 - difference + navController.navigationBar.frame.height - 5
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let navController = self.navigationController else { return }
        self.view.frame.origin.y = navController.navigationBar.frame.height
    }
}
