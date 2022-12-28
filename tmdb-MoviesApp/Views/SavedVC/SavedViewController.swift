//
//  SavedViewController.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 28.12.2022.
//

import UIKit

class SavedViewController: UIViewController {
    
    @IBOutlet weak var savedMovieTableView: UITableView!
    
    lazy public var favArr = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        savedMovieTableView.register(SavedTableViewCell.self, forCellReuseIdentifier: "SavedTableViewCellID")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        favArr = CoreDataHandler.shared.savedArr
        savedMovieTableView.reloadData()
    }
    func configure(){
        savedMovieTableView.delegate = self
        savedMovieTableView.dataSource = self
    }
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedMovieTableView.dequeueReusableCell(withIdentifier: "SavedTableViewCellID", for: indexPath) as! SavedTableViewCell
        cell.setCell(movie: favArr[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        savedMovieTableView.deselectRow(at: indexPath, animated: true)
        if let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil) as? DetailViewController {
            detailsVC.titleLabel.text = favArr[indexPath.row].title
            detailsVC.overviewTextView.text = favArr[indexPath.row].overview
            detailsVC.voteLabel.text = "\(favArr[indexPath.row].voteAverage)"
            detailsVC.popularLabel.text = "\(favArr[indexPath.row].popularity)"
            let urlString = "https://image.tmdb.org/t/p/w185\(favArr[indexPath.row].backdropPath ?? "")"
            detailsVC.imageView.sd_setImage(with: URL(string: urlString))
            detailsVC.rdLabel.text = "\(favArr[indexPath.row].releaseDate)"
        }
    }
    
}