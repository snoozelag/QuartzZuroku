//
//  UsingLayerViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class UsingLayerViewController: UIViewController {

    private let stackView = UIStackView()
    private let sample1View = LayerSample1View()
    private let sample2View = LayerSample2View()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Using CALayer (1)"
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

class LayerSample1View: UIView {

    private let customLayerView = LayerSample1View.createCustomLayerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .lightGray
        customLayerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(customLayerView)
        customLayerView.heightAnchor.constraint(equalToConstant: customLayerView.bounds.height).isActive = true
        customLayerView.widthAnchor.constraint(equalToConstant: customLayerView.bounds.width).isActive = true
        customLayerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        customLayerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private static func createCustomLayerView() -> UIView {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 110, height: 110)))
        let size = CGSize(width: 100, height: 100)

        // 青い長方形（ライン）を描画
        let path2 = CGMutablePath()
        path2.addRect(CGRect(origin: .zero, size: size))

        let blueLineLayer = CAShapeLayer()
        blueLineLayer.strokeColor = UIColor.blue.cgColor
        blueLineLayer.fillColor = UIColor.clear.cgColor // fillColorにclearを設定しない場合、黒で塗り潰しされます
        blueLineLayer.path = path2
        view.layer.addSublayer(blueLineLayer)

        // 赤い長方形（塗りつぶし）を描画
        let path = CGMutablePath()
        path.addRect(CGRect(origin: CGPoint(x: 10, y: 10), size: size))

        let redFillLayer = CAShapeLayer()
        redFillLayer.fillColor = UIColor.red.cgColor
        redFillLayer.path = path
        view.layer.addSublayer(redFillLayer)

        return view
    }
}

class LayerSample2View: UIView {

    private let customLayerView = LayerSample2View.createCustomLayerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .lightGray
        customLayerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(customLayerView)
        customLayerView.heightAnchor.constraint(equalToConstant: customLayerView.bounds.height).isActive = true
        customLayerView.widthAnchor.constraint(equalToConstant: customLayerView.bounds.width).isActive = true
        customLayerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        customLayerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private static func createCustomLayerView() -> UIView {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 110, height: 110)))
        let size = CGSize(width: 100, height: 100)

        // 赤い長方形（塗りつぶし）を描画
        let path = CGMutablePath()
        path.addRect(CGRect(origin: CGPoint(x: 10, y: 10), size: size))

        let redFillLayer = CAShapeLayer()
        redFillLayer.fillColor = UIColor.red.cgColor
        redFillLayer.path = path
        view.layer.addSublayer(redFillLayer)

        // 青い長方形（ライン）を描画
        let path2 = CGMutablePath()
        path2.addRect(CGRect(origin: .zero, size: size))

        let blueLineLayer = CAShapeLayer()
        blueLineLayer.strokeColor = UIColor.blue.cgColor
        blueLineLayer.fillColor = UIColor.clear.cgColor // fillColorにclearを設定しない場合、黒で塗り潰しされます
        blueLineLayer.path = path2
        blueLineLayer.backgroundColor = UIColor.clear.cgColor
        view.layer.addSublayer(blueLineLayer)

        return view
    }
}
