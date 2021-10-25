//
//  FillPatternViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class FillPatternViewController: UIViewController {

    private let descriptionLabel = UILabel()
    private let stackView = UIStackView()
    private let drawView = ZeroView()
    private let sameDrawView = EvenOddView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fill Pattern"
        view.backgroundColor = .systemBackground

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        descriptionLabel.text = "The sample above is a winding, and the sample below is an evenOdd."
        descriptionLabel.numberOfLines = 0

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        drawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(drawView)

        sameDrawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sameDrawView)
    }
}

class ZeroView: UIView {

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

    /// evenOdd
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(2)
        context.setFillColor(UIColor.blue.cgColor)
        let innerRadius: CGFloat = 30
        let outerRadius: CGFloat = 50
        // 左側の円
        var center = CGPoint(x: 90, y: 90)
        context.addArc(center: center, radius: innerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        // 外周円上にカレントポジションを移動
        context.move(to: CGPoint(x: center.x + outerRadius * cos(0), y: center.y + outerRadius * sin(0)))
        context.addArc(center: CGPoint(x: 90, y: 90), radius: outerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        context.closePath()
        // context.fillPath(using: .winding)
        context.drawPath(using: .fillStroke)

        // 右側の円
        center = CGPoint(x: 220, y: 90)
        context.addArc(center: center, radius: innerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        // 外周円上にカレントポジションを移動
        context.move(to: CGPoint(x: center.x + outerRadius * cos(0), y: center.y + outerRadius * sin(0)))
        context.addArc(center: center, radius: outerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        context.closePath()
        // context.fillPath(using: .winding)
        context.drawPath(using: .fillStroke)
    }
}

class EvenOddView: UIView {

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

    /// evenOdd
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.blue.cgColor)
        let innerRadius: CGFloat = 30
        let outerRadius: CGFloat = 50

        // 左側の円
        var center = CGPoint(x: 90, y: 90)
        context.addArc(center: center, radius: innerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        // 外周円上にカレントポジションを移動
        context.move(to: CGPoint(x: center.x + outerRadius * cos(0), y: center.y + outerRadius * sin(0)))
        context.addArc(center: CGPoint(x: 90, y: 90), radius: outerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        context.closePath()
        // context.fillPath(using: .evenOdd)
        context.drawPath(using: .eoFillStroke)

        // 右側の円
        center = CGPoint(x: 220, y: 90)
        context.addArc(center: center, radius: innerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        // 外周円上にカレントポジションを移動
        context.move(to: CGPoint(x: center.x + outerRadius * cos(0), y: center.y + outerRadius * sin(0)))
        context.addArc(center: center, radius: outerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        context.closePath()
        // context.fillPath(using: .evenOdd)
        context.drawPath(using: .eoFillStroke)
    }
}
