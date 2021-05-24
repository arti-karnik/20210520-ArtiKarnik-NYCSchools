//
//  searchResult.swift
//  20210520-ArtiKarnik-NYCSchools
//
//  Created by Kedar Mohile on 5/23/21.
//  Copyright © 2021 Arti Karnik. All rights reserved.
//

import UIKit

class NYSchoolSearch: NSObject {
    func filterResults(_ searchText: String, _ array: [NYSchool]) -> [NYSchool] {
        var filtered: [NYSchool] = []
        if searchText.count == 0 {
            filtered = array
        }else{
            filtered = (array.filter({(school: NYSchool) -> Bool in
                return school.schoolName.lowercased().contains(searchText.lowercased())
            }))
        }
        return filtered
    }
}
