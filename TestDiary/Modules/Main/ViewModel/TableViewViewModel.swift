//
//  TableViewViewModel.swift
//  TestDiary
//
//  Created by Anatoliy on 19.01.2022.
//

import Foundation

struct SectionViewModel {
    let headetTitleText: String
    let cellViewModels: [CellViewModel]
}

struct CellViewModel {
    let id: Int
    let taskNameText: String
    let statDateText: String
    let endDateText: String
}
