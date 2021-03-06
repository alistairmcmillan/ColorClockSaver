import Cocoa

extension NSColor {
  var luma: Float {
    let red = 0.2126 * Float(redComponent)
    let green = 0.7152 * Float(greenComponent)
    let blue = 0.0722 * Float(blueComponent)

    return red + blue + green
  }

  var isLight: Bool {
    return luma >= 0.6
  }

  func appropriateBlackOrWhite() -> NSColor {
    if isLight {
      return .black
    } else {
      return .white
    }
  }

  func rgbaComponents() -> [CGFloat] {
    var rgba: [CGFloat] = [0, 0, 0, 0]
    getComponents(&rgba)
    return rgba
  }

  func isColorEqual(_ other: NSColor) -> Bool {
    guard
      let converted = self.usingColorSpace(.sRGB),
      let otherConverted = other.usingColorSpace(.sRGB)
    else {
      return false
    }

    return converted.rgbaComponents() == otherConverted.rgbaComponents()
  }
}
