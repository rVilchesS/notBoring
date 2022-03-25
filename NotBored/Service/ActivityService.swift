import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}

class ActivityService {
    
    let apiClient = AlamofireAPIClient()
    
    func getActivity(type: String? = nil, participants: String, completion: @escaping (Activities) -> Void){
        
        var activityURL = "http://www.boredapi.com/api/activity"
        
        if let type = type {
            activityURL.append(contentsOf: "?type=\(type)&participants=\(participants)")
        } else {
            activityURL.append(contentsOf: "?participants=\(participants)")
        }
        
        apiClient.get(url: activityURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let asd = try JSONDecoder().decode(Activities.self, from: data)
                        completion(asd)
                    }
                } catch {
                    completion(Activities(activity: "", accessibility: 0, type: "", participants: 0, price: 0, link: "", key: ""))
                }
            case .failure(_):
                print("asd")
            }
        }
    }
}
