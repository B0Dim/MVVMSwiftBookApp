//
//  CourseDetailsViewController.swift
//  Networking
//
//  Created by  BoDim on 04.03.2022.
//  Copyright © 2022 BoDim. All rights reserved.
//

import Foundation
import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private weak var courseNameLabel: UILabel!
    @IBOutlet private weak var numberOfLessonsLabel: UILabel!
    @IBOutlet private weak var numberOfTestsLabel: UILabel!
    @IBOutlet private weak var courseImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    var course: Course!
    var viewModel: CourseDetailsViewModelProtocol!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setFavoriteButton(with: viewModel.isFavorite.value)
        viewModel.isFavorite.bind { [weak self] value in
            self?.setFavoriteButton(with: value)
        }
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
    }
    
    @IBAction func toogleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    private func setFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
