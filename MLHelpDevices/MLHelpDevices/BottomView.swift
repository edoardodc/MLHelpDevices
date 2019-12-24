//  Created by Edoardo de Cal on 10/12/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import Foundation
import UIKit

class BottomView: UIView {

    let stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
        
    var delegate: ButtonsDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 115).isActive = true
        widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        setupView()
    }

    
    func setupView() {
        let titleView = TitleView(title: "Esempio")
        addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }

    @objc func buttonBuyTapped() {
        delegate?.didTapBuyButton()
    }
    
    @objc func buttonCloseTapped() {
        delegate?.didTapCloseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
