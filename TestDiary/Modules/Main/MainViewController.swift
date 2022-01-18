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
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "12:00 - 13:00"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        cell.detailTextLabel?.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.numberOfLines = 1
        cell.textLabel?.minimumScaleFactor = 11
        
        
        print(cell.textLabel?.adjustsFontSizeToFitWidth)
        print(cell.textLabel?.font.pointSize)
        
        cell.textLabel?.text = "Выгулять собачку собачку собачку"
        cell.detailTextLabel?.text = "12:00 - 13:45"
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 5
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension MainViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
        
//        print("------------------------------")
//        print("дата с календаря")
//        print(date)
//        print("реальная дата")
//        print(date.convertToTimeZone(initTimeZone: TimeZone(abbreviation: "GMT")!, timeZone: TimeZone(abbreviation: "UTC+3")!))
//        print("------------------------------дата с календаря")
        
        output.didSelectDate(date: date)

    }
}

// MARK: - Private extension
private extension MainViewController {
}
