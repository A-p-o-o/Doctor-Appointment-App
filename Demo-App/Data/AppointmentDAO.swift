//
//  AppointmentDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct AppointmentDAO {
    
    
    func add( appointment : inout Appointment)->Bool{
        
        let booking = slotBookingAndCancelling(date: appointment.date, doctor: appointment.doctor, slot: appointment.slot, bookSlot: true)
        guard booking.isBooked else {
            return false
        }
        
        var List = [Appointment]()
        
        if  let listOfAppointments : [Appointment] = Storage.storage.appointmentList[dateFormat(date: appointment.date)]{
            List = listOfAppointments
        }
        else {
            List = [Appointment]()
        }
        appointment.slot = booking.slot!
        List.append(appointment)
        Storage.storage.appointmentList[dateFormat(date: appointment.date)] = List
        return true
    }
    
    func getAppointment(patientId : String )->(upcoming :[Appointment]?,completed :[Appointment]?){
        var upComing = [Appointment]()
        var completed = [Appointment]()
        
        let totalAppointments = Array(Storage.storage.appointmentList.values)
        
        for perDayAppointments in totalAppointments{
            for appointment in perDayAppointments{
                if appointment.patientId == patientId{
                    if appointment.status == true {
                        completed.append(appointment)
                    }
                    else {
                        upComing.append(appointment)
                    }
                }
            }
        }
        return (upComing.isEmpty ? nil : upComing , completed.isEmpty ? nil : completed)
    }
    
    func getAppointment(forPatientName name : String )->[Appointment]?{
        
        var appointments : [Appointment]?
        
        for specifiedDate in  0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: specifiedDate, to: Date())!
            guard  let appointmentsInSpecifiedDate = Storage.storage.appointmentList[dateFormat(date: date)]
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
       return  Storage.storage.appointmentList[dateFormat(date: date)]
    }
    
    func getAppointment(fordate date : Date,patientName name : String)->[Appointment]?{
        
        var appointments = [Appointment]()
        guard let appointmentsOnDate = Storage.storage.appointmentList[dateFormat(date: date)] else {
            return nil
        }
        
        for appointment in  appointmentsOnDate{
            if appointment.patientName == name{
                appointments.append(appointment)
            }
        }
        return appointments.count != 0 ? appointments : nil
    }
    
    func cancelAppointment(appointment:Appointment)->Bool{
        
        let booking = slotBookingAndCancelling(date: appointment.date, doctor: appointment.doctor, slot: appointment.slot, bookSlot: false)
        guard booking.isBooked else {
            return false
        }
        
        guard var appointmentsOnDate = Storage.storage.appointmentList[dateFormat(date: appointment.date)] else {
            return false
        }
       
        if let index = appointmentsOnDate.firstIndex(of: appointment){
            appointmentsOnDate.remove(at: index)
            Storage.storage.appointmentList[dateFormat(date: appointment.date)] = appointmentsOnDate
           
        }
        return true
    }
    
    func getAppointment(doctor : Doctor)->(upcoming :[String : [Appointment]]? ,completed : [String : [Appointment]]?){
        var upcomingAppointments = [String : [Appointment]]()
        var completedAppointments = [String : [Appointment]]()
            
        let dates = Storage.storage.appointmentList.keys
        for date in dates {
            if let perDayAppointments = Storage.storage.appointmentList[date]{
                var upcoming = [Appointment]()
                var completed = [Appointment]()
                for appointment in perDayAppointments{
                    if appointment.doctor == doctor && appointment.status == false{
                        upcoming.append(appointment)
                    }
                    else if appointment.doctor == doctor && appointment.status == true{
                        completed.append(appointment)
                    }
                }
                upcomingAppointments[date] = upcoming.isEmpty ? nil : upcoming
                completedAppointments[date] = completed.isEmpty ? nil : completed
            }
        }
        return (upcomingAppointments , completedAppointments)
    }
    
    private func slotBookingAndCancelling(date : Date,doctor : Doctor,slot : Slot,bookSlot : Bool)->(isBooked :Bool,slot : Slot?){
        guard let availableDoctors = Storage.storage.availableDoctors[dateFormat(date: date)] else { return (false,nil) }
        var doctorAvailability = [DoctorAvailability]()
        var value : Slot?
        for var doc in availableDoctors {
            if doc.doctorId == doctor.employeeId && doc.department == doctor.department {
                
                switch slot {
                case .slot(let slotNo,let time,let isbooked) :
                    if (bookSlot){
                        guard !isbooked else {
                            return (false,nil)
                        }
                    }
                  doc.slots[slotNo-1] = .slot(number: slotNo, time: time, isBooked: bookSlot)
                  value = doc.slots[slotNo-1]
                }
            }
           doctorAvailability.append(doc)
        }
        
        Storage.storage.availableDoctors[dateFormat(date: date)] = doctorAvailability
        
        return (true,value)
    }
    
}
