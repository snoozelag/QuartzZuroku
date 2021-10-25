//
//  MasterViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit
import SwiftUI

class SubtitleCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        accessoryType = .disclosureIndicator
    }
}

class MasterViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "QuartzZuroku"

        tableView.register(SubtitleCell.self, forCellReuseIdentifier: "SubtitleCell")
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    private func showDetail(_ detail: UIViewController) {
        let navigationController = UINavigationController(rootViewController: detail)
        navigationController.viewControllers = [detail]
        showDetailViewController(navigationController, sender: self)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 7
        case 2:
            return 7
        case 3:
            return 5
        case 4:
            return 1
        default:
            preconditionFailure()
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Introduction"
        case 1:
            return "Shapes"
        case 2:
            return "Shapes using UIBezierPath"
        case 3:
            return "Various drawings"
        case 4:
            return "Effects"
        default:
            preconditionFailure()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleCell", for: indexPath) as! SubtitleCell
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Painter's Model"
                cell.detailTextLabel?.text = "Code to confirm the painter's model"
            case 1:
                cell.textLabel?.text = "Fill Pattern"
                cell.detailTextLabel?.text = "winding or evenOdd"
            default:
                preconditionFailure()
            }
        case 1:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Single Line"
                cell.detailTextLabel?.text = "move(to:)|addLine(to:)|strokePath()"
            case 1:
                cell.textLabel?.text = "Zigzag Line"
                cell.detailTextLabel?.text = "addLines(between:)|strokePath()"
            case 2:
                cell.textLabel?.text = "Multiple Lines"
                cell.detailTextLabel?.text = "strokeLineSegments(between:)"
            case 3:
                cell.textLabel?.text = "Rectangle"
                cell.detailTextLabel?.text = "addRect()|stroke()"
            case 4:
                cell.textLabel?.text = "Circle"
                cell.detailTextLabel?.text = "addEllipse(in:)|strokeEllipse(in:)"
            case 5:
                cell.textLabel?.text = "Arc"
                cell.detailTextLabel?.text = "addArc(center:radius:startAngle:endAngle:clockwise:)"
            case 6:
                cell.textLabel?.text = "Curve"
                cell.detailTextLabel?.text = "addQuadCurve(to:control:), addCurve(to:control1:control2:)"
            case 7:
                cell.textLabel?.text = "Rectangle"
                cell.detailTextLabel?.text = "strokeLineSegments(between:)"
            default:
                preconditionFailure()
            }
        case 2:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Single Line"
                cell.detailTextLabel?.text = "move(to:)|addLine(to:)|strokePath()"
            case 1:
                cell.textLabel?.text = "Zigzag Line"
                cell.detailTextLabel?.text = "addLines(between:)|strokePath()"
            case 2:
                cell.textLabel?.text = "Multiple Lines"
                cell.detailTextLabel?.text = "strokeLineSegments(between:)"
            case 3:
                cell.textLabel?.text = "Rectangle"
                cell.detailTextLabel?.text = "addRect()|stroke()"
            case 4:
                cell.textLabel?.text = "Circle"
                cell.detailTextLabel?.text = "addEllipse(in:)|strokeEllipse(in:)"
            case 5:
                cell.textLabel?.text = "Arc"
                cell.detailTextLabel?.text = "addArc(center:radius:startAngle:endAngle:clockwise:)"
            case 6:
                cell.textLabel?.text = "Curve"
                cell.detailTextLabel?.text = "addQuadCurve(to:control:), addCurve(to:control1:control2:)"
            case 7:
                cell.textLabel?.text = "Rectangle"
                cell.detailTextLabel?.text = "strokeLineSegments(between:)"
            default:
                preconditionFailure()
            }
        case 3:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Create UIImage"
                cell.detailTextLabel?.text = "UIGraphicsImageRenderer, UIImageView"
            case 1:
                cell.textLabel?.text = "Using Layer (1)"
                cell.detailTextLabel?.text = "CAShapeLayer, CGMutablePath"
            case 2:
                cell.textLabel?.text = "Using Layer (2)"
                cell.detailTextLabel?.text = "draw() in CALayer Subclass"
            case 3:
                cell.textLabel?.text = "Drawing in SwiftUI (1)"
                cell.detailTextLabel?.text = "Path view"
            case 4:
                cell.textLabel?.text = "Drawing in SwiftUI (2)"
                cell.detailTextLabel?.text = "Shape view"
            default:
                preconditionFailure()
            }
        case 4:
            cell.textLabel?.text = "preparation in progress"
            cell.detailTextLabel?.text = ""
        default:
            preconditionFailure()
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                showDetail(PaintersModelViewController())
            case 1:
                showDetail(FillPatternViewController())
            default:
                preconditionFailure()
            }
        case 1:
            switch indexPath.row {
            case 0:
                showDetail(LineViewController())
            case 1:
                showDetail(ZigzagLineViewController())
            case 2:
                showDetail(MultipleLinesViewController())
            case 3:
                showDetail(RectangleViewController())
            case 4:
                showDetail(CircleViewController())
            case 5:
                showDetail(ArcViewController())
            case 6:
                showDetail(CurveViewController())
            case 7:
                showDetail(RectangleViewController())
            case 8:
                showDetail(RectangleViewController())
            default:
                preconditionFailure()
            }
        case 2:
            switch indexPath.row {
            case 0:
                showDetail(BPLineViewController())
            case 1:
                showDetail(BPZigzagLineViewController())
            case 2:
                showDetail(BPMultipleLinesViewController())
            case 3:
                showDetail(BPRectangleViewController())
            case 4:
                showDetail(BPCircleViewController())
            case 5:
                showDetail(BPArcViewController())
            case 6:
                showDetail(BPCurveViewController())
            case 7:
                showDetail(BPRectangleViewController())
            case 8:
                showDetail(BPRectangleViewController())
            default:
                preconditionFailure()
            }
        case 3:
            switch indexPath.row {
            case 0:
                showDetail(UsingImageViewController())
            case 1:
                showDetail(UsingLayerViewController())
            case 2:
                showDetail(UsingLayerViewController2())
            case 3:
                showDetail(UIHostingController(rootView: SwiftUI_PathSampleView()))
            case 4:
                showDetail(UIHostingController(rootView: SwiftUI_ShapeSampleView()))
            default:
                preconditionFailure()
            }
        case 4:
            tableView.deselectRow(at: indexPath, animated: true)
        default:
            preconditionFailure()
        }
    }
}
