//
//  viewModel.swift
//  TopMovies
//
//  Created by Guna Sundari on 12/06/18.
//  Copyright © 2018 Guna Sundari. All rights reserved.
//

import UIKit

class viewModel: NSObject {
    @IBOutlet var moviesClient : moviewClient!
    var movies : [NSDictionary] = []
    func fetchMovies(completion: @escaping () -> () ) {
        moviesClient.fetchMovies {
            movies in
            self.movies = movies!
            completion()
        }
    }
    
    func numberOfItemsInSection(section : Int) -> Int
    {
        //return 10
        return movies.count ?? 0
    }
    
    func titleForItemAtIndexPath(indexPath : NSIndexPath) -> String
    {
        //return "hi"
        return (movies[indexPath.row].value(forKeyPath: "im:name.label") as? String)! ?? ""
    }
}
