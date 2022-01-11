//
//  NewTaskViewController.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//

import UIKit

final class NewTaskViewController: UIViewController {
    private let output: NewTaskViewOutput
    private let customView = NewTaskView()
    
    init(output: NewTaskViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New task"
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationItem.rightBarButtonItem = BlockBarButtonItem.item(style: .save, handler: { [weak self] in
            self?.output.onDoneTap()
        })
    }
}

private extension NewTaskViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let bottomOfTextView = customView.descriptionTextView.convert(customView.descriptionTextView.bounds, to: self.view).maxY
        let topOfKeyboard = self.view.frame.height - keyboardSize.height
        
        if bottomOfTextView > topOfKeyboard && customView.descriptionTextView.isFirstResponder == true {
            guard let navController = self.navigationController else { return }
            self.view.frame.origin.y = 0 - keyboardSize.height * 0.3 + navController.navigationBar.frame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let navController = self.navigationController else { return }
        self.view.frame.origin.y = navController.navigationBar.frame.height
    }
}

extension NewTaskViewController: NewTaskViewInput {
}
