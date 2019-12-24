//  Created by Edoardo de Cal on 10/13/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import Foundation
import UIKit

class Device {

    var name: String?
    var price: Int?
    var company: String?
    var image: UIImage?
    
    init(name: String, price: Int, company: String, image: UIImage) {
        self.name = name
        self.price = price
        self.company = company
        self.image = image
    }
}
