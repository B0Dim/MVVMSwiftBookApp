//
//  CoursesViewController.swift
//  Networking
//
//  Created by BoDim on 21/08/2019.
//  Copyright © 2019 BoDim. All rights reserved.
//

import UIKit

class CoursesListViewController: UITableViewController {
       
    private var viewModel: CourseListViewModelProtocol! {
        didSet {
            viewModel.fetchCourses {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseListViewModel()
        tableView.rowHeight = 100
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        detailVC.viewModel = sender as? CourseDetailsViewModelProtocol
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsViewModel = viewModel.detailsViewModel(at: indexPath)
        performSegue(withIdentifier: "ShowDetails", sender: detailsViewModel)
    }
    

}
