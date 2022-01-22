//
//  BaseTaskEditVC.swift
//  TestDiary
//
//  Created by Anatoliy on 22.01.2022.
//

import UIKit

class BaseTaskEditViewController: UIViewController, ViewToControllerOutput {
    let customView = NewTaskView()
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func inputValueChanged() {
    }
}

// MARK: - Keyboard show/hide logic
private extension BaseTaskEditViewController {
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
