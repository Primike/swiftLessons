//
//  UserDefaults+Extension.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 3/17/23.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case switchIsOn
        case signedInUser
    }
    
    var switchIsOn: Bool {
        get {
            bool(forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
    }
    
    var signedInUser: UDUser? {
        get {
            if let data = object(forKey: UserDefaultsKeys.signedInUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(UDUser.self, from: data)
                return user
            }
            return nil
        }
        
        set {
            if newValue == nil {
                removeObject(forKey: UserDefaultsKeys.signedInUser.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultsKeys.signedInUser.rawValue)
            }
        }
    }
}


//struct UserDefaultsManager {
//    static let shared = UserDefaultsManager()
//
//    static let userDefaults = UserDefaults()
//
//    private init() {}
//
//    private enum UserDefaultsKeys: String {
//        case switchIsOn
//        case signedInUser
//    }
//
//    var signedInUser: UDUser {
//        get {
//            userDefaults.bool(forKey: UserDefaultsKeys.switchIsOn.rawValue)
//        }
//
//        set {
//            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.switchIsOn.rawValue)
//        }
//    }
//}
