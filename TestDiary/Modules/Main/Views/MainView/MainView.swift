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
    
    private let separateLineView = SeparateView(withBackground: .systemGray)

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
        backgroundColor = .white

        calendar.appearance.headerTitleColor = .systemBlue
        calendar.appearance.weekdayTextColor = .systemBlue
        
        addSubviews([calendar, separateLineView, tableView])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([calendar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     calendar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     calendar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     calendar.heightAnchor.constraint(equalToConstant: self.frame.width * 0.65)])
        
        NSLayoutConstraint.activate([separateLineView.topAnchor.constraint(equalTo: calendar.bottomAnchor),
                                     separateLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     separateLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     separateLineView.heightAnchor.constraint(equalToConstant: 0.5)])
        
        NSLayoutConstraint.activate([tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     tableView.topAnchor.constraint(equalTo: separateLineView.bottomAnchor)])
    }
}
