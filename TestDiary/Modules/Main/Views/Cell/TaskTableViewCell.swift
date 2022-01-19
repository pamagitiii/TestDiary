//
//  TaskTableViewCell.swift
//  TestDiary
//
//  Created by Anatoliy on 19.01.2022.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let separeteLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let endLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(label: String, startDateText: String, endDateText: String) {
        self.label.text = label
        self.startLabel.text = startDateText
        self.endLabel.text = endDateText
    }
}

private extension TaskTableViewCell {
    func setupView() {
        
        contentView.addSubviews([label, arrowImageView, separeteLine, startLabel, endLabel])
        
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                                     label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)])
        
        NSLayoutConstraint.activate([arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     arrowImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
                                     arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor),
                                     arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)])
        
        NSLayoutConstraint.activate([arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     arrowImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
                                     arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor),
                                     arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)])

        NSLayoutConstraint.activate([separeteLine.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     separeteLine.heightAnchor.constraint(equalToConstant: 0.5),
                                     separeteLine.widthAnchor.constraint(equalToConstant: 70),
                                     separeteLine.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -1)])
        
        NSLayoutConstraint.activate([startLabel.centerXAnchor.constraint(equalTo: separeteLine.centerXAnchor),
                                     startLabel.heightAnchor.constraint(equalToConstant: 20),
                                     startLabel.widthAnchor.constraint(equalTo: separeteLine.widthAnchor),
                                     startLabel.bottomAnchor.constraint(equalTo: separeteLine.topAnchor, constant: 1)])
        
        NSLayoutConstraint.activate([endLabel.centerXAnchor.constraint(equalTo: separeteLine.centerXAnchor),
                                     endLabel.heightAnchor.constraint(equalToConstant: 20),
                                     endLabel.widthAnchor.constraint(equalTo: separeteLine.widthAnchor),
                                     endLabel.topAnchor.constraint(equalTo: separeteLine.bottomAnchor, constant: -1)])
        
        NSLayoutConstraint.activate([label.trailingAnchor.constraint(equalTo: separeteLine.leadingAnchor, constant: -1)])
    }
}
