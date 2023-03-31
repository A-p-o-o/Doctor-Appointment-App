//
//  Symptoms.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 28/03/23.
//

import Foundation

struct Symptomps {
    
    var allDepartmentAndSymptoms : [Department:[String]] = [
        Department.General_Physician: ["Vertigo","Fever","High BP","Dizziness","Pneumonia"],
        Department.Dermatologist: ["Acne","Fungal Infection","Vitiligo","Hair Loss","Acne Scars","Dandruff"],
        Department.Ear_Nose_throat: ["Thyroid","Sore Throat","Snoring","Coughing","Mouth Sores"],
        Department.Orthopedist: ["Back Pain","Knee Pain","Shoulder Pain","Leg Pain"],
        Department.Rheumatology: ["Acidity","Jaundice","Constipation"],
        Department.Psychiatry: ["Autism","Schizophrenia","BiPolar Disorder","Panic Attack"],
        Department.Neurologist : ["Head Ache"]
    ]
    
}
