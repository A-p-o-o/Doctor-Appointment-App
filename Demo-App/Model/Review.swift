//
//  Review.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import Foundation


struct Review : Equatable{
    
    let doctor : Doctor
    let reviewGivenBy : String
    let time : Date
    let Date : Date
    let star : Int
    let content : String
    var likes : Int
    var dislikes : Int
    
    init(doctor: Doctor, reviewGivenBy: String, time: Date, Date: Date, star: Int, content: String) {
        self.doctor = doctor
        self.reviewGivenBy = reviewGivenBy
        self.time = time
        self.Date = Date
        self.star = star
        self.content = content
        self.likes = 0
        self.dislikes = 0
    }
    
    static func == (lhs: Review, rhs: Review) -> Bool {
        if lhs.doctor == rhs.doctor &&
            lhs.reviewGivenBy.caseInsensitiveCompare(rhs.reviewGivenBy) == .orderedSame &&
            lhs.time == rhs.time &&
            lhs.Date == rhs.Date &&
            lhs.content == rhs.content{
            return true
        }
        return false
    }
    
    mutating func addLike(){
        self.likes += 1
    }
    
    mutating func removeLike(){
        self.likes -= 1
    }
    
    mutating func addDisLike(){
        self.dislikes += 1
    }
    
    mutating func removeDisLike(){
        self.dislikes -= 1
    }
}
