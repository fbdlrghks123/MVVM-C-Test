//
//  LocalConfiguration.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/08/19.
//  Copyright © 2020 test. All rights reserved.
//

protocol ValueSettable {
    var value: Self { get }
}

extension ValueSettable {
    var value: Self { return self }
}

protocol PropertyGettable {
    associatedtype V
    var value: V { get }
}

extension Int: ValueSettable {}
extension Float: ValueSettable {}
extension Double: ValueSettable {}
extension Bool: ValueSettable {}
extension String: ValueSettable {}
extension Array: ValueSettable {}
extension Data: ValueSettable {}

class Property<P: ValueSettable>: PropertyGettable {
    let key: LocalConfigurationType
    
    init(key: LocalConfigurationType) {
        self.key = key
    }
    
    var value: P? {
        return LocalConfigurationType.sStorage.object(forKey: key.rawValue) as? P
    }
    
    func set(_ value: P) {
        LocalConfigurationType.sStorage.set(value.value, forKey: key.rawValue)
    }
    
    func clear() {
        LocalConfigurationType.sStorage.removeObject(forKey: key.rawValue)
    }
}

class LocalConfiguration {
    static let user = Property<String>(key: .user)
}

enum LocalConfigurationType: String {
    case user
}

extension LocalConfigurationType {
    static let kSuiteName: String = "LocalConfiguration"
    static let sStorage: UserDefaults = UserDefaults(suiteName: kSuiteName) ?? UserDefaults.standard
    
    func remove() {
        LocalConfigurationType.sStorage.removeObject(forKey: self.rawValue)
        LocalConfigurationType.sStorage.synchronize()
    }
    
    static func removeAll() {
        LocalConfigurationType.sStorage.removePersistentDomain(forName: kSuiteName)
        LocalConfigurationType.sStorage.synchronize()
    }
}
