//
//  ViewController.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let POPULAR_MOVIE_CELL_IDENTIFIER = "PopularMovieCellIdentifier"
    let POPULAR_MOVIE_CELL = "PopularMovieCell"
    @IBOutlet weak var popularMoviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        downloadData()
    }
    
    private func downloadData(){
        
    }
    
    private func setupTableView() {
        popularMoviesTableView.delegate = self
        popularMoviesTableView.dataSource = self
        let popularMovieNib = UINib(nibName: POPULAR_MOVIE_CELL, bundle: nil)
        popularMoviesTableView.register(popularMovieNib, forCellReuseIdentifier: POPULAR_MOVIE_CELL_IDENTIFIER)
    }
}

