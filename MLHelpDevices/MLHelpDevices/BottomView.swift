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
    
    let titleView = TitleView()
    
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
    
    public func setTitleText(title: String) {
        titleView.setupTextLabel(title: title)
    }
    
    
    func setupView() {
        addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true

        let buttonBuy = CustomButton(frame: .zero, backgroundColor: #colorLiteral(red: 0.00169262616, green: 0.5661305189, blue: 0.9979987741, alpha: 1))
        buttonBuy.setTitle("Buy", for: .normal)
        buttonBuy.addTarget(self, action: #selector(buttonBuyTapped), for: .touchUpInside)
        let buttonClose = CustomButton(frame: .zero, backgroundColor: #colorLiteral(red: 0.9099481702, green: 0.9022024274, blue: 0.8895059228, alpha: 1))
        buttonClose.setTitleColor(#colorLiteral(red: 0.00169262616, green: 0.5661305189, blue: 0.9979987741, alpha: 1), for: .normal)
        buttonClose.setTitle("Close", for: .normal)
        buttonClose.addTarget(self, action: #selector(buttonCloseTapped), for: .touchUpInside)
        
        stackViewHorizontal.addArrangedSubview(buttonBuy)
        stackViewHorizontal.addArrangedSubview(buttonClose)
        addSubview(stackViewHorizontal)
        stackViewHorizontal.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 13).isActive = true
        stackViewHorizontal.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13).isActive = true
        stackViewHorizontal.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        stackViewHorizontal.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
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
