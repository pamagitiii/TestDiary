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
    
    private var viewModels: [SectionViewModel] = []
    
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
        setupTableView()
        setupCalendar()
        setupNavigationBar()
        output.viewDidLoad(calendarToday: mainView.calendar.today ?? Date())
    }
}

extension MainViewController: MainViewInput {
    
    func set(viewModels: [SectionViewModel]) {
        self.viewModels = viewModels
        mainView.tableView.reloadData()
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
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = BlockBarButton(barButtonSystemItem: .add,
                                                           target: nil,
                                                           action: nil).withAction { [weak self] in
            self?.output.didTapAddButton()
        }
    }
}

// MARK: - TableView Delegate & DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModels.isEmpty {
            mainView.tableView.showEmptyMessage("No tasks for today")
        } else {
            mainView.tableView.hideEmptyMessage()
        }
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels[section].cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModels[section].headetTitleText
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainView.tableView.dequeueCell(cellType: TaskTableViewCell.self, for: indexPath)
        let cellViewModel = viewModels[indexPath.section].cellViewModels[indexPath.row]
        cell.update(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRowWith(id: viewModels[indexPath.section].cellViewModels[indexPath.row].id)
        mainView.tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - FSCalendar Delegate
extension MainViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        output.didSelectDate(date: date) //с календаря приходит дата с timezome GMT (UTC+0)
    }
}
