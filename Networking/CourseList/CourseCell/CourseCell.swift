//
//  CourseCell.swift
//  Networking
//
//  Created by BoDim on 21/08/2019.
//  Copyright © 2019 BoDim. All rights reserved.
//

import UIKit
import Foundation

class CourseCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTests.text = "Number of tests: \(course.numberOfTests)"
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf:  course.imageUrl) else { return }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
        
    }
}
