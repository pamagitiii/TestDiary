//
//  CellDateLabel.swift
//  TestDiary
//
//  Created by Anatoliy on 06.02.2022.
//

import UIKit

final class CellDateLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = UIColor.systemGray
        font = .systemFont(ofSize: 12, weight: .light)
        numberOfLines = 1
        minimumScaleFactor = 0.5
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
