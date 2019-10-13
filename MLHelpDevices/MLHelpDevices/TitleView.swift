//  Created by Edoardo de Cal on 10/12/19.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import Foundation
import UIKit

final class TitleView: UIView {

    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ProximaNovaSoftW03-Bold", size: 27)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9414436221, green: 0.9297816157, blue: 0.9087315798, alpha: 1)
        return view
    }()

    let nestedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    func setupViews() {
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        nestedStackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(nestedStackView)
        stackView.addArrangedSubview(lineView)
        lineView.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func setupTextLabel(title: String) {
        labelTitle.text = title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
