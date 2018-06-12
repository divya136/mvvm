//
//  moviewClient.swift
//  TopMovies
//
//  Created by Guna Sundari on 12/06/18.
//  Copyright © 2018 Guna Sundari. All rights reserved.
//

import UIKit

class moviewClient: NSObject {

    
    func fetchMovies ( completion : @escaping (_ movies : [NSDictionary]?) -> ())
    {
        // Set up the URL request
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let urlRequest = NSURL(string: urlString)!

//        let session = NSURLSession(configuration : NSURLSessionConfiguration.defaultSessionConfiguration()
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // make the request
        let task = session.dataTask(with: urlRequest as URL, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            
            if error != nil
            {
                completion(nil)
                return
            }
            print(error)
            print(response)
            
            var jsonError = NSError?.self
            if let json = try? JSONSerialization.jsonObject(with: data!,options: .allowFragments) as? NSDictionary
            {
                if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary]
                {
                    completion(movies)
                    return
                }
            }
            
        })
        task.resume()
    }
}
