//
//  ArcViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class ArcViewController: UIViewController {

    private let stackView = UIStackView()
    private let drawView = ArcView()
    private let oneStrokeArcView = OneStrokeArcView()
    private let fillArcView = FillArcView()
    private let oneFillArcView = OneFillArcView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Arc"
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

        oneStrokeArcView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(oneStrokeArcView)
        oneStrokeArcView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        fillArcView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(fillArcView)
        fillArcView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        oneFillArcView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(oneFillArcView)
        oneFillArcView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}

class ArcView: UIView {

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
        // addArc() clockwise（時計回り）にtrueを指定すると、変換が適用され、反時計回りの円弧になります
        let context = UIGraphicsGetCurrentContext()!
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        context.addArc(center: center, radius: 30, startAngle: 0, endAngle: .pi / 2, clockwise: false)
        context.strokePath()
        // 左上の円弧
        context.addArc(center: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: true)
        context.strokePath()
    }
}

class OneStrokeArcView: UIView {

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
        // addArc() clockwise（時計回り）にtrueを指定すると、変換が適用され、反時計回りの円弧になります
        let context = UIGraphicsGetCurrentContext()!
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        context.addArc(center: center, radius: 30, startAngle: 0, endAngle: .pi / 2, clockwise: false)
        // context.strokePath()
        // 左上の円弧
        context.addArc(center: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: true)
        context.strokePath()
    }
}

class FillArcView: UIView {

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
        // addArc() clockwise（時計回り）にtrueを指定すると、変換が適用され、反時計回りの円弧になります
        let context = UIGraphicsGetCurrentContext()!
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        context.addArc(center: center, radius: 30, startAngle: 0, endAngle: .pi / 2, clockwise: false)
        context.fillPath()
        // 左上の円弧
        context.addArc(center: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: true)
        context.fillPath()
    }
}

class OneFillArcView: UIView {

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
        // addArc() clockwise（時計回り）にtrueを指定すると、変換が適用され、反時計回りの円弧になります
        let context = UIGraphicsGetCurrentContext()!
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        context.addArc(center: center, radius: 30, startAngle: 0, endAngle: .pi / 2, clockwise: false)
        // context.fillPath()
        // 左上の円弧
        context.addArc(center: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: true)
        context.fillPath()
    }
}
