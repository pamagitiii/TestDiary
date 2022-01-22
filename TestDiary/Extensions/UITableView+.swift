//
//  UITableView+.swift
//  TestDiary
//
//  Created by Anatoliy on 19.01.2022.
//

import UIKit

//MARK: - Reuse Identifire extension
protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UITableViewHeaderFooterView: ReuseIdentifiable {}

extension UITableView {
    func dequeueCell<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier,
                for: indexPath) as? T else {
            fatalError("can't dequeue")
        }
        return cell
    }

    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_ cellType: T.Type) {
        self.register(cellType, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueHeaderFooterViewCell<T: UITableViewHeaderFooterView>(cellType: T.Type) -> T {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else { fatalError("can't dequeue") }
        return cell
    }
}

//MARK: - Empty table view extension
extension UITableView {
    func showEmptyMessage(_ message: String) {
        let label: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textColor = .systemGray
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24, weight: .semibold)
            return label
        }()
        
        label.text = message
        self.backgroundView = label
        self.separatorStyle = .none
    }
    
    func hideEmptyMessage() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

