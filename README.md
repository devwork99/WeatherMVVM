#  WeatherMVVM
A weather app created with MVVM architecture and Swift UI, the open weather api is used to get current weather


# Networking API

Open Weather API to fetch the latest weater

# Model

The business objects based on the response from the API, generated the model from quicktyp.io

# View / Interface in SwiftUI

![weather](https://github.com/devwork99/WeatherMVVM/assets/56628984/3ff51ab1-13b8-4106-8b8d-d3ecc5276c4f)


# ViewModel

The Observable protocol, contains the business logic. The business objects are bound with the view, whenever the value of the obserables change the view gets reloaded. 

# Networking layer / WebService class

Singleton WebService class implemented that fetch the data from internet, it gets utilised in the ViewModel. 

# TODO

Adde the option to fetch data from Internet with Async/Await
