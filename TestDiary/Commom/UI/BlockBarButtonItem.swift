//
//  BlockBarButtonItem.swift
//  TestDiary
//
//  Created by Anatoliy on 10.01.2022.
//

import UIKit

typealias VoidClosure = () -> Void

final class BlockBarButton: UIBarButtonItem {
    
    private var handler: VoidClosure?
    
    @objc private func onTap() {
        self.handler?()
    }
    
    func withAction(handler: @escaping VoidClosure) -> UIBarButtonItem {
        self.target = self
        self.handler = handler
        self.action = #selector(onTap)
        
        return self
    }
}
