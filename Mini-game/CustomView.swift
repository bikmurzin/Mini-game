//
//  CustomView.swift
//  Mini-game
//
//  Created by User on 11.10.2022.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    var workingView: UIView!
    var xibName: String = "customView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    func getFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }

    func initView() {
        workingView = getFromXib()
        workingView.frame = self.bounds
        workingView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        workingView.layer.cornerRadius = frame.size.width / 2
        workingView.backgroundColor = UIColor(red: 0.0, green: 0.4, blue: 1.0, alpha: 0.7)
        addSubview(workingView)
    }
    
    
}
