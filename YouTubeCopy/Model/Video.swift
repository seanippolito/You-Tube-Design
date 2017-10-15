//
//  Video.swift
//  YouTubeCopy
//
//  Created by Sean on 10/14/17.
//  Copyright © 2017 Sean Ippolito. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName : String?
    var title: String?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
