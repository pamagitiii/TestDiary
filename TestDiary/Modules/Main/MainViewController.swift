//
//  MainViewController.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
// swiftlint:disable no_direct_standard_out_logs

import UIKit
import FSCalendar
import SwiftUI

final class MainViewController: UIViewController {
    
    private let output: MainViewOutput
    private let mainView = MainView()
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        mainView.calendar.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        
        navigationItem.rightBarButtonItem = BlockBarButtonItem.item(style: .add, handler: { [weak self] in
            self?.output.didTapAddButton()
        })
        
        output.viewDidLoad()
    }
}

extension MainViewController: MainViewInput {
    
}

// MARK: - TableView Delegate & DataSource
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
    }
}

extension MainViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        
        
        print("------------------------------")
        print("дата с календаря")
        print(date)
        print("реальная дата")
        print(date.convertToTimeZone(initTimeZone: TimeZone(abbreviation: "GMT")!, timeZone: TimeZone(abbreviation: "UTC+3")!))
        print("------------------------------дата с календаря")
        
        output.didSelectDate(date: date)
        
        
//        output.didSelectDate(date: date.convertToTimeZone(initTimeZone: TimeZone(abbreviation: "UTC-3")!, timeZone: TimeZone(abbreviation: "GMT")!))
    }
}

// MARK: - Private extension
private extension MainViewController {
}
