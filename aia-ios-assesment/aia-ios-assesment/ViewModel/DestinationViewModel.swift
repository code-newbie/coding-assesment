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
        self.destination = [
            Destination(id: 0, name: "Bali", image: "bali", description: "Bali is the most popular island holiday destination in the Indonesian archipelago. It’s home to an ancient culture that's known for its warm hospitality as well as exotic temples and palaces set against stunning natural backdrops. Dining in Bali presents endless choices of exotic, local cuisine. After sunset, famous nightspots come to life offering exciting clubbing and packed dance floors.\n\nInland, towering volcanoes and pristine jungles offer plenty to see and do, but you won't want to stay away from the coastline for long. Popular beach resorts include Kuta, Seminyak and Jimbaran where many of the finest hotels and villas look over world-class surf spots. For tranquil seascapes and sunrises, Sanur, Nusa Dua and remote Candidasa are your best bets. Bali’s lesser travelled eastern and northern regions also offer wonderful diving spots in calm bays, with coral gardens teeming with colourful marine biodiversity.", country: "Indonesia"),
            Destination(id: 1, name: "Jogja", image: "jogja", description: "Jogja is a talented teaser, capable of enchanting the heart of anyone visiting her. In just a short time, many have already fallen in love with her. There are reasons why people would refuse to leave her-her simplicity, friendliness, arts and culture, culinary, to her different kind of life rhythm. Jogja gladly witnesses the ups and downs of your youth. She is also the home to thousands of people from across the nation coming over in search for education. What's more, Jogja will also stands by your side while you grow into adulthood and into older ages. Those are what make you crazy in love with her. She is more than just being humble; she is also open for anyone wanting to be part of her.", country: "Indonesia"),
            Destination(id: 2, name: "Medan", image: "medan", description: "The booming city of Medan, capital of North Sumatra, is an economic hub and commercial center for the region. This is the largest city in Sumatra Island, whose long been attracting residents from all over Indonesia to come and stay here. Due to these ethnic diversities, Medan is known for scrumptious delectable culinary spots, rich with many flavors. Bolu Meranti is a kind of rolled sponged cake with various buttercream choices that has become one of the famous snacks in town along with Bika Ambon Zulayka. Medan is also one busy metropolis, so you’ll need to be patient with some traffic jams. Noisy minibusses and becak compete with taxis and motorbikes for space and action through the crowds and heat.", country: "Indonesia"),
            Destination(id: 3, name: "Bandung", image: "bandung", description: "Surrounded by green fertile mountains, Bandung today is Indonesia’s center for learning and creativity. Bandung is one of Indonesia’s most prestigeous university towns. Bandung is also the center of Indonesia’s burgeoning ICT technology, at the same time it is a center of arts and artists. Every weekend and long holidays the city is filled with young people from Jakarta who flock to Bandung to enjoy its youthful creative atmosphere in music, painting, fashion, and the culinary arts.", country: "Indonesia"),
            Destination(id: 4, name: "Bali", image: "bali", description: "Bali is the most popular island holiday destination in the Indonesian archipelago. It’s home to an ancient culture that's known for its warm hospitality as well as exotic temples and palaces set against stunning natural backdrops. Dining in Bali presents endless choices of exotic, local cuisine. After sunset, famous nightspots come to life offering exciting clubbing and packed dance floors.\n\nInland, towering volcanoes and pristine jungles offer plenty to see and do, but you won't want to stay away from the coastline for long. Popular beach resorts include Kuta, Seminyak and Jimbaran where many of the finest hotels and villas look over world-class surf spots. For tranquil seascapes and sunrises, Sanur, Nusa Dua and remote Candidasa are your best bets. Bali’s lesser travelled eastern and northern regions also offer wonderful diving spots in calm bays, with coral gardens teeming with colourful marine biodiversity.", country: "Indonesia"),
            Destination(id: 5, name: "Jogja", image: "jogja", description: "Jogja is a talented teaser, capable of enchanting the heart of anyone visiting her. In just a short time, many have already fallen in love with her. There are reasons why people would refuse to leave her-her simplicity, friendliness, arts and culture, culinary, to her different kind of life rhythm. Jogja gladly witnesses the ups and downs of your youth. She is also the home to thousands of people from across the nation coming over in search for education. What's more, Jogja will also stands by your side while you grow into adulthood and into older ages. Those are what make you crazy in love with her. She is more than just being humble; she is also open for anyone wanting to be part of her.", country: "Indonesia"),
            Destination(id: 6, name: "Medan", image: "medan", description: "The booming city of Medan, capital of North Sumatra, is an economic hub and commercial center for the region. This is the largest city in Sumatra Island, whose long been attracting residents from all over Indonesia to come and stay here. Due to these ethnic diversities, Medan is known for scrumptious delectable culinary spots, rich with many flavors. Bolu Meranti is a kind of rolled sponged cake with various buttercream choices that has become one of the famous snacks in town along with Bika Ambon Zulayka. Medan is also one busy metropolis, so you’ll need to be patient with some traffic jams. Noisy minibusses and becak compete with taxis and motorbikes for space and action through the crowds and heat.", country: "Indonesia"),
            Destination(id: 7, name: "Bandung", image: "bandung", description: "Surrounded by green fertile mountains, Bandung today is Indonesia’s center for learning and creativity. Bandung is one of Indonesia’s most prestigeous university towns. Bandung is also the center of Indonesia’s burgeoning ICT technology, at the same time it is a center of arts and artists. Every weekend and long holidays the city is filled with young people from Jakarta who flock to Bandung to enjoy its youthful creative atmosphere in music, painting, fashion, and the culinary arts.", country: "Indonesia")
        ]
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
