//
//  HomeViewModel.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation


class HomeViewModel {
    
    //MARK: Properties
    
    var busses = [Bus]()
    var driverAnnotations = [DriverAnnotation]()
    var newAnnotations = [DriverAnnotation]()
    private var prevBusses = [Bus]()
    
    
    //MARK: Intents
    
    func fetchNearbyBusLocations(lattitude: Double, longitude: Double ,completion: @escaping () -> ()){
        
        NetworkService.shared.fetchNearbyBusses(device_id: "test_user", lattitude: latitude, longitude: longitude) { res in
            switch res{
            case .success(let busses):
                print(busses)
               
            case .failure(let error):
                print(error)
             
            }
        }
    }
    
    
    private func createMapAnnotations(){
        
    }
    
}
