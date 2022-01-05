//
//  MainViewController.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import UIKit

final class MainViewController: UIViewController {
    
    private let output: MainViewOutput
    
    private let mainView = MainView()

//    var tableView: UITableView {
//        (self.view as? MainView)?.tableView ?? UITableView()
//    }
    
    // MARK: - Initialization
    init(output: MainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
          view = mainView
//        let view = MainView()
//        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
//        tableView.dataSource = self
//        tableView.delegate = self
    }
}

extension MainViewController: MainViewInput {
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
