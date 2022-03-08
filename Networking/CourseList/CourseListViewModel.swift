//
//  CourseListViewModel.swift
//  Networking
//
//  Created by  BoDim on 04.03.2022.
//  Copyright © 2022 BoDim. All rights reserved.
//

import Foundation

protocol CourseListViewModelProtocol: AnyObject {
    var courses: [Course] { get }
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol
    func detailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol
}

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { courses in
            self.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol {
        let course = courses[indexPath.row]
        return CourseCellViewModel(course: course)
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol {
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
}
