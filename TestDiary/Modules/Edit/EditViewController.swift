//
//  EditViewController.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import UIKit

final class EditViewController: BaseTaskEditViewController {
    
    private let output: EditViewOutput
    
    init(output: EditViewOutput) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func inputValueChanged(name: String, startDate: Date, endDate: Date, description: String?) {
        super.inputValueChanged(name: name, startDate: startDate, endDate: endDate, description: description)
        output.checkSaveButtonState(inputValue: self.viewValues)
    }
}
// MARK: - View Input
extension EditViewController: EditViewInput {
    func updateViewWith(viewModel: EditTaskViewModel) {
        setupWithViewModel(viewModel: viewModel)
    }
    
    func changeSaveButtonState(isEnabled: Bool) {
        navigationItem.rightBarButtonItems?[0].isEnabled = isEnabled
    }
}

private extension EditViewController {
    func setupNavigationBar() {
        navigationItem.title = "Edit task"

        navigationItem.leftBarButtonItem = BlockBarButton(barButtonSystemItem: .close,
                                                          target: nil,
                                                          action: nil).withAction { [weak self] in
            self?.output.onCloseTap()
        }
   
        let saveBarButton = BlockBarButton(barButtonSystemItem: .save,
                                           target: nil,
                                           action: nil).withAction { [weak self] in
            guard let editedTaskViewModel = self?.viewValues else { return }
            self?.output.onSaveTap(editedTaskViewModel: editedTaskViewModel)
        }

        let deleteBarButton = BlockBarButton(barButtonSystemItem: .trash,
                                             target: nil,
                                             action: nil).withAction { [weak self] in
            self?.output.onDeleteTap()
          }
        
        navigationItem.rightBarButtonItems = [saveBarButton, deleteBarButton]
        navigationItem.rightBarButtonItems?[0].tintColor = .systemGreen
        navigationItem.rightBarButtonItems?[0].isEnabled = false
        navigationItem.rightBarButtonItems?[1].tintColor = .systemRed
    }
}
