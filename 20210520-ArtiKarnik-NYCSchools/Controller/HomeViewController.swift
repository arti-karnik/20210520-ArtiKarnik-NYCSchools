//
//  HomeViewController.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/20/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tblView: UITableView!
    var nySchoolList: [NYSchool]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NYC School"
        tblView.delegate = self
        tblView.dataSource = self
        getSchoolData()
    }
    func getSchoolData() {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { return }
        let task = URLSession.shared.dataTask(with: url) {(data,response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                 let response = try decoder.decode([NYSchool].self, from: data)
                    self.nySchoolList = response
                     DispatchQueue.main.async {[weak self] in
                        self?.tblView.reloadData()
                     }
                } catch {
                 print("Parsing Failed")
                }
            }
        }
        task.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nySchoolList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // let object: NYCSchoolModelView = dataObject.arrNYCSchools[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as? nySchoolCell {
                cell.dataObject = nySchoolList
                return cell
            }
            return UITableViewCell()
    }
}
