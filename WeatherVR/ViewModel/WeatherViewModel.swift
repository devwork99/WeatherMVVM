//
//  WeatherViewModel.swift
//  WeatherVR
//
//  Created by Yasir on 24/06/2024.
//

import Foundation


class WeatherViewModel : ObservableObject {
   
    @Published var weather : Weather?
    
    var isLoading : Bool = true
    
    var titleCityName : String {
        return weather?.city.name ?? "NA - City"
    }
    
    var mainTitleImage : String {
        guard let item = weather?.list.first else{
            return "cloud"
        }
        
        if item.weather.first?.main == "Rain" {
            return "cloud.rain.fill"
        }else if item.weather.first?.main == "Clouds" {
            return "cloud.fill"
        }else if item.weather.first?.main == "Snow" {
            return "cloud.snow"
        }
        
        return "cloud"
    }
    
    var mainTemp : String {
        guard let item = weather?.list.first else{
            return "NA"
        }
        //return  "\(item.main.temp)"
        return kelvinToCelsius(item.main.temp)
    }
    
    
    //DAYS******
    
    private func getTempIndicatorImageName(_ imgIn:String) -> String {
        switch imgIn {
        case "Rain":
            return "cloud.rain.fill"
        case "Clouds":
            return "cloud.fill"
        case "Snow":
            return "cloud.snow"
        default:
            return "cloud"
        }
    }
    
    private func getDayName(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Ensures the correct format

        guard let date = dateFormatter.date(from: dateString) else {
            return "NA-"
        }

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "E" // Full day name (e.g., "Monday")

        return dayFormatter.string(from: date)
    }
    
    private func kelvinToCelsius(_ kelvin: Double) -> String {
        let value = kelvin - 273.15
        return String(format: "%.2f°", value)
    }
    
    
    
    var dayOne : String {
        guard let item = weather?.list.first else{
            return "NA"
        }
        let some = self.getDayName(from:item.dtTxt)
        return some
    }
    
    var dayOneImg : String {
        guard let item = weather?.list.first else{
            return "NA"
        }
        return getTempIndicatorImageName(item.weather.first?.main ?? "NA")
    }
    
    var dayOneTemp : String {
        guard let item = weather?.list.first else{
            return "NA"
        }
        return kelvinToCelsius(item.main.temp)
    }
    
    
    
    var dayTwo : String {
        guard let item = weather?.list[3] else{
            return "NA"
        }
        return self.getDayName(from:item.dtTxt)
    }
    var dayTwoTemp : String {
        guard let item = weather?.list[3] else{
            return "NA"
        }
        //return "\(item.main.temp)"
        return kelvinToCelsius(item.main.temp)
    }
    
    
    var dayThree : String {
        guard let item = weather?.list[11] else{
            return "NA"
        }
        return self.getDayName(from:item.dtTxt)
    }
    var dayThreeTemp : String {
        guard let item = weather?.list[11] else{
            return "NA"
        }
        //return "\(item.main.temp)"
        return kelvinToCelsius(item.main.temp)
    }
    
    
    var dayFour : String {
        guard let item = weather?.list[21] else{
            return "NA"
        }
        return self.getDayName(from:item.dtTxt)
    }
    var dayFourTemp : String {
        guard let item = weather?.list[21] else{
            return "NA"
        }
        //return "\(item.main.temp)"
        return kelvinToCelsius(item.main.temp)
    }
    
    
    var dayFive : String {
        guard let item = weather?.list.last else{
            return "NA"
        }
        return self.getDayName(from:item.dtTxt)
    }
    
    var dayFiveTemp : String {
        guard let item = weather?.list.last else{
            return "NA"
        }
        //return "\(item.main.temp)"
        return kelvinToCelsius(item.main.temp)
    }
    
    
    //*****************************************
    
    
    init() {
        

        WebService.shared.getWeather { weather in
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let current = weather {
                
                DispatchQueue.main.async {
                    self.weather = current
                }
                
            }else{
                print("Nil - weather")
            }
            
        }
    }
    
    

}
