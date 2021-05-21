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
    var nySAT: [NYSAT]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NYC School"
        tblView.delegate = self
        tblView.dataSource = self
        getSchoolData()
        getSATData()
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
    func getSATData() {
           guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return }
           let task = URLSession.shared.dataTask(with: url) {(data,response, error) in
               if let data = data {
                   let decoder = JSONDecoder()
                   do {
                    let response = try decoder.decode([NYSAT].self, from: data)
                       self.nySAT = response
                    print(self.nySAT)
                        DispatchQueue.main.async {[weak self] in
                        }
                   } catch {
                    print("Parsing Failed")
                   }
               }
           }
           task.resume()
           
       }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nySchoolList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                            for: indexPath) as! nySchoolTableViewCell
      cell.configure((self.nySchoolList?[indexPath.row])!)
           
      return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dbn = nySchoolList?[indexPath.row].dbn
        
        let dictionary = nySAT?.filter{ $0.dbn == dbn}
        let ctrl = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController
        ctrl?.nySAT = dictionary

        self.navigationController?.pushViewController(ctrl!, animated: true)
        
        print("did select" , dictionary)
    }
}
