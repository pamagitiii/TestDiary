//
//  BaseRouter.swift
//  TestDiary
//
//  Created by Anatoliy on 10.01.2022.
//

import UIKit

class BaseRouter {
    
    var navigationControllerProvider: (() -> UINavigationController?)?
    var navigationController: UINavigationController? {
        self.navigationControllerProvider?()
    }
}
