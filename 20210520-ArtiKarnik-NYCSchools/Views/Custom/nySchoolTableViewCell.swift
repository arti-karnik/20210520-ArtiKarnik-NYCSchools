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
   
    override func awakeFromNib() {
        self.backgroundColor = .clear;
        self.contentView.layer.cornerRadius = 5;
        self.contentView.layer.masksToBounds = true;
        super.awakeFromNib()
    }
    func configure(_ nyschool: NYSchool) {
        schoolName.text = nyschool.schoolName
        schoolAddress.text = nyschool.fullAddress
        schoolPhone.text = nyschool.phone
        website.text = nyschool.website
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
