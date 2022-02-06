//
//  NewTaskViewController.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//

import UIKit

final class NewTaskViewController: BaseTaskEditViewController {
    private let output: NewTaskViewOutput
    
    // MARK: - Init
    init(output: NewTaskViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func inputValueChanged(name: String, startDate: Date, endDate: Date, description: String?) {
        super.inputValueChanged(name: name, startDate: startDate, endDate: endDate, description: description)
        output.checkSaveButtonState(inputValue: self.viewValues)
    }
}

// MARK: - View Input
extension NewTaskViewController: NewTaskViewInput {
    func changeSaveButtonState(isEnabled: Bool) {
        navigationItem.rightBarButtonItem?.isEnabled = isEnabled
    }
}

private extension NewTaskViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "New task"
        
        navigationItem.rightBarButtonItem = BlockBarButton(barButtonSystemItem: .save,
                                                           target: nil,
                                                           action: nil).withAction { [weak self] in
            guard let newTaskViewModel = self?.viewValues else { return }
            self?.output.onSaveTap(newTaskViewModel: newTaskViewModel)
        }
        navigationItem.leftBarButtonItem = BlockBarButton(barButtonSystemItem: .cancel,
                                                          target: nil,
                                                          action: nil).withAction { [weak self] in
            self?.output.onCloseTap()
        }
        
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        navigationItem.leftBarButtonItem?.tintColor = .systemRed
    }
}

/*
 final class NewTaskViewController: UIViewController {
 private let output: NewTaskViewOutput
 let customView = NewTaskView()
 
 // MARK: - Init
 init(output: NewTaskViewOutput) {
 self.output = output
 super.init(nibName: nil, bundle: nil)
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
 navigationItem.title = "New task"
 
 NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
 NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
 
 navigationItem.rightBarButtonItem = BlockBarButtonItem.item(style: .save, handler: { [weak self] in
 self?.output.onSaveTap(taskName: self?.customView.taskName,
 startDate: self?.customView.startDate,
 endDate: self?.customView.endDate,
 taskDesription: self?.customView.taskDescription)
 })
 navigationItem.rightBarButtonItem?.tintColor = .systemGreen
 navigationItem.rightBarButtonItem?.isEnabled = false
 
 navigationItem.leftBarButtonItem = BlockBarButtonItem.item(style: .cancel, handler: { [weak self] in
 self?.output.onCloseTap()
 })
 navigationItem.leftBarButtonItem?.tintColor = .systemRed
 }
 }
 
 // MARK: - Keyboard show/hide logic
 private extension NewTaskViewController {
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
 
 extension NewTaskViewController: ViewToControllerOutput {
 func inputValueChanged() {
 output.checkSaveButtonState(startDate: customView.startDate, endDate: customView.endDate, taskName: customView.taskName)
 }
 }
 
 // MARK: - View Input
 extension NewTaskViewController: NewTaskViewInput {
 func changeSaveButtonState(isEnabled: Bool) {
 navigationItem.rightBarButtonItem?.isEnabled = isEnabled
 }
 
 }
 */
