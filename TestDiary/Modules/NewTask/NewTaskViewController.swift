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
        navigationItem.rightBarButtonItem = BlockBarButtonItem.item(style: .done, handler: { [weak self] in
            self?.output.onDoneTap()
        })
	}
    
}

extension NewTaskViewController: NewTaskViewInput {
}
