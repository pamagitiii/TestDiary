//
//  MainVCMock.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 09.02.2022.
//

import Foundation
@testable import TestDiary

final class MainVCMock {
    var stubbedViewModelsArray: [SectionViewModel] = []
    var stubbedIsSet: Bool = false
}

extension MainVCMock: MainViewInput {
    func set(viewModels: [SectionViewModel]) {
        self.stubbedViewModelsArray = viewModels
        stubbedIsSet = true
    }
}
