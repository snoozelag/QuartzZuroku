//
//  MultipleLinesViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class MultipleLinesViewController: UIViewController {

    private var drawView = MultipleLinesView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Multiple Lines"
        view.backgroundColor = .systemBackground
        
        drawView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(drawView)
        drawView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        drawView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        drawView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        drawView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
    }
}

class MultipleLinesView: UIView {

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
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2)

        let pathPoints = [
            CGPoint(x: bounds.maxX * (0/3), y: 100),
            CGPoint(x: bounds.maxX * (1/3), y: 10),
            CGPoint(x: bounds.maxX * (1/3), y: 100),
            CGPoint(x: bounds.maxX * (2/3), y: 10),
            CGPoint(x: bounds.maxX * (2/3), y: 100),
            CGPoint(x: bounds.maxX * (3/3), y: 10),
        ]
        // 要素の1番目と2番目がペア、3番目と4番目がペア…という風に２つの点のペアの直線パスが作成される
        context.strokeLineSegments(between: pathPoints)

        // 同じ結果となるコード
//        context.move(to: CGPoint(x: bounds.maxX * (0/3), y: 100))
//        context.addLine(to: CGPoint(x: bounds.maxX * (1/3), y: 10))
//        context.strokePath()
//
//        context.move(to: CGPoint(x: bounds.maxX * (1/3), y: 100))
//        context.addLine(to: CGPoint(x: bounds.maxX * (2/3), y: 10))
//        context.strokePath()
//
//        context.move(to: CGPoint(x: bounds.maxX * (2/3), y: 100))
//        context.addLine(to: CGPoint(x: bounds.maxX * (3/3), y: 10))
//        context.strokePath()
    }
}
