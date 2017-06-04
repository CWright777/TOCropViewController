//
//  CropViewController.swift
//
//  Copyright 2015-2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation
import UIKit

public enum CropViewControllerAspectRatioPreset {
    case original = TOCropViewControllerAspectRatioPresetOriginal
    case square = TOCropViewControllerAspectRatioPresetSquare
    case 3x2 = TOCropViewControllerAspectRatioPreset3x2
    case 5x2 = TOCropViewControllerAspectRatioPreset5x3
    case 4x3 = TOCropViewControllerAspectRatioPreset4x3
    case 5x4 = TOCropViewControllerAspectRatioPreset5x4
    case 7x5 = TOCropViewControllerAspectRatioPreset7x5
    case 16x9 = TOCropViewControllerAspectRatioPreset16x9
    case custom = TOCropViewControllerAspectRatioPresetCustom
}

@objc public protocol CropViewControllerDelegate: class {
    func cropViewController(_ cropViewController: CropViewController, didCropToRect: CGRect, angle: Int)
    func cropViewController(_ cropviewController: CropViewController, didCropToImage: UIImage, rect: CGRect, angle: Int)
    func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage: UIImage, rect: CGRect, angle: Int)
    func cropViewController(_ cropViewController: CropViewController, didFinishCancelled: Bool)
}

public final class CropViewController: TOCropViewController, TOCropViewControllerDelegate {

    fileprivate var delegateProxy: CropViewControllerDelegate?

    @objc open weak var delegate: CropViewControllerDelegate? {
        set {
            super.delegate = self
            self.delegateProxy = newValue
        }
        get { return delegateProxy }
    }

    
}
