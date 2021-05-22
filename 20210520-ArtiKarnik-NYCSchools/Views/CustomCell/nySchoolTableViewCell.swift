//
//  nySchoolTableViewCell.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/21/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit

class nySchoolTableViewCell: UITableViewCell {

    @IBOutlet var schoolName: UILabel!
    @IBOutlet var schoolAddress: UILabel!
    @IBOutlet var schoolPhone: UILabel!
    @IBOutlet var website: UILabel!
    var cellContent: NYSchool!
    var test: String!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(_ nyschool: NYSchool) {
        schoolName.text = nyschool.schoolName
        schoolAddress.text = nyschool.address
        schoolPhone.text = nyschool.phone
        website.text = nyschool.dbn
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
