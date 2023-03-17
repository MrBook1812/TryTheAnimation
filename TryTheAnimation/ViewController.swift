//
//  ViewController.swift
//  TryTheAnimation
//
//  Created by Kirill Kniga on 16.03.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var springButton: SpringButton!
    
    private let collections = AnimationCollection.getCollection()
    
    private let slideLeftCollecion = AnimationCollection.init(preset: "slideLeft",
                                                              curve: "easeInQuad",
                                                              force: 1.37,
                                                              duration: 1.50,
                                                              delay: 0.3)
    
    private let slideRightColletcion = AnimationCollection(preset: "slideRight",
                                                           curve: "spring",
                                                           force: 2,
                                                           duration: 1.20,
                                                           delay: 0.5)
    private let slideDownCollection = AnimationCollection(preset: "slideDown",
                                                          curve: "linear",
                                                          force: 1.10,
                                                          duration: 1.10,
                                                          delay: 0.7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewLabelsLeft()
    }
    
    @IBAction func springAnimatedButtonTapped(_ sender: SpringButton) {
        setNewValues()
        springAnimationView.animate()
        sender.animation = "squeeze"
        sender.animate()
    }
}
// MARK: extension viewController
extension ViewController {
    private func setNewValues() {
        if springButton.currentTitle == "Run" {
            springButton.setTitle("Run slideLeft", for: .normal)
            slideLeft()
            setViewLabelsLeft()
        } else if springButton.currentTitle == "Run slideLeft" {
            springButton.setTitle("Run slideRight", for: .normal)
            slideLeft()
        } else if springButton.currentTitle == "Run slideRight" {
            springButton.setTitle("Run slideDown", for: .normal)
            slideRight()
            setViewLabelsRight()
            
        } else if springButton.currentTitle == "Run slideDown" {
            springButton.setTitle("Run slideLeft", for: .normal)
            slideDown()
            setViewLabelsDown()
        }
    }
// MARK: viewLabels setup functions
    private func setViewLabelsLeft() {
        presetLabel.text = "Preset: \(slideLeftCollecion.preset)"
        curveLabel.text = "Curve: \(slideLeftCollecion.curve)"
        forceLabel.text = "Force: \(slideLeftCollecion.force)"
        durationLabel.text = "Duration: \(slideLeftCollecion.duration)"
        delayLabel.text = "Delay: \(slideLeftCollecion.delay)"
    }
    private func setViewLabelsRight() {
        presetLabel.text = "Preset: \(slideRightColletcion.preset)"
        curveLabel.text = "Curve: \(slideRightColletcion.curve)"
        forceLabel.text = "Force: \(slideRightColletcion.force)"
        durationLabel.text = "Duration: \(slideRightColletcion.duration)"
        delayLabel.text = "Delay: \(slideRightColletcion.delay)"
    }
    private func setViewLabelsDown() {
        presetLabel.text = "Preset: \(slideDownCollection.preset)"
        curveLabel.text = "Curve: \(slideDownCollection.curve)"
        forceLabel.text = "Force: \(slideDownCollection.force)"
        durationLabel.text = "Duration: \(slideDownCollection.duration)"
        delayLabel.text = "Delay: \(slideDownCollection.delay)"
    }
    
// MARK: animation setup functions
    private func slideLeft() {
        springAnimationView.animation = slideLeftCollecion.preset
        springAnimationView.curve = slideLeftCollecion.curve
        springAnimationView.force = slideLeftCollecion.force
        springAnimationView.duration = slideLeftCollecion.duration
        springAnimationView.delay = slideLeftCollecion.delay
    }
    private func slideRight() {
        springAnimationView.animation = slideRightColletcion.preset
        springAnimationView.curve = slideRightColletcion.curve
        springAnimationView.force = slideRightColletcion.force
        springAnimationView.duration = slideRightColletcion.duration
        springAnimationView.delay = slideRightColletcion.delay
    }
    private func slideDown() {
        springAnimationView.animation = slideDownCollection.preset
        springAnimationView.curve = slideDownCollection.curve
        springAnimationView.force = slideDownCollection.force
        springAnimationView.duration = slideDownCollection.duration
        springAnimationView.delay = slideDownCollection.delay
    }
    
}
