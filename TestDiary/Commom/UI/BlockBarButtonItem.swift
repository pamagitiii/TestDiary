//
//  BlockBarButtonItem.swift
//  TestDiary
//
//  Created by Anatoliy on 10.01.2022.
//

import UIKit

class BlockBarButtonItem: UIBarButtonItem {
    
    private var handler: VoidClosure?
    
    static func item(style: UIBarButtonItem.SystemItem, handler: @escaping VoidClosure) -> UIBarButtonItem {
        let result = BlockBarButtonItem(barButtonSystemItem: style, target: nil, action: nil)
        result.handler = handler
        result.action = #selector(onTap)
        return result
    }
    
    @objc private func onTap() {
        self.handler?()
    }
}
