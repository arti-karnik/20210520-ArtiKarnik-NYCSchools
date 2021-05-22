import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var nySchoolInfo: [NYSchool]?

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
        updateView()
    }
}

extension MapViewController {
    func updateView() {
        
        if let latitudeDouble = nySchoolInfo?[0].latitude, let longitudeDouble = nySchoolInfo?[0].longitude {
      
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(latitudeDouble) ?? 0.0), longitude: CLLocationDegrees(Double(longitudeDouble) ?? 0.0))
            
            let CLLCoordType = CLLocationCoordinate2D(latitude: location.latitude,longitude: location.longitude);
            let anno = MKPointAnnotation();
            anno.coordinate = CLLCoordType;
            anno.title = nySchoolInfo?[0].schoolName
            self.Map.addAnnotation(anno);
            
            Map.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
            Map.showAnnotations(Map.annotations, animated: true)
        }
        
    }
}
