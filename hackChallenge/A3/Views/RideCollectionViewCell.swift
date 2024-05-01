//
//  RideCollectionViewCell.swift
//  A3
//
//  Created by L20-US-KBuerlein23-MBA on 4/7/24.
//

import UIKit

class RideCollectionViewCell: UICollectionViewCell {
    
    //MARK - view properties
    private let originToDestination = UILabel()
    private let name = UILabel()
    private let time = UILabel()
    private let seats = UILabel()
    private let image = UIImageView()
    
    
    static let reuse = "RideCollectionViewCellReuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.hc.white
        layer.cornerRadius = 16
        
        setUpImage()
        setUpName()
        setUpOriginToDestination()
        setUpTime()
        setUpAvailableSeats()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK - Set up views
    private func setUpImage() {
        image.image = UIImage(named: "car2")
        
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    private func setUpName() {
        name.text = ""
        name.font = .systemFont(ofSize: 14, weight: .semibold)
        name.textColor = UIColor.hc.black
        
        contentView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            name.topAnchor.constraint(equalTo: originToDestination.bottomAnchor, constant: 20)
        ])
    }

    private func setUpOriginToDestination() {
        originToDestination.textColor = UIColor.hc.navyBlue
        originToDestination.font = .systemFont(ofSize: 20, weight: .semibold).rounded
        layer.cornerRadius = 16

        contentView.addSubview(originToDestination)
        originToDestination.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            originToDestination.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            originToDestination.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    private func setUpAvailableSeats() {
        seats.font = .systemFont(ofSize: 14, weight: .semibold)
        seats.textColor = UIColor.hc.black
        
        contentView.addSubview(seats)
        seats.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            seats.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            seats.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 16),
            //seats.widthAnchor.constraint(equalToConstant: ),
            //seats.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setUpTime() {
        time.text = ""
        time.font = .systemFont(ofSize: 14, weight: .semibold)
        time.textColor = UIColor.hc.black
        
        contentView.addSubview(time)
        time.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            time.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
        ])
    }
    
    func configure(ride_id: String, driver_id: String, first_name: String, last_name: String, origin: String, destination: String, departure_time: String, available_seats: String, bookings: String) {
        self.name.text = "Driver: \(first_name) \(last_name)"
        self.originToDestination.text = "\(origin) to \(destination)"
        self.time.text = "Departure time: \(departure_time)"
        self.seats.text = "Seats left: \(available_seats)"
    }
    }

