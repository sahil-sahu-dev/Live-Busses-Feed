//
//  ViewController.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import UIKit
import MapKit


class HomeViewController: UIViewController {
    
    let mapView = MKMapView()
    let locationManger = LocationManager.shared.locationManager
    var homeViewModel = HomeViewModel()
    var timer = Timer()
    
    var lattitude: Double = 0
    var longitude: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        configureMapView()
        fetchBusses()
        scheduledTimerWithTimeInterval()
        
        lattitude = locationManger?.location?.coordinate.latitude ?? 0
        longitude = locationManger?.location?.coordinate.longitude ?? 0
    }
    
    func configureMapView() {
        
        mapView.frame = view.bounds
        
        enableLocationServices()
        
        mapView.delegate = self
        
        mapView.userTrackingMode = .follow
        
    }
    
    func fetchBusses(){
        
        print("Fetching nearby busses")
        
        lattitude = locationManger?.location?.coordinate.latitude ?? 0
        longitude = locationManger?.location?.coordinate.longitude ?? 0
        
        homeViewModel.fetchNearbyBusLocations(lattitude: lattitude, longitude: longitude) { [weak self] in
            
            if let annotations = self?.homeViewModel.busAnnotations {
                for annotation in annotations {
                    self!.mapView.addAnnotation(annotation)
                }
                
            }
            
        }
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 12, target: self, selector: #selector(fetchBusLocations), userInfo: nil, repeats: true)
    }
    
    @objc func fetchBusLocations(){
        DispatchQueue.main.async {
            self.homeViewModel.fetchNearbyBusLocations(lattitude: self.lattitude, longitude: self.longitude) { [weak self] in
                if let annotations = self?.homeViewModel.newAnnotations {
                    for annotation in annotations {
                        self!.mapView.addAnnotation(annotation)
                    }
                    
                }
            }
        }
    }


}


extension HomeViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? BusAnnotation else {return nil}
        
        let customAnnotationView = BusAnnotationView(annotation: annotation, reuseIdentifier: BusAnnotation.identifier)
        
        customAnnotationView.label.text = annotation.id
        
        customAnnotationView.label.backgroundColor = annotation.busType == "ac" && annotation.agency == "DTC" ? .red : annotation.busType == "nac" && annotation.agency == "DTC" ? .darkGreen : annotation.busType == "ac" && annotation.agency == "DIMTS" ? .blue : .orange
        
        return customAnnotationView
        
    }
    
}

//MARK: Location Services
extension HomeViewController {
    
    func enableLocationServices() {
        
        
        switch locationManger?.authorizationStatus {
            
        case .notDetermined:
            print("Not determined")
            locationManger?.requestWhenInUseAuthorization()
            
        case .restricted, .denied:
            break
        case .authorizedAlways:
            locationManger?.startUpdatingLocation()
            locationManger?.desiredAccuracy = kCLLocationAccuracyBest
            print("Auth always")
            
        case .authorizedWhenInUse:
            print("Auth when in use")
            locationManger?.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
}
    
    
