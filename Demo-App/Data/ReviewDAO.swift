//
//  ReviewDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 08/03/23.
//

import Foundation


struct ReviewDAO{
    
    func addReview(review : Review){
        if var reviews = Storage.storage.reviewList[review.doctor.employeeId]{
            reviews.append(review)
            Storage.storage.reviewList[review.doctor.employeeId] = reviews
        }
        else {
            Storage.storage.reviewList[review.doctor.employeeId] = [review]
        }
    }
    
    func removeReview(review : Review){
        
        guard let index = Storage.storage.reviewList[review.doctor.employeeId]?.firstIndex(of: review) else {
            return
        }
        Storage.storage.reviewList[review.doctor.employeeId]?.remove(at: index)
        
    }
    
    func getReviews(doctorId : String)->[Review]{
        return Storage.storage.reviewList[doctorId] ?? []
    }
}
