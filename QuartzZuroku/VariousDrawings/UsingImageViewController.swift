//
//  UsingImageViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class UsingImageViewController: UIViewController {

    private let stackView = UIStackView()
    private let sample1View = UIImageView()
    private let sample2View = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create UIImage"
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
        sample1View.backgroundColor = .lightGray
        sample1View.image = paintersModelSample1()
        sample1View.contentMode = .center

        sample2View.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sample2View)
        sample2View.heightAnchor.constraint(equalToConstant: 240).isActive = true
        sample2View.backgroundColor = .lightGray
        sample2View.image = paintersModelSample2()
        sample2View.contentMode = .center
    }

    func paintersModelSample1() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 110, height: 110))
        let image = renderer.image { rendererContext in
            let context = rendererContext.cgContext
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
        return image
    }

    func paintersModelSample2() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 110, height: 110))
        let image = renderer.image { rendererContext in
            let context = rendererContext.cgContext
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
        return image
    }
}
