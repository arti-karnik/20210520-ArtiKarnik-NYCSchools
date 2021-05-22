//
//  HomeViewController.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/20/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit
import Foundation


class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tblView: UITableView!
    var nySchoolList: [NYSchool]?
    var nySAT: [NYSchool]?
    var modalObject: NYCSchoolModelView = NYCSchoolModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NYC School"
        tblView.delegate = self
        tblView.dataSource = self
        getSchoolData()
    }
    func getSchoolData() {
        let queue = OperationQueue()
        queue.addOperation { () -> Void in
            self.getdata()
        }
           
        queue.addOperation { () -> Void in
            self.getSATdata()
        }
    }
    func getdata() {
        modalObject.getSchoolList(global.schoolURL){
            (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async{
                    self.nySchoolList = data
                    self.tblView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func getSATdata() {
        modalObject.getSchoolList(global.satURL){
            (result) in
            switch result {
            case .success(let data):
                self.nySAT = data
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeViewController  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nySchoolList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! nySchoolTableViewCell
        cell.configure((self.nySchoolList?[indexPath.row])!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dbn = nySchoolList?[indexPath.row].dbn
        let dictionary = nySAT?.filter{ $0.dbn == dbn}
        let ctrl = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController
        ctrl?.nySAT = dictionary
        self.navigationController?.pushViewController(ctrl!, animated: true)
    }
}
