//
//  ColorsTableViewController.swift
//  Copyright © 2017 Gleesh. All rights reserved.
//

import Foundation
import UIKit


class ColorsTableViewController: UITableViewController {

    // MARK: - Properties

    private let dataSource = CLRColorConstant.All


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = String(describing: CLRColor.self)
    }


    // MARK: - UITableViewController Overrides

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)

        if let cell = cell as? ColorTableViewCell {
            let type = dataSource[indexPath.row]
            cell.configure(with: type)
        }

        return cell
    }
}


// MARK: - ColorTableViewCell

class ColorTableViewCell: UITableViewCell {

    // MARK: - Properties

    private var type: CLRColor?


    // MARK: - Public

    func configure(with type: CLRColor) {
        guard self.type != type else { return }

        self.type = type

        let color = UIColor(type: type)
        let inverted = color.contrastingColor

        backgroundColor = color
        textLabel?.textColor = inverted
        detailTextLabel?.textColor = inverted

        textLabel?.text = String(describing: type)
        detailTextLabel?.text = String(describing: color)
    }
}


// MARK: - UIColor Extension

extension UIColor {

    var contrastingColor: UIColor {
        guard let componentColors = cgColor.components else { return UIColor.white }

        let redValue = componentColors[0] * 299
        let greenValue = componentColors[1] * 587
        let blueValue = componentColors[2] * 114

        let colorBrightness = (redValue + greenValue + blueValue) / 1000
        let color: UIColor = (colorBrightness < 0.5) ? UIColor.white : UIColor.black

        return color
    }
}
