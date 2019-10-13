//  Created by Edoardo de Cal on 10/12/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var color: UIColor?
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? self.color?.darker(by: 10) : color
        }
    }
    
    init(frame: CGRect, backgroundColor: UIColor) {
        super.init(frame: frame)
        setup()
        color = backgroundColor
        self.backgroundColor = color
    }
    
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.cornerRadius = 8
        heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
