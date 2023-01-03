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
    
    var detailViewModel : MovieDetailViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favArr = CoreDataHandler.shared.savedArr
        savedMovieTableView.reloadData()
    }
    
    func configure(){
        savedMovieTableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedTableViewCellID")
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
        //        cell.selectedMovie = favArr[indexPath.item]
        cell.setCell(movie: favArr[indexPath.item])
        print(favArr[indexPath.item])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        savedMovieTableView.deselectRow(at: indexPath, animated: true)
            let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
            detailsVC.selectedMovie = favArr[indexPath.row]
            self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
