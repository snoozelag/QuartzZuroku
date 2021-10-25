//
//  LineViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class LineViewController: UIViewController {

    private var lineView = LineView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Line"
        view.backgroundColor = .systemBackground
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView)
        lineView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        lineView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        lineView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
    }
}

class LineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isOpaque = false
        backgroundColor = .lightGray
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(UIColor.black.cgColor) // 色を設定
        context.setLineWidth(2)  // ストローク幅を2ptに設定
        context.move(to: CGPoint(x: 0, y: bounds.midY))
        context.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        context.strokePath()
    }
}
