//
//  DetailViewController.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/20/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var schoolName: UILabel!
    @IBOutlet var schoolDescription: UILabel!
    @IBOutlet var dbn: UILabel!
    @IBOutlet var criticalSATscore: UILabel!
    @IBOutlet var noOfSATtakers: UILabel!
    @IBOutlet var mathAvgSATscore: UILabel!
    @IBOutlet var writingAvgSATscore: UILabel!
    var nySAT: [NYSchool]?
    var nySchoolInfo: [NYSchool]?

    //MARK: ViewLoad methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        schoolName.text = nySchoolInfo?[0].schoolName
        self.navigationItem.title = nySchoolInfo?[0].schoolName
        if nySAT != nil && nySAT!.count > 0 {
            showdetails(nySAT!)
        }
    }
    
    //MARK: Show Details
    // Method to show details on Detail View controller
    func showdetails(_ nySAT: [NYSchool]) {
        print(nySAT)
        dbn.text = nySAT[0].dbn
        mathAvgSATscore.text = nySAT[0].SATmathAvgScore
        criticalSATscore.text = nySAT[0].SATcriticalReadingAvgScore
        noOfSATtakers.text = nySAT[0].SATtakers
        writingAvgSATscore.text = nySAT[0].SATwritingAvgScore
    }
    
    //MARK: Button Events
    // Method called when user clicks on 'Show Map' button
    @IBAction func showMap(_ sender: Any) {
    let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "MapView") as? MapViewController
        mapVC?.nySchoolInfo = nySchoolInfo
        self.navigationController?.pushViewController(mapVC!, animated: true)
    }
}
