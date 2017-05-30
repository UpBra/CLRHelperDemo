//
// JSON Generated Colors
// Do not manually edit this file.
//

import Foundation
import UIKit

enum CLRColor {
	case pureWhite
	case softGray
	case loadingGray
	case inactiveGray
	case settingsGray
	case darkGray
	case darkSelectedGray
	case pinkishGray
	case dividerDarkGray
	case dividerLightGray
	case pureBlack
	case softBlue
	case red
	case darkRed
	case primaryBlue
	case secondaryBlue
}

struct CLRColorConstant {
	static let All: [CLRColor] = [.pureWhite, .softGray, .loadingGray, .inactiveGray, .settingsGray, .darkGray, .darkSelectedGray, .pinkishGray, .dividerDarkGray, .dividerLightGray, .pureBlack, .softBlue, .red, .darkRed, .primaryBlue, .secondaryBlue]
}

typealias ColorModel = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

let ColorMap: [CLRColor:ColorModel] = [
	.pureWhite: (255, 255, 255, 1.0),
	.softGray: (185, 185, 185, 1.0),
	.loadingGray: (200, 199, 204, 1.0),
	.inactiveGray: (172, 172, 172, 1.0),
	.settingsGray: (81, 81, 81, 1.0),
	.darkGray: (35, 35, 35, 1.0),
	.darkSelectedGray: (51, 51, 51, 1.0),
	.pinkishGray: (190, 190, 190, 1.0),
	.dividerDarkGray: (125, 125, 125, 1.0),
	.dividerLightGray: (222, 222, 222, 1.0),
	.pureBlack: (0, 0, 0, 1.0),
	.softBlue: (217, 239, 252, 1.0),
	.red: (218, 0, 33, 1.0),
	.darkRed: (228, 30, 43, 1.0),
	.primaryBlue: (0, 145, 234, 1.0),
	.secondaryBlue: (0, 112, 181, 1.0),
]

extension UIColor {

	convenience init(type: CLRColor) {
		guard let model = ColorMap[type] else { self.init(white: 0.0, alpha: 1.0); return }

		self.init(red: model.red / 255.0, green: model.green / 255.0, blue: model.blue / 255.0, alpha: model.alpha)
	}
}