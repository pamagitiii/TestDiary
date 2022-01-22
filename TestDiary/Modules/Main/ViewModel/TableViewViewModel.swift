//
//  TableViewViewModel.swift
//  TestDiary
//
//  Created by Anatoliy on 19.01.2022.
//

import Foundation

struct SectionViewModel {
    let headetTitleText: String
    var cellViewModels: [CellViewModel]
}

struct CellViewModel {
    let id: Int
    let taskNameText: String
    let startDateText: String
    let endDateText: String
}
