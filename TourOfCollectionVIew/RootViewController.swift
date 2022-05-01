//
//  RootViewController.swift
//  TourOfCollectionVIew
//
//  Created by YJ.Lee on 2022/5/1.
//

import UIKit

class RootViewController: UITableViewController {
    var controllers:[UIViewController] = [
        AdaptableColumnController()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCellID")
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = "Tour Of CollectionView"
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controllers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = controllers[indexPath.row].description
        cell.contentConfiguration = config
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(controllers[indexPath.row], animated: true)
        
    }
}
