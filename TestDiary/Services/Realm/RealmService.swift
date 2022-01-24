//
//  RealmService.swift
//  TestDiary
//
//  Created by Anatoliy on 15.01.2022.
// swiftlint:disable force_try force_unwrapping no_direct_standard_out_logs

import Foundation
import RealmSwift
import CloudKit

final class RealmService {
    
    let realm = try! Realm()
    
    var notificationCenter: NotificationCenter?
    var notificationToken: NotificationToken?
    
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
    
    func deleteObjectByPrimaryKey<T: Object>(objecType: T.Type, primaryKey: Int) {
        do {
            try realm.write {
                guard let object = realm.object(ofType: T.self, forPrimaryKey: primaryKey) else { return }
                realm.delete(object)
            }
        } catch {
            print(RealmServiceErrors.objectsDeletingError)
        }
    }
    
    func fetchArrayOfObjects<T: Object>(objecType: T.Type) -> [T] {
        return Array(realm.objects(T.self))
    }
    
    func fetchSortedObjects<T: Object>(objecType: T.Type, keyPath: String, ascending: Bool) -> [T] {
        return Array(realm.objects(T.self).sorted(byKeyPath: keyPath, ascending: ascending))
    }
    
    func fetchObjectByPrimaryKey<T: Object>(objecType: T.Type, primaryKey: Int) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: primaryKey)
    }
}

enum RealmServiceErrors: Error, LocalizedError {
    
    case objectSavingError
    case objectsSavingError
    case objectsDeletingError
    
    var errorDescription: String? {
        switch self {
        case .objectSavingError:
            return "Cant save object"
        case .objectsSavingError:
            return "Cant save objects"
        case .objectsDeletingError:
            return "Cant delete objects"
        }
    }
}
