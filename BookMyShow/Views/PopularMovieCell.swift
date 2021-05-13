//
//  PopularMovieCell.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit

class PopularMovieCell: UITableViewCell {
    
    @IBOutlet weak var votingCountLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var posterImage: LazyImageView!
    
    @IBOutlet weak var movieTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var movieViewModel : MovieViewModel!{
        didSet{
            movieNameLabel.text = movieViewModel.movieName
            movieTypeLabel.text = movieViewModel.movieType
            votingCountLabel.text = movieViewModel.voteCount
            releaseDateLabel.text = movieViewModel.releaseDate
            posterImage.loadImage(fromURL: movieViewModel.posterUrl, placeHolderImage: ImagesNameConstant.placeholder)
        }
    }
}
