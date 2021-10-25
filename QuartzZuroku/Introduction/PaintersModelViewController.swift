//
//  PaintersModelViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class PaintersModelViewController: UIViewController {

    private let stackView = UIStackView()
    private let sample1View = Sample1View()
    private let sample2View = Sample2View()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Painter's Model"
        view.backgroundColor = .systemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 10

        sample1View.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sample1View)
        sample1View.heightAnchor.constraint(equalToConstant: 240).isActive = true

        sample2View.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sample2View)
        sample2View.heightAnchor.constraint(equalToConstant: 240).isActive = true
    }
}

class Sample1View: UIView {

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
        // 例(1)
        let context = UIGraphicsGetCurrentContext()!
        let size = CGSize(width: 100, height: 100)
        // 青い長方形（ライン）を描画
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addRect(CGRect(origin: CGPoint(x: 70, y: 70), size: size))
        context.strokePath()
        // 赤い長方形（塗りつぶし）を描画
        context.setFillColor(UIColor.red.cgColor)
        context.addRect(CGRect(origin: CGPoint(x: 80, y: 80), size: size))
        context.fillPath()
    }
}

class Sample2View: UIView {

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
        // 例(2)
        let context = UIGraphicsGetCurrentContext()!
        let size = CGSize(width: 100, height: 100)
        // 赤い長方形（塗りつぶし）を描画
        context.setFillColor(UIColor.red.cgColor)
        context.addRect(CGRect(origin: CGPoint(x: 80, y: 80), size: size))
        context.fillPath()
        // 青い長方形（ライン）を描画
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addRect(CGRect(origin: CGPoint(x: 70, y: 70), size: size))
        context.strokePath()
    }
}
