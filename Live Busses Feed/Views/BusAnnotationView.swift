//
//  BusAnnotationView.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import UIKit
import MapKit

class BusAnnotationView: MKAnnotationView {

    private let annotationFrame = CGRect(x: 0, y: 0, width: 20, height: 20)
    let label: UILabel
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        self.label = UILabel(frame: annotationFrame)
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.frame = annotationFrame
        self.label.textColor = .white
        self.label.textAlignment = .center
        self.backgroundColor = .blue
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented!")
    }

}
