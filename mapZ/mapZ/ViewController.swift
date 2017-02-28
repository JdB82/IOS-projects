//
//  ViewController.swift
//  mapZ
//
//  Created by Jeroen de Bie on 27/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var festivalarray : [Festival] = []

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.notifyObservers),
                                               name: NSNotification.Name(rawValue: "gotFestivalsData"),
                                               object: nil)
        
        DataProvider.sharedInstance.getFestivalsData()
        
    }

    
    //a) MARK: - Setup map
    
    func configureMap() {
        //b) delegate to this class
        mapView.delegate = self
        //c) set location to dam sq
        let damSquareLocation = CLLocationCoordinate2D(latitude: 52.373, longitude: 4.893)
        //d) area in metres to show at zoom level
        let regionRadius: CLLocationDistance = 3000
        //e) make a constant set zoom level at location
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(damSquareLocation,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        //f) tell the mapview to move to this region at a certain zoom level
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func notifyObservers(notification: NSNotification) {
        var festivalsDictionary: Dictionary<String,[Festival]> = notification.userInfo as! Dictionary<String, [Festival]>
        festivalarray = festivalsDictionary["festivals"]!
 
        showFestivalsOnMap()
        
    }

    func showFestivalsOnMap() {
        for festival in festivalarray {
            let festivalMapAnnotation = FestivalMapAnnotation(festival: festival)
            self.mapView.addAnnotation(festivalMapAnnotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? FestivalMapAnnotation {
            let indentifier = "pin"
            var view: MKAnnotationView
                if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: indentifier) {
                    dequeuedView.annotation = annotation
                view = dequeuedView
                view.image = UIImage(named: "pin-map")
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: indentifier)
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.image = UIImage(named: "pin-map")
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
                view.canShowCallout = true
            }
            return view
        }
    return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "pinFestivalDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pinFestivalDetail" {
            let currentAnnotation = mapView.selectedAnnotations[0] as! FestivalMapAnnotation //c)
        
            let destination = segue.destination as? DetailTableViewController //d)
            destination?.theFestival = currentAnnotation.festival //e)

        }
    }
}
