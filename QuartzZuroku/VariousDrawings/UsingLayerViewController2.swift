//
//  UsingLayerViewController2.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class UsingLayerViewController2: UIViewController {

    private let stackView = UIStackView()
    private let sample1View = Sample1View()
    private let sample2View = Sample2View()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Using CALayer (2)"
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

    private class Sample1View: UIView {

        private let layerContainer = UIView() // オートレイアウトでセンタリングするために利用

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

            let drawLayer = SampleLayer1()
            drawLayer.frame = CGRect(origin: .zero, size: CGSize(width: 110, height: 110))

            layerContainer.translatesAutoresizingMaskIntoConstraints = false
            addSubview(layerContainer)
            layerContainer.heightAnchor.constraint(equalToConstant: drawLayer.bounds.height).isActive = true
            layerContainer.widthAnchor.constraint(equalToConstant: drawLayer.bounds.width).isActive = true
            layerContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            layerContainer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            layerContainer.layer.addSublayer(drawLayer)
            drawLayer.setNeedsDisplay()
        }
    }

    private class Sample2View: UIView {

        private let layerContainer = UIView() // オートレイアウトでセンタリングするために利用

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

            let drawLayer = SampleLayer2()
            drawLayer.frame = CGRect(origin: .zero, size: CGSize(width: 110, height: 110))

            layerContainer.translatesAutoresizingMaskIntoConstraints = false
            addSubview(layerContainer)
            layerContainer.heightAnchor.constraint(equalToConstant: drawLayer.bounds.height).isActive = true
            layerContainer.widthAnchor.constraint(equalToConstant: drawLayer.bounds.width).isActive = true
            layerContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            layerContainer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            layerContainer.layer.addSublayer(drawLayer)
            drawLayer.setNeedsDisplay()
        }
    }
}

class SampleLayer1: CALayer {

    override func draw(in context: CGContext) {
        // 例(1)
        let size = CGSize(width: 100, height: 100)
        // 青い長方形（ライン）を描画
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addRect(CGRect(origin: .zero, size: size))
        context.strokePath()
        // 赤い長方形（塗りつぶし）を描画
        context.setFillColor(UIColor.red.cgColor)
        context.addRect(CGRect(origin: CGPoint(x: 10, y: 10), size: size))
        context.fillPath()
    }
}

class SampleLayer2: CALayer {

    override func draw(in context: CGContext) {
        // 例(2)
        let size = CGSize(width: 100, height: 100)
        // 赤い長方形（塗りつぶし）を描画
        context.setFillColor(UIColor.red.cgColor)
        context.addRect(CGRect(origin: CGPoint(x: 10, y: 10), size: size))
        context.fillPath()
        // 青い長方形（ライン）を描画
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addRect(CGRect(origin: .zero, size: size))
        context.strokePath()
    }
}
