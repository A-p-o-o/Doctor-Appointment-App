//
//  MobileDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 30/03/23.
//

import Foundation


struct MobileDAO {
    
    
    
    func addToFavourites(doctor : Doctor){
        if !MobileStorage.mobileStorage.favouriteDoctors.contains(doctor){
            MobileStorage.mobileStorage.favouriteDoctors.append(doctor)
        }
    }
    
    func removeFromFavourites(doctor : Doctor){
        guard let index =   MobileStorage.mobileStorage.favouriteDoctors.firstIndex(of: doctor) else { return }
        MobileStorage.mobileStorage.favouriteDoctors.remove(at: index)
    }
    
    func getFavouriteDoctors()->[Doctor]{
        MobileStorage.mobileStorage.favouriteDoctors
    }
}
