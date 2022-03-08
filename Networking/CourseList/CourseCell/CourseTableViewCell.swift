//
//  CourseTableViewCell.swift
//  Networking
//
//  Created by  BoDim on 04.03.2022.
//  Copyright © 2022 BoDim. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    var viewModel: CourseCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.courseName
            guard let imageData = viewModel.imageData else { return }
            content.image = UIImage(data: imageData)
            contentConfiguration = content
        }
    }
}
