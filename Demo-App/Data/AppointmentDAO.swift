//
//  AppointmentDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct AppointmentDAO {
    
    
    func setAppointmentId()->String{
        return String(Storage.storage.appointmentList.count + 1)
    }
    
    func addAppointment(appointment : inout Appointment)->Bool{
        
        let booking = slotBookingAndCancelling(date: appointment.date, doctor: appointment.doctor, slot: appointment.slot, bookSlot: true)
        
        guard booking.isBooked else { return false }
        
        let appointmentId = String(Storage.storage.appointmentList.count + 1)
        appointment.appointmentId = appointmentId
        Storage.storage.appointmentList[appointmentId] = appointment
        return true
    }
    
    func cancelAppointment(byDoctor appointment : Appointment ,reason : String)->Bool{
        
        let booking = slotBookingAndCancelling(date: appointment.date, doctor: appointment.doctor, slot: appointment.slot, bookSlot: false)
        
        guard booking.isBooked else { return false }
        
        var cancelledAppointment = appointment
        cancelledAppointment.status = .doctorCancelled(reason: reason)
        updateAppointment(appointment: cancelledAppointment)
        return true
    }
    
    func cancelAppointment(byPatient appointment : Appointment)->Bool{
        
        let booking = slotBookingAndCancelling(date: appointment.date, doctor: appointment.doctor, slot: appointment.slot, bookSlot: false)
        
        guard booking.isBooked else { return false }
        
        updateAppointment(appointment: appointment)
        return true
    }
    
    func updateAppointment(appointment : Appointment){
        Storage.storage.appointmentList[appointment.appointmentId!] = appointment
    }
    
    func getAppointment(patient : Patient)->(upcoming :[Appointment],completed :[Appointment],cancelled : [Appointment]){
        
        var upcoming : [Appointment] = []
        var completed :  [Appointment] = []
        var cancelled :  [Appointment] = []
        
        let allAppointments = Array(Storage.storage.appointmentList.values)
        
        for appointment in allAppointments{
            if appointment.bookedBy.patientId == patient.patientId {
                switch appointment.status {
                case .upcoming : upcoming.append(appointment)
                case .completed : completed.append(appointment)
                case .patientCancelled(_),.doctorCancelled(_) : cancelled.append(appointment)
                default : continue
                }
            }
        }
        return (upcoming.sorted(by: { $0.bookedTime < $1.bookedTime }),completed.sorted(by: { $0.bookedTime < $1.bookedTime }),cancelled.sorted(by: { $0.bookedTime < $1.bookedTime }) )
    }
    
    func getAppointment(doctor : Doctor)->(upcoming :[String : [Appointment]] ,completed : [String : [Appointment]],cancelled : [Appointment]){
        var upcomingAppointments = [String : [Appointment]]()
        var completedAppointments = [String : [Appointment]]()
        var cancelledAppointments : [Appointment] = []
        
        let allAppointments = Array(Storage.storage.appointmentList.values)
        
        for appointment in allAppointments{
            if appointment.doctor == doctor
            {
                switch appointment.status {
                case .upcoming :
                    if var appointments = upcomingAppointments[dateFormat(date: appointment.date)] {
                        appointments.append(appointment)
                        upcomingAppointments[dateFormat(date: appointment.date)] = appointments
                    } else {
                        upcomingAppointments[dateFormat(date: appointment.date)] = [appointment]
                    }
                case .completed :
                    if var appointments = completedAppointments[dateFormat(date: appointment.date)] {
                        appointments.append(appointment)
                        completedAppointments[dateFormat(date: appointment.date)] = appointments
                    } else {
                        completedAppointments[dateFormat(date: appointment.date)] = [appointment]
                    }
                case .doctorCancelled(_) :
                    cancelledAppointments.append(appointment)
                default : continue
                }
                
            }
        }
            return (upcomingAppointments,completedAppointments,cancelledAppointments)
        }
        
        
        func slotBookingAndCancelling(date : Date,doctor : Doctor,slot : Slot,bookSlot : Bool)->(isBooked :Bool,slot : Slot?){
            guard let availableDoctors = Storage.storage.availableDoctors[dateFormat(date: date)] else {
                
                return (false,nil)
                
            }
            var doctorAvailability = [DoctorAvailability]()
            var value : Slot?
            for var doc in availableDoctors {
                if doc.doctorId == doctor.employeeId && doc.department == doctor.department {
                    
                        if (bookSlot){
                            guard !slot.isBooked else {
                                return (false,nil)
                            }
                        }
                        doc.slots[slot.number-1] = .slot(number: slot.number, time: slot.time, isBooked: bookSlot)
                        value = doc.slots[slot.number-1]
                        
                    
                }
                doctorAvailability.append(doc)
            }
            
            Storage.storage.availableDoctors[dateFormat(date: date)] = doctorAvailability
            
            return (true,value)
        }
        
    }
    

