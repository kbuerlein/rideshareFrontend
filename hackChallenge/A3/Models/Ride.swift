//
//  Ride.swift
//  RideShare
//
//  Created by L20-US-KBuerlein23-MBA on 4/28/24.
//

import Foundation

struct Ride: Codable {
    let ride_id: String
    let driver_id: String
    let first_name: String
    let last_name: String
    let origin: String
    let destination: String
    let departure_time: String
    let available_seats: String
    let bookings: String
}
