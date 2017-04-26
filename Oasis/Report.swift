//
//  Report.swift
//  Oasis
//
//  Created by Tiffany Zhou on 4/23/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import Foundation

struct Report {

    let virus:String
    let contam: String
    let reporter: String
    let condition:String
    let oCondition:String
    let type: String
    let long: String
    let lat: String
    let id: String
    let reportType:String
    
    
    init(id:String, long: String, lat: String, oCondition:String, condition:String, type: String, reporter:String, virus:String,contam:String, reportType: String){
        self.id = id;
        self.virus = virus;
        self.contam = contam;
        self.oCondition = condition;
        self.condition = condition;
        self.reporter = reporter;
        self.long = long;
        self.lat = lat;
        self.type = type;
        self.reportType = reportType
        
    }
}

