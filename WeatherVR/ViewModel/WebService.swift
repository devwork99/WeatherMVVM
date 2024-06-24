//
//  WebService.swift
//  WeatherVR
//
//  Created by Yasir on 24/06/2024.
//


//Yasir API key
//c3142b219a4255fe725e992e0324859d

//Utad lat long
//41.2867817,-7.7408617

import Foundation


class WebService  {
    
    //make this static let
    
    static let shared = WebService()
    
    private init() {}
    
    let api_key = "c3142b219a4255fe725e992e0324859d"
    let lat = "41.2867817"
    let long = "-7.7408617"
    
    func getWeather(completion:@escaping(Weather?)-> ()){
        
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=\(api_key)") else {
            
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url:url)
        
        URLSession.shared.dataTask(with:request) { data, resp , error in
            
            guard let data = data, error == nil else {
                print("Error - in response")
                completion(nil)
                return
            }
            

            let json = try? JSONSerialization.jsonObject(with: data)
            print("JSON *******************")
            print(json)
            print("JSON *******************")
                

            if let weather = try? JSONDecoder().decode(Weather.self, from:data) {
                completion(weather)
            }else{
                completion(nil)
            }
                
        }.resume()

    }
    
    
    
    
}
