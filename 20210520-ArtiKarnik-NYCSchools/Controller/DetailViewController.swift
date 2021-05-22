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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
    override func viewWillAppear(_ animated: Bool) {
        if nySAT != nil && nySAT!.count > 0 {
            showdetails(nySAT!)
        }
    }
    
    func showdetails(_ nySAT: [NYSchool]) {
        print(nySAT)
        dbn.text = nySAT[0].dbn
        schoolName.text = nySAT[0].schoolName
        schoolDescription.text = nySAT[0].description
        mathAvgSATscore.text = nySAT[0].SATmathAvgScore
        criticalSATscore.text = nySAT[0].SATcriticalReadingAvgScore
        noOfSATtakers.text = nySAT[0].SATtakers
        writingAvgSATscore.text = nySAT[0].SATwritingAvgScore
    }
}
