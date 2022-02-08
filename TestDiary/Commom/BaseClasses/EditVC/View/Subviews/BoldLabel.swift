//
//  BoldLabel.swift
//  TestDiary
//
//  Created by Anatoliy on 07.02.2022.
//

import UIKit

final class BoldUILabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .boldSystemFont(ofSize: 17)
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
}
