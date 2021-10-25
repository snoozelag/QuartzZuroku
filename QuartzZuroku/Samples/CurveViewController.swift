//
//  CurveViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class CurveViewController: UIViewController {

    private let stackView = UIStackView()
    private let descriptionLabel = UILabel()
    private let quadCurveView = CheckQuadCurveView()
    private let curveView = CheckCurveView()
    private var isFirstViewDidAppear = true

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Curve"
        view.backgroundColor = .systemBackground
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        descriptionLabel.text = "Each point can be dragged."

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        quadCurveView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(quadCurveView)
        curveView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(curveView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isFirstViewDidAppear {
            isFirstViewDidAppear = false

            quadCurveView.setup()
            curveView.setup()
        }
    }
}

/// 2次ベジエ曲線
@IBDesignable
class CheckQuadCurveView: UIView {

    private let start = UILabel()
    private let end = UILabel()
    private let cp1 = UILabel()

    func setup() {
        backgroundColor = .lightGray

        start.backgroundColor = .red
        start.textColor = .white
        start.text = "s"
        start.isUserInteractionEnabled = true
        addSubview(start)

        end.backgroundColor = .blue
        end.textColor = .white
        end.text = "e"
        end.isUserInteractionEnabled = true
        addSubview(end)

        cp1.backgroundColor = .yellow
        cp1.text = "cp1"
        cp1.isUserInteractionEnabled = true
        addSubview(cp1)

        let size = CGSize(width: 30, height: 30)
        start.frame = CGRect(origin: CGPoint(x: bounds.midX - 80, y: bounds.midY + 60), size: size)
        end.frame = CGRect(origin: CGPoint(x: bounds.midX + 80, y: bounds.midY + 60), size: size)
        cp1.frame = CGRect(origin: CGPoint(x: bounds.midX - 80, y: bounds.midY - 100), size: size)
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(3)
        context.setStrokeColor(UIColor.black.cgColor)
        context.move(to: start.center)
        context.addQuadCurve(to: end.center, control: cp1.center)
        context.strokePath()

        context.setLineWidth(1)
        context.setLineDash(phase: 0, lengths: [4, 4])
        context.move(to: start.center)
        context.addLine(to: cp1.center)
        context.addLine(to: end.center)
        context.strokePath()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let view = touch.view else { return }
        if view != self {
            view.center = touch.location(in: self)
        }
        setNeedsDisplay()
    }
}

/// 3次ベジエ曲線
@IBDesignable
class CheckCurveView: UIView {

    private let start = UILabel()
    private let end = UILabel()
    private let cp1 = UILabel()
    private let cp2 = UILabel()

    func setup() {
        backgroundColor = .lightGray

        start.backgroundColor = .red
        start.textColor = .white
        start.text = "s"
        start.isUserInteractionEnabled = true
        addSubview(start)

        end.backgroundColor = .blue
        end.textColor = .white
        end.text = "e"
        end.isUserInteractionEnabled = true
        addSubview(end)

        cp1.backgroundColor = .yellow
        cp1.text = "cp1"
        cp1.isUserInteractionEnabled = true
        addSubview(cp1)

        cp2.backgroundColor = .yellow
        cp2.text = "cp2"
        cp2.isUserInteractionEnabled = true
        addSubview(cp2)

        let size = CGSize(width: 30, height: 30)
        start.frame = CGRect(origin: CGPoint(x: bounds.midX - 120, y: bounds.midY + 30), size: size)
        end.frame = CGRect(origin: CGPoint(x: bounds.midX + 120, y: bounds.midY - 40), size: size)
        cp1.frame = CGRect(origin: CGPoint(x: bounds.midX - 20, y: bounds.midY - 40), size: size)
        cp2.frame = CGRect(origin: CGPoint(x: bounds.midX + 10, y: bounds.midY + 70), size: size)
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(3)
        context.setStrokeColor(UIColor.black.cgColor)
        context.move(to: start.center)
        context.addCurve(to: end.center, control1: cp1.center, control2: cp2.center)
        context.strokePath()

        context.setLineWidth(1)
        context.setLineDash(phase: 0, lengths: [4, 4])
        context.move(to: start.center)
        context.addLine(to: cp1.center)
        context.strokePath()
        context.move(to: end.center)
        context.addLine(to: cp2.center)
        context.strokePath()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let view = touch.view else { return }
        if view != self {
            view.center = touch.location(in: self)
        }
        setNeedsDisplay()
    }
}
