//
//  ViewController.swift
//  Homework9 _cocoa
//
//  Created by Vladimir Beliakov on 17.09.2022.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var springViewOutlet: SpringView!
    @IBOutlet weak var springLabelOutlet: UILabel!
    @IBOutlet weak var runAnimationOutlet: UIButton!
    
    private var animationStage = 0
    var animationArray = (shake : "shake",
                          pop : "pop",
                          wobble : "wobble")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springViewOutlet.layer.cornerRadius = 50
        runAnimationOutlet.layer.cornerRadius = 10
        runAnimationOutlet.setTitle(animationArray.shake, for: .normal)
    }
    
    @IBAction func startAnimationButton(_ sender: UIButton) {
        
        switch animationStage {
        case 0:
            springViewOutlet.animation = animationArray.shake
            springViewOutlet.animate()
            springLabelOutlet.text = springViewOutlet.animation
            runAnimationOutlet.setTitle(animationArray.pop, for: .normal)
            animationStage = 1
        case 1:
            springViewOutlet.animation = animationArray.pop
            springViewOutlet.animate()
            springLabelOutlet.text = springViewOutlet.animation
            runAnimationOutlet.setTitle(animationArray.wobble, for: .normal)
            animationStage = 2
        case 2:
            springViewOutlet.animation = animationArray.wobble
            springViewOutlet.animate()
            springLabelOutlet.text = springViewOutlet.animation
            runAnimationOutlet.setTitle(animationArray.shake, for: .normal)
            animationStage = 0
        default:
            break
        }
    }
    
    
}

