//
//  ViewController.swift
//  TopMovies
//
//  Created by Guna Sundari on 12/06/18.
//  Copyright © 2018 Guna Sundari. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var viewmodel: viewModel!
    @IBOutlet var tableView : UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        return viewmodel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        configureCell(cell: cell,forRowAtIndexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        //cell.textLabel?.text = "hello"
        cell.textLabel?.text = viewmodel.titleForItemAtIndexPath(indexPath: indexPath)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel.fetchMovies {
            DispatchQueue.main.async() {
            self.tableView.reloadData()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

