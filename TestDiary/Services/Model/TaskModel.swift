//
//  TaskModel.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation
import RealmSwift

class Task: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var dateStart: Date
    @objc dynamic var dateFinish: Date
    @objc dynamic var name: String
    @objc dynamic var taskDescription: String?
    
    static override func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case name
        case taskDescription = "description"
    }
}
