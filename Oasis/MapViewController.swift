//
//  MapViewController.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/25/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    let ref = FIRDatabase.database().reference().child("report")
    
    @IBOutlet weak var mapView: MKMapView!
    
    var status: String = "";
    var reports = [reportAnnotation]();
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        fetchReport();
        status = "finished";
        mapView.addAnnotations(reports)
        let coordinate = CLLocationCoordinate2D(latitude: 43.2, longitude: 78.3)
        mapView.addAnnotation(reportAnnotation(title: "dummy", locationName: "", discipline: "Water Source Report", coordinate: coordinate, subtitle: "dummy"))
    }
            // Do any additional setup after loading the view.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchReport() {
        ref.observe(.childAdded, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                let long  = value["long"] as? String ?? ""
                let lat = value["lat"] as? String ?? ""
                let condition = value["condition"] as? String ?? ""
                let oCondition = value["oCondition"] as? String ?? ""
                let type = value["type"] as? String ?? ""
                let virus = value["virus"] as? String ?? ""
                let contam = value["contam"] as? String ?? ""
                let reporter = value["reporter"] as? String ?? ""
                let reportType = value["reportType"] as? String ?? ""
                let id = snapshot.key;
                self.status = "entered";
                if(lat != "" && long != "") {
                    let coordinate = CLLocationCoordinate2D(latitude: (Double(lat))!, longitude: (Double(long))!)
                    let newAnnotation = reportAnnotation(title: id + "\nReported By" + " " + reporter, locationName: oCondition + " " + condition + ""
                        + type + " Water", discipline: reportType, coordinate: coordinate, subtitle: "Virus PPM: " + virus +
                        "Contam PPM: " + contam)
                    self.reports.append(newAnnotation)
}
            }
        })
    }


    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? reportAnnotation {
            let identifier = "reportPin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            view.pinTintColor = annotation.pinTintColor()
            let subtitleView = UILabel()
            subtitleView.font = subtitleView.font.withSize(12)
            subtitleView.numberOfLines = 0
            subtitleView.text = annotation.subtitle!
            view.detailCalloutAccessoryView = subtitleView
            return view
        }
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
