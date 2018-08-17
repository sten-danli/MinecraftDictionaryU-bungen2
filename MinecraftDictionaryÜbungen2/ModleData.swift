//
//  ModleData.swift
//  MinecraftDictionaryÜbungen2
//
//  Created by Dan Li on 30.07.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class ModelData{
    var name:String
    var info:String
    var image:UIImage?
    
    init(name:String,info:String,image:UIImage?) {
        self.name=name
        self.info=info
        self.image=image
    }
}
