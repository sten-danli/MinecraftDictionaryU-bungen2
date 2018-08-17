//
//  Data.swift
//  MinecraftDictionaryÜbungen2
//
//  Created by Dan Li on 30.07.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class Data{
    static func getData(completion: @escaping([ModelData])->()){
        
        var data:[ModelData]=[]
        
        let info:String="Die unendlichen Welten von Minecraft sind gefüllt mit Geheimnissen, Wundern aber auch Gefahren. Eisberge, sumpfige Gebiete und weite Wiesen warten darauf, nach deinen Vorstellungen verändert zu werden."
        
        data.append(ModelData(name: "Babychicken", info: info, image: #imageLiteral(resourceName: "Babychicken")))
        data.append(ModelData(name: "Diamand", info: info, image: #imageLiteral(resourceName: "Diamand")))
        data.append(ModelData(name: "Enderman", info: info, image: #imageLiteral(resourceName: "Enderman")))
        data.append(ModelData(name: "ErdBlock", info: info, image: #imageLiteral(resourceName: "erdBlock")))
        data.append(ModelData(name: "Horselnv", info: info, image: #imageLiteral(resourceName: "HorseInv")))
        data.append(ModelData(name: "Spider", info: info, image: #imageLiteral(resourceName: "Spider")))
        data.append(ModelData(name: "wekBank", info: info, image: #imageLiteral(resourceName: "werkBank")))
        data.append(ModelData(name: "zombie", info: info, image: #imageLiteral(resourceName: "zombie")))
        
       completion(data)
        
    }
}
