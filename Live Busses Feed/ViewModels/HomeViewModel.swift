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
    
    func fetchNearbyBusLocations(completion: @escaping () -> ()){
        
    }
    
    
    private func createMapAnnotations(){
        
    }
    
}
