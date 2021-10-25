//
//  BPRectangleViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class BPRectangleViewController: UIViewController {

    private let stackView = UIStackView()
    private let drawView = BPRectangleView()
    private let sameDrawView = BPSameRectangleView()

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

class BPRectangleView: UIView {

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
        // 赤い線で囲まれた長方形
        let lineWidth: CGFloat = 10
        let halfLineWidth = lineWidth / 2
        let path1 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.midX, height: bounds.midY).insetBy(dx: halfLineWidth, dy: halfLineWidth))
        UIColor.red.setStroke()
        path1.lineWidth = 10
        path1.stroke()

        // 青で塗りつぶしされた長方形
        UIColor.blue.setFill()
        let path2 = UIBezierPath(rect: CGRect(x: bounds.midX, y: bounds.midY, width: bounds.midX, height: bounds.midY))
        path2.fill()
    }
}

class BPSameRectangleView: UIView {

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
        // 赤い線で囲まれた長方形
        let lineWidth: CGFloat = 10
        let halfLineWidth = lineWidth / 2
        UIColor.red.setStroke()
        let path1 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.midX, height: bounds.midY).insetBy(dx: halfLineWidth, dy: halfLineWidth))
        path1.lineWidth = 10
        path1.stroke()

        // 青で塗りつぶしされた長方形
        UIColor.blue.setFill()
        let path2 = UIBezierPath(rect: CGRect(x: bounds.midX, y: bounds.midY, width: bounds.midX, height: bounds.midY))
        path2.fill()
    }
}
