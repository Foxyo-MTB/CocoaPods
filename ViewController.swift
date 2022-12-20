//
//  ViewController.swift
//  Homework9 _cocoa
//
//  Created by Vladimir Beliakov on 17.09.2022.
//

import Spring


enum AnimationType: String {
    case shake = "shake"
    case pop = "pop"
    case wobble = "wobble"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var springViewOutlet: SpringView!
    @IBOutlet weak var springLabelOutlet: UILabel!
    @IBOutlet weak var runAnimationOutlet: UIButton!
    
    private var animationStage: AnimationType = .shake
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springViewOutlet.layer.cornerRadius = 50
        runAnimationOutlet.layer.cornerRadius = 10
        runAnimationOutlet.setTitle(animationStage.rawValue, for: .normal)
    }
    
    @IBAction func startAnimationButton(_ sender: UIButton) {
        
        springViewOutlet.animation = animationStage.rawValue
        springViewOutlet.animate()
        springLabelOutlet.text = springViewOutlet.animation
        
        switch animationStage {
        case .shake:
            animationStage = .pop
        case .pop:
            animationStage = .wobble
        case .wobble:
            animationStage = .shake
        }
        
        runAnimationOutlet.setTitle(animationStage.rawValue, for: .normal)
    }
    
    
}

