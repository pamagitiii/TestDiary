//
//  MainViewController.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
// swiftlint:disable no_direct_standard_out_logs

import UIKit
import FSCalendar

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
        setupTableView()
        setupCalendar()
   
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "12:00 - 13:00"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainView.tableView.dequeueCell(cellType: TaskTableViewCell.self, for: indexPath)
        cell.update(label: "Выгулять собачку", startDateText: "12 jan. 12:00", endDateText: "15 jan. 12:44")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        let header: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView ?? UITableViewHeaderFooterView()
//    }
}

extension MainViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        output.didSelectDate(date: date) //с календаря приходит дата с timezome GMT (UTC+0)
    }
}

// MARK: - Private extension
private extension MainViewController {
    func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.showsVerticalScrollIndicator = false
        mainView.tableView.register(TaskTableViewCell.self)
    }
    
    func setupCalendar() {
        mainView.calendar.delegate = self
    }
}

// шрифт для хедера таблицы - <UICTFont: 0x7f9cf1d31500> font-family: "UICTFontTextStyleHeadline"; font-weight: bold; font-style: normal; font-size: 17.00pt
//стандартная высота ячейки = 44 поинта
