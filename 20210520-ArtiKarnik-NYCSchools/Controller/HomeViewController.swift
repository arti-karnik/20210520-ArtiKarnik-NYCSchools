//
//  HomeViewController.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/20/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit
import Foundation


class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    var searching = false
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tblView: UITableView!

    var nySchoolList: [NYSchool]?
    var nySAT: [NYSchool]?
    var searchResults: [NYSchool]?

    var modalObject: NYCSchoolModelView = NYCSchoolModelView()
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        activityIndicator.color = .black
        self.view.addSubview(activityIndicator)
        
        super.viewDidLoad()
        self.navigationItem.title = "NYC School"
        tblView.delegate = self
        tblView.dataSource = self
        searchBar.delegate = self
        tblView.rowHeight = UITableView.automaticDimension
        getSchoolData()
    }
    func getSchoolData() {
        self.getdata()
        self.getSATdata()
    }
    func getdata() {
        modalObject.fetchData(global.schoolURL){  (result) in
            switch result {
                case .success(let data):
                    DispatchQueue.main.async{
                        self.nySchoolList = data
                        self.tblView.reloadData()
                        self.activityIndicator.stopAnimating()
                    }
                case .failure(let error):
                    self.alert(error.localizedDescription)
                    print(error.localizedDescription)
            }
        }
    }
    func getSATdata() {
        modalObject.fetchData(global.satURL){
            (result) in
            switch result {
                case .success(let data):
                    self.nySAT = data
                
                case .failure(let error):
                    self.alert(error.localizedDescription)
                    print(error.localizedDescription)
            }
        }
    }
    func alert(_ message:String?) {
        let alert = UIAlertController(title: "Alert" , message: message ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchResults?.count ?? 0
        } else {
            return nySchoolList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! nySchoolTableViewCell
        if searching {
            cell.configure((self.searchResults?[indexPath.row])!)
        }else {
            cell.configure((self.nySchoolList?[indexPath.row])!)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dbn = nySchoolList?[indexPath.row].dbn
        let dictionary = nySAT?.filter{ $0.dbn == dbn}
        let schoolInfo = nySchoolList?.filter{ $0.dbn == dbn}
        print(schoolInfo)
        let ctrl = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController
        ctrl?.nySAT = dictionary
        ctrl?.nySchoolInfo = schoolInfo
        self.navigationController?.pushViewController(ctrl!, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        searchResults = nySchoolList?.filter{ $0.schoolName.contains(searchText) }
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        tblView.reloadData()
        searchBar.resignFirstResponder()
    }
}
