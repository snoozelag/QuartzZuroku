//
//  RectangleViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class RectangleViewController: UIViewController {

    private let stackView = UIStackView()
    private let drawView = RectangleView()
    private let sameDrawView = SameRectangleView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Rectangle"
        view.backgroundColor = .systemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 10

        drawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(drawView)
        drawView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        sameDrawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sameDrawView)
        sameDrawView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}

class RectangleView: UIView {

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
        // 赤い線で囲まれた長方形
        let lineWidth: CGFloat = 10
        let halfLineWidth = lineWidth / 2
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.addRect(CGRect(x: 0, y: 0, width: bounds.midX, height: bounds.midY).insetBy(dx: halfLineWidth, dy: halfLineWidth))
        context.strokePath()

        // 青で塗りつぶしされた長方形
        context.setFillColor(UIColor.blue.cgColor)
        context.addRect(CGRect(x: bounds.midX, y: bounds.midY, width: bounds.midX, height: bounds.midY))
        context.fillPath()
    }
}

class SameRectangleView: UIView {

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
        // 赤い線で囲まれた長方形
        let lineWidth: CGFloat = 10
        let halfLineWidth = lineWidth / 2
        context.setStrokeColor(UIColor.red.cgColor)
        context.stroke(CGRect(x: 0, y: 0, width: bounds.midX, height: bounds.midY).insetBy(dx: halfLineWidth, dy: halfLineWidth), width: 10)

        // 青で塗りつぶしされた長方形
        context.setFillColor(UIColor.blue.cgColor)
        context.fill(CGRect(x: bounds.midX, y: bounds.midY, width: bounds.midX, height: bounds.midY))
    }
}
