//
//  NetworkCoinManager.swift
//  CoinNetwork
//
//  Created by Татьяна Татьяна on 29.06.2021.
//

import Foundation
import Alamofire


class NetworkCoinManager {
    typealias cointCallBack = (_ coints: [CoinElement]?, _ status: Bool, _ messagr: String) -> Void
    var callBack: cointCallBack?
    var image: UIImage?

    
    func getPriceCoins() {
        let url = "https://rest-sandbox.coinapi.io/v1/assets/?apikey=F3F35404-8CA7-4FCB-81C3-B51CE1FC3E9F"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return}
            do {
                let coint = try JSONDecoder().decode([CoinElement].self, from: data)
                self.callBack?(coint, true, "")
            } catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callBack: @escaping cointCallBack) {
        self.callBack = callBack
    }
    
    
    func getImag(urlEndcoding: String) -> UIImage? {
        let urlStart = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/"
        let url = urlStart + urlEndcoding + ".png"
        
        AF.download(url).responseData { response in
                    if let data = response.value {
                        
                        self.image = UIImage(data: data)
                    }
           
        }
        return image
    }

}

