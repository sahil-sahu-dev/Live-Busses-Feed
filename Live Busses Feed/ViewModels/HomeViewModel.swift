//
//  HomeViewModel.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation
import MapKit

class HomeViewModel {
    
    //MARK: Properties
    
    var busses = [Bus]()
    var busAnnotations = [BusAnnotation]()
    var newAnnotations = [BusAnnotation]()
    private var prevBusses = [Bus]()
    
    
    //MARK: Intents
    
    func fetchNearbyBusLocations(lattitude: Double, longitude: Double ,completion: @escaping () -> ()){
        
        NetworkService.shared.fetchNearbyBusses(device_id: "test_user", lattitude: lattitude, longitude: longitude) { res in
            switch res{
            case .success(let busses):
                print(busses)
                self.busses = busses
                self.createMapAnnotations()
                
                DispatchQueue.main.async {
                    completion()
                }
               
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion()
                }
             
            }
        }
    }
    
    
    private func createMapAnnotations(){
        newAnnotations.removeAll()
        
        for bus in busses {
            
            var annotation_exists = false
            
            for busAnno in busAnnotations {
                if(bus.id == busAnno.id) {
                    //already exists. update coordinates
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 3.0){
                            busAnno.coordinate = CLLocationCoordinate2D(latitude: bus.lat , longitude: bus.lng)
                        }
                    }
                    
                    annotation_exists = true
                }
                
            }
            
            if !annotation_exists {
                //add annotation
                let newAnnotation = BusAnnotation(id: bus.id, coordinate: CLLocationCoordinate2D(latitude: bus.lat, longitude: bus.lng), agency: bus.agency, busType: bus.ac)
                
                busAnnotations.append(newAnnotation) //append to driver annotations
                
                newAnnotations.append(newAnnotation) //add to new annotations
                
            }
        }
        
        //if old vehicle is not in new response, remove it from the map
        
        for prev_bus in prevBusses {
            var bus_exists = false
            for bus in busses {
                if(bus.id == prev_bus.id){
                    bus_exists = true
                }
            }
            
            if bus_exists == false {
                //remove from the map
                busAnnotations.removeAll(where: {annotation in annotation.id == prev_bus.id})
            }
            
        }
    }
    
}
