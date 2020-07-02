//
//  ViewController.swift
//  Fetcher
//
//  Created by Ali Hassan on 28/06/2020.
//  Copyright © 2020 Ali Hassan. All rights reserved.
//

import UIKit

protocol IViewController: class {
    func reloadTableView()
}

class ViewController: UIViewController {
    
    private var presenter: Presenter?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = Presenter()
        presenter?.view = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.musicItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicItemTableViewCell.IDENTIFIER, for: indexPath) as? MusicItemTableViewCell,
            let displayItem = presenter?.musicItems[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setupWithMusicItem(displayItem)
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchDidChange(searchText)
    }
    
}

extension ViewController: IViewController {
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}
