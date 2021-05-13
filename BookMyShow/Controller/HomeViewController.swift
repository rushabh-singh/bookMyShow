//
//  ViewController.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    var moviesList : [MovieViewModel]?
    let POPULAR_MOVIE_CELL_IDENTIFIER = "PopularMovieCellIdentifier"
    let POPULAR_MOVIE_CELL = "PopularMovieCell"
    @IBOutlet weak var popularMoviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Popular Movies"
        setupTableView()
        downloadMoviesList()
    }
    
    private func setupTableView() {
        popularMoviesTableView.delegate = self
        popularMoviesTableView.dataSource = self
        let popularMovieNib = UINib(nibName: POPULAR_MOVIE_CELL, bundle: nil)
        popularMoviesTableView.register(popularMovieNib, forCellReuseIdentifier: POPULAR_MOVIE_CELL_IDENTIFIER)
    }
    
    private func downloadMoviesList(){
        let urlString = APIConstants.PopularMoviesListUrl
        HttpUtil.shared.getData(urlString: urlString, responseType: PopularMoviesModel.self) { (response) in
            if response?.results.count ?? 0 > 0 {
                DispatchQueue.main.async {
                    self.moviesList = response?.results.map({
                        return MovieViewModel(movie : $0)
                    })
                    self.popularMoviesTableView.reloadData()
                }
            }else{
                //handle when no movies present
                DispatchQueue.main.async {
                    self.popularMoviesTableView.isHidden = true
                }
            }
        }
    }
    
    
}

