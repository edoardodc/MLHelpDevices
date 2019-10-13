//  Created by Edoardo de Cal on 10/12/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import Foundation
import UIKit

class SearchingView: UIView {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ProximaNovaSoftW03-Bold", size: 18)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.text = "Looking for a device"
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        heightAnchor.constraint(equalToConstant: 35).isActive = true
        widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setupView() {
        addSubview(labelTitle)
        labelTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
    public func setText(text: String) {
        labelTitle.text = text
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
