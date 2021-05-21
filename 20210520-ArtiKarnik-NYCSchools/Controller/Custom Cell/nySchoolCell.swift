import UIKit

class nySchoolCell: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var schoolName: UILabel!
    @IBOutlet var schoolAddress: UILabel!
    @IBOutlet var schoolPhone: UILabel!
    @IBOutlet var website: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardViewShadows()
    }
    
    func setupCardViewShadows(){
        let view = cellView
        view?.layer.cornerRadius = 15.0
        view?.layer.masksToBounds = false
    }
}
