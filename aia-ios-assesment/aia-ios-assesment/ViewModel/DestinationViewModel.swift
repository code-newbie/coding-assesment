//
//  DestinationViewModel.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 29/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation


class DestinationViewModel {
   
    var destination = [Destination]()
    
    init() {
        self.destination = [Destination(id: 0, name: "Jogja", image: "jogja", description: "Visit Jogja for an amazing and unforgettable adventure. Visit Jogja for an amazing and unforgettable adventure. Visit Jogja for an amazing and unforgettable adventure. Visit Jogja for an amazing and unforgettable adventure. Visit Jogja for an amazing and unforgettable adventure. Visit Jogja for an amazing and unforgettable adventure. Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"), Destination(id: 1, name: "Medan", image: "medan", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"), Destination(id: 2, name: "Bali", image: "bali", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"), Destination(id: 3, name: "Bandung", image: "bandung", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"),       Destination(id: 0, name: "Jogja", image: "jogja", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"), Destination(id: 1, name: "Medan", image: "medan", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"), Destination(id: 2, name: "Bali", image: "bali", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia"), Destination(id: 3, name: "Bandung", image: "bandung", description: "Visit Jogja for an amazing and unforgettable adventure.", country: "Indonesia")]
    }
}

extension DestinationViewModel {
    func getNumberOfDestination() -> Int {
        return destination.count
    }
    
    func getDestinationForIndex(index: Int) -> Destination {
        return destination[index]
    }
}
