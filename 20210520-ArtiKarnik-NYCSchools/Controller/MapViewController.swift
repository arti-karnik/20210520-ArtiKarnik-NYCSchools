import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var nySchoolInfo: [NYSchool]?
    var locationObj: location = location()

    @IBOutlet weak var Map: MKMapView! {
        didSet {
            Map.delegate = self
            Map.mapType = .standard
            Map.isPitchEnabled = false
            Map.isRotateEnabled = false
            Map.isScrollEnabled = true
            Map.isZoomEnabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnnotation()
    }
}

extension MapViewController {
    
    func addAnnotation()  {
      
        let annotation = locationObj.createAnnotation(latitude: nySchoolInfo?[0].latitude ?? "0.0", longitude: nySchoolInfo?[0].longitude ?? "0.0", title: nySchoolInfo?[0].schoolName ?? "")
        self.Map.addAnnotation(annotation);
                 
        Map.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        Map.showAnnotations(Map.annotations, animated: true)
        
    }
}
