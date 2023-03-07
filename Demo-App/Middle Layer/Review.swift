//
//  Review.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Review{
    
    let doctor : Doctor
    let reviewGivenBy : Person
    let time : Date
    let Date : Date
    let star : Int
    let content : String
    
    init(doctor: Doctor, reviewGivenBy: Person, time: Date, Date: Date, star: Int, content: String) {
        self.doctor = doctor
        self.reviewGivenBy = reviewGivenBy
        self.time = time
        self.Date = Date
        self.star = star
        self.content = content
    }
}
