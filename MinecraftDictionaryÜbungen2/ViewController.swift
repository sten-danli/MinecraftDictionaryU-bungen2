//
//  ViewController.swift
//  MinecraftDictionaryÜbungen2
//
//  Created by Dan Li on 30.07.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableData:[ModelData]=[]
    var filteredArray=[ModelData]()
    var shouldSchowSearchResults=false
    
    var searchController:UISearchController!

    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet var infoView: UIView!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var infoNameLabel: UILabel!
    
    @IBOutlet weak var dimView: UIView!
    
    
    @IBAction func closeInfoPopup(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.dimView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }) { (success) in
            self.infoView.removeFromSuperview()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
        
        Data.getData { (data) in
            self.tableData=data
            self.TableView.reloadData()
        }
        TableView.delegate=self
        TableView.dataSource=self
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate{
    
    func configureSearchController(){
        searchController=UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater=self
        searchController.dimsBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Search here..."
        searchController.searchBar.delegate=self
        searchController.searchBar.sizeToFit()
        
        TableView.tableHeaderView = searchController.searchBar
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldSchowSearchResults = true
        TableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldSchowSearchResults = false
        TableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldSchowSearchResults{
            shouldSchowSearchResults = true
            TableView.reloadData()
        }
        searchController.searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText=searchController.searchBar.text, searchText != "" {
            filteredArray=tableData.filter{ data in
                return data.name.lowercased().contains(searchText.lowercased())
            }
        }else{
            
            filteredArray=tableData
        }
        TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if shouldSchowSearchResults == true {
            let filteredDate=filteredArray[indexPath.row]
            infoImage.image=filteredDate.image
            infoNameLabel.text=filteredDate.name
            infoView.center=view.center
            view.addSubview(infoView)
        }else{
             let data=tableData[indexPath.row]
            infoImage.image=data.image
            infoNameLabel.text=data.name
            infoView.center=view.center
            view.addSubview(infoView)
        }
        
        infoView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.dimView.alpha=0.8
            self.infoView.transform = .identity
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldSchowSearchResults{
            return filteredArray.count
        }else{
             return tableData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell") as! XTableViewCell
        if shouldSchowSearchResults{
            cell.setup(modeleData: filteredArray[indexPath.row])
        }else{
            cell.setup(modeleData: tableData[indexPath.row])
        }
        return cell
    }
}

