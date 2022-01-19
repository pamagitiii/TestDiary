//
//  MainView.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//

import UIKit
import FSCalendar

class MainView: UIView {
    
    // MARK: - Properties
    private(set) lazy var calendar = FSCalendar()
    private(set) lazy var tableView = UITableView()

    private var didSetupConstraints = false
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func updateConstraints() {
        super.updateConstraints()

        if !didSetupConstraints {
            setupConstraints()
            didSetupConstraints = true
        }
    }
    
    // MARK: - Module functions
    private func setupViews() {

        calendar.appearance.headerTitleColor = .systemBlue
        calendar.appearance.weekdayTextColor = .systemBlue
        
        addSubviews([calendar, tableView])
    }

    private func setupConstraints() {
        //calendar constraints
        NSLayoutConstraint.activate([calendar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     calendar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     calendar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     calendar.heightAnchor.constraint(equalToConstant: self.frame.width * 0.65)])
        //tableView constraints
        NSLayoutConstraint.activate([tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     tableView.topAnchor.constraint(equalTo: calendar.bottomAnchor)])
    }
}
