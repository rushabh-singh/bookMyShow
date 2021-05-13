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
    let imageCache = NSCache<AnyObject, UIImage>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func designMovieCell(movie : Result){
        let imageUrl = URL(string: APIConstants.ImageBaseUrl + ImageSizeConstant.smallImageSize + (movie.posterPath))!
        self.posterImage.loadImage(fromURL: imageUrl, placeHolderImage: ImagesNameConstant.placeholder)
        movieNameLabel.text = movie.title
        votingCountLabel.text = String(movie.voteCount)
        releaseDateLabel.text = movie.releaseDate
    }
    
//  func loadImage(fromFilePath filePath: String){
//        if !(filePath.isEmpty) {
//            let imageUrl = URL(string: APIConstants.ImageBaseUrl + ImageSizeConstant.smallImageSize + (filePath))!
//            if let cachedImage = self.imageCache.object(forKey: filePath as AnyObject){
//                DispatchQueue.main.async {
//                    self.posterImage.image = cachedImage
//                }
//            }else{
//                self.posterImage.image = UIImage(named: ImagesNameConstant.placeholder)
//                DispatchQueue.global().async { [weak self] in
//                    if let imageData = try? Data(contentsOf: imageUrl){
//                        if let image = UIImage(data: imageData){
//                            DispatchQueue.main.async {
//                                self!.imageCache.setObject(image, forKey: filePath as AnyObject)
//                                self?.posterImage.image = image
//                            }
//                        }
//                    }
//                }}
//        }else{
//            self.posterImage.image = UIImage(named: ImagesNameConstant.placeholder)
//        }
//    }

}
