//
//  DetailViewController.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/20/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var dbn: UILabel!
    @IBOutlet var criticalSATscore: UILabel!
    @IBOutlet var noOfSATtakers: UILabel!
    @IBOutlet var mathAvgSATscore: UILabel!
    @IBOutlet var writingAvgSATscore: UILabel!
    @IBOutlet var schoolName: UILabel!
    var nySAT: [NYSAT]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
    override func viewWillAppear(_ animated: Bool) {
        if nySAT != nil && nySAT!.count > 0 {
            showdetails(nySAT!)
        }
    }
    
    func showdetails(_ nySAT: [NYSAT]) {
        print("in details")
        print(nySAT)
        dbn.text = nySAT[0].dbn
        schoolName.text = nySAT[0].schoolName
        mathAvgSATscore.text = nySAT[0].SATmathAvgScore
        criticalSATscore.text = nySAT[0].SATcriticalReadingAvgScore
        noOfSATtakers.text = nySAT[0].SATtakers
        writingAvgSATscore.text = nySAT[0].SATwritingAvgScore
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
