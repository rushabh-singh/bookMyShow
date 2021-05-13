//
//  ViewController.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    var moviesList : PopularMoviesModel?
    let POPULAR_MOVIE_CELL_IDENTIFIER = "PopularMovieCellIdentifier"
    let POPULAR_MOVIE_CELL = "PopularMovieCell"
    @IBOutlet weak var popularMoviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        downloadData()
    }
    
    private func downloadData(){
        let urlString = APIConstants.PopularMoviesListUrl
        HttpUtil.shared.getData(urlString: urlString, responseType: PopularMoviesModel.self) { (response) in
            if response != nil{
                DispatchQueue.main.async {
                    self.moviesList = response
                    self.popularMoviesTableView.reloadData()
                }
            }
            else{
                //handle when no movies present
            }
        }
        
    }
    
    private func setupTableView() {
        popularMoviesTableView.delegate = self
        popularMoviesTableView.dataSource = self
        let popularMovieNib = UINib(nibName: POPULAR_MOVIE_CELL, bundle: nil)
        popularMoviesTableView.register(popularMovieNib, forCellReuseIdentifier: POPULAR_MOVIE_CELL_IDENTIFIER)
    }
}

