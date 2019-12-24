//  Created by Edoardo de Cal on 10/13/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import Foundation
import UIKit

class DetailDeviceViewController: UIViewController {
    
    let dragView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 7).isActive = true
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.layer.cornerRadius = 3
        return view
    }()

    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
    }
    
    func setupViews() {
    
    }
    
}
