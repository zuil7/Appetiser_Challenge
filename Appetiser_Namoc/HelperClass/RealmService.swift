//
//  RealmService.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 26/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import RealmSwift

typealias RealmObjectResult<T> = ((_ ObjectResult : T) -> Void)

class RealmServices {
    
    private init() {}
    static let shared = RealmServices()
    var realm = try! Realm()
    
    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
    func observeRealmErrors(in vc: UIViewController, completion: @escaping (Error?) -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"),
                                               object: nil,
                                               queue: nil) { (notification) in
                                                completion(notification.object as? Error)
        }
    }
    
    func stopObservingErrors(in vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }
    //Save Object
    func saveRealm<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            post(error)
        }
    }
    //Update Object
    func updateRealm<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            post(error)
        }
    }
    //Delete Object
    func deleteRealm<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            post(error)
        }
    }
    // MARK: Method
    //Clear MediaSelected Object
    func clearUserSelected(){
        do {
            try realm.write {
                realm.delete(realm.objects(MediaSelected.self))
            }
        } catch {
            post(error)
        }
    }
    
    //Get MediaSelected Object the user selected last
    func getUserSelected(result: @escaping RealmObjectResult<MediaSelected>){
        let queryMediaSelected = realm.objects(MediaSelected.self)
        if queryMediaSelected.count != 0{
            result(queryMediaSelected[0])
        }

    }
    
}
