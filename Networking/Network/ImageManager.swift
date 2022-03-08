//
//  ImageManager.swift
//  Networking
//
//  Created by  BoDim on 04.03.2022.
//  Copyright © 2022 BoDim. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageData(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf:  url) else { return nil }
        return imageData
    }
}
