//
//  SeparateView.swift
//  TestDiary
//
//  Created by Anatoliy on 06.02.2022.
//

import UIKit

final class SeparateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(withBackground color: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = color
    }
}
