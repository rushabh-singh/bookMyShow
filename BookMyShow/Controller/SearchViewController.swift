//
//  SearchViewController.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 14/05/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    let SEARCH_CELL_IDENTIFIER = "SearchCellIdentifier"
    let SEARCH_CELL = "SearchTableViewCell"
    var recentSearchedMovies = [RecentSearchModel]()
    weak var delegate : SearchCellProtocol?
    @IBOutlet weak var searchResultTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchRecentSearchesFromCache()
    }
    
    private func setupTableView() {
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        let searchCellNib = UINib(nibName: SEARCH_CELL, bundle: nil)
        searchResultTableView.register(searchCellNib, forCellReuseIdentifier: SEARCH_CELL_IDENTIFIER)
    }
    
    private func fetchRecentSearchesFromCache() {
        let cacheHandler = RecentSearchCacheHandler()
        recentSearchedMovies = cacheHandler.getRecentSearchedMovies()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }    
}
