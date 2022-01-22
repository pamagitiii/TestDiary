//
//  RealmService.swift
//  TestDiary
//
//  Created by Anatoliy on 15.01.2022.
// swiftlint:disable force_try force_unwrapping no_direct_standard_out_logs

import Foundation
import RealmSwift

final class RealmService {
    
    let realm = try! Realm()
    
    var notificationCenter: NotificationCenter = NotificationCenter.default
    var notificationToken: NotificationToken?
    
    init() {
        subscribeToTasksNotifications()
    }

    func saveToRealm<T: Object>(_ objects: [T]?, _ object: T?) {
        
        if objects != nil {
            do {
                try realm.write {
                    realm.add(objects!, update: .modified)
                }
            } catch {
                print(RealmServiceErrors.objectsSavingError)
            }
        } else if object != nil {
            do {
                try realm.write {
                    realm.add(object!, update: .modified)
                }
            } catch {
                print(RealmServiceErrors.objectSavingError)
            }
        } else {
            return
        }
    }
}

enum RealmServiceErrors: Error, LocalizedError {
    
    case objectSavingError
    case objectsSavingError
    
    var errorDescription: String? {
        switch self {
        case .objectSavingError:
            return "Cant save object"
        case .objectsSavingError:
            return "Cant save objects"
        }
    }
}
