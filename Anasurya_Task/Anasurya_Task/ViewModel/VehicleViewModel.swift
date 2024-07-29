//
//  VehicleViewModel.swift
//  Anasurya_Task
//
//  Created by Anasurya on 7/25/24..
//

import Foundation

class VehicleViewModel {
    
    func getVehicleData(completion: @escaping(_ vehicle: VehicleModel?, _ error: String?)->Void){
        
        let user = Parameters(clientid: 11, enterprise_code: 1007, mno: "9889897789", passcode: 3476)
        
        API_Call.getParseApiCall(urlString: mainURL.vehicleURL, parameters: user) { (result: Result<VehicleModel, Error>) in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure.localizedDescription)
            }
        }
    }
}

struct mainURL{
    static let vehicleURL = "http://103.123.173.50:8080/jhsmobileapi/mobile/configure/v1/task"
}
