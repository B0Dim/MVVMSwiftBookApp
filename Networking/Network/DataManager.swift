//
//  DataManager.swift
//  Networking
//
//  Created by  BoDim on 04.03.2022.
//  Copyright © 2022 BoDim. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
