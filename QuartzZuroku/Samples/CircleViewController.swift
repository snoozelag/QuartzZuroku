//
//  CircleViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class CircleViewController: UIViewController {

    private let stackView = UIStackView()
    private let drawView = CircleView()
    private let fillDrawView = FillCircleView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Circle"
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

        fillDrawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(fillDrawView)
        fillDrawView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}

class CircleView: UIView {

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
        // 円（ライン）
        context.addEllipse(in: CGRect(x: 30, y: 30, width: 60, height: 60))
        context.strokePath()
        // 同じ結果となるコンビニエンスメソッド
        context.strokeEllipse(in: CGRect(x: 130, y: 30, width: 60, height: 60))
    }
}

class FillCircleView: UIView {

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
        context.setFillColor(UIColor.blue.cgColor)
        // 円（塗りつぶし）
        context.addEllipse(in: CGRect(x: 30, y: 30, width: 60, height: 60))
        context.fillPath()
        // 同じ結果となるコンビニエンスメソッド
        context.fillEllipse(in: CGRect(x: 130, y: 30, width: 60, height: 60))
    }
}
