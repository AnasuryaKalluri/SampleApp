//
//  Model.swift
//  Anasurya_Task
//
//  Created by Anasurya on 7/25/24.
//

import Foundation


struct VehicleModel: Decodable{
    let status: Int?
    let message: String
    let vehicle_type, vehicle_make, vehicle_model, manufacture_year,fuel_type, vehicle_capacity : [VehicleSubModel]?
}
struct VehicleSubModel: Decodable{
    let text: String?
    let value: Int?
    let images: String
}

struct QRData {
    var codeString: String?
}

struct Parameters: Encodable{
    var clientid:Int
    var enterprise_code:Int
    var mno: String
    var passcode: Int
}
