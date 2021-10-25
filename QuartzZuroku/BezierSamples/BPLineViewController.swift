//
//  BPLineViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class BPLineViewController: UIViewController {

    private var lineView = BPLineView()

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

class BPLineView: UIView {

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
        let path = UIBezierPath()
        UIColor.black.setStroke()
        path.lineWidth = 2
        path.move(to: CGPoint(x: 0, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        path.stroke()
    }
}
