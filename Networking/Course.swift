//
//  Course.swift
//  Networking
//
//  Created by BoDim on 29.04.2021.
//  Copyright © 2021 BoDim. All rights reserved.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}
