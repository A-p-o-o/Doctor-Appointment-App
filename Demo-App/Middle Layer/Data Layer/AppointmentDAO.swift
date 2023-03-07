//
//  AppointmentDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct AppointmentDAO {
    
    
    func add(appointment : Appointment){
        
        var List : [Appointment]
        
        guard  let listOfAppointments : [Appointment] = Storage.storage.appointmentList[appointment.date]
                
        else {
            List = [Appointment]()
        }
        
        List = listOfAppointments
        List.append(appointment)
        Storage.storage.appointmentList[appointment.date] = List
    }
    
    func getAppointment(patientId : String )->[Appointment]?{
        var appointments : [Appointment]?
        
        for specifiedDate in  0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: specifiedDate, to: Date())!
            guard  let appointmentsInSpecifiedDate = Storage.storage.appointmentList[date]
            else {
                return nil
            }
            
            for appointment in  appointmentsInSpecifiedDate{
                if appointment.patientId.caseInsensitiveCompare(patientId) == .orderedSame{
                    appointments?.append(appointment)
                }
            }
            
        }
        return appointments
    }
    
    func getAppointment(forPatientName name : String )->[Appointment]?{
        
        var appointments : [Appointment]?
        
        for specifiedDate in  0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: specifiedDate, to: Date())!
            guard  let appointmentsInSpecifiedDate = Storage.storage.appointmentList[date]
            else {
                return nil
            }
            for appointment in  appointmentsInSpecifiedDate{
                if appointment.patientName.caseInsensitiveCompare(name) == .orderedSame{
                    appointments?.append(appointment)
                }
            }
            
        }
        return appointments
    }
    
    func getAppointment(forDate date : Date)->[Appointment]?{
       return  Storage.storage.appointmentList[date]
    }
    
    func getAppointment(fordate date : Date,patientName name : String)->[Appointment]?{
        
        var appointments : [Appointment]?
        guard let appointmentsOnDate = Storage.storage.appointmentList[date] else {
            return nil
        }
        
        for appointment in  appointmentsOnDate{
            if appointment.patientName == name{
                appointments?.append(appointment)
            }
        }
        return appointments
    }
    
    func cancelAppointment(appointment:Appointment){
        
        guard var appointmentsOnDate = Storage.storage.appointmentList[appointment.date] else {
            return
        }
       
        if let index = appointmentsOnDate.firstIndex(of: appointment){
            appointmentsOnDate.remove(at: index)
            Storage.storage.appointmentList[appointment.date] = appointmentsOnDate
        }
        

        
    }
}
