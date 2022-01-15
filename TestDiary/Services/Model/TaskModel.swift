//
//  TaskModel.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation
import RealmSwift

class Task: Object, Decodable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var dateStart: Date
    @Persisted var dateFinish: Date
    @Persisted var name: String
    @Persisted var taskDescription: String?
    
    convenience init(id: Int, name: String, dateStart: Date, dateFinish: Date, taskDescription: String?) {
        self.init()
        self.id = id
        self.name = name
        self.dateStart = dateStart
        self.dateFinish = dateFinish
        self.taskDescription = taskDescription
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case name
        case taskDescription = "description"
    }
}
