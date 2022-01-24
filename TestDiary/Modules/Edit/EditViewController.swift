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
    
    // MARK: - Life cy
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func inputValueChanged() {
    }
}
// MARK: - View Input
extension EditViewController: EditViewInput {
    func updateViewWith(viewModel: EditTaskViewModel) {
        setupWithViewModel(viewModel: viewModel)
    }
    
//    func changeSaveButtonState(isEnabled: Bool) {
//        navigationItem.rightBarButtonItem?.isEnabled = isEnabled
//    }
}

private extension EditViewController {
    func setupNavigationBar() {
        
        navigationItem.title = "Edit task"
        
        navigationItem.leftBarButtonItem = BlockBarButtonItem.item(style: .close, handler: { [weak self] in
            self?.output.onCloseTap()
        })
        navigationItem.leftBarButtonItem?.tintColor = .systemBlue
        
        let doneBarButton = BlockBarButtonItem.item(style: .save, handler: { [weak self] in
        })
        
        let deleteBarButton = BlockBarButtonItem.item(style: .trash, handler: { [weak self] in
            self?.output.onDeleteTap()
        })
        
        navigationItem.rightBarButtonItems = [doneBarButton, deleteBarButton]
        navigationItem.rightBarButtonItems?[0].tintColor = .systemGreen
        navigationItem.rightBarButtonItems?[0].isEnabled = false
        navigationItem.rightBarButtonItems?[1].tintColor = .systemRed
    }
}
