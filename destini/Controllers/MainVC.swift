//
//  ViewController.swift
//  destini
//
//  Created by Josh Courtney on 4/25/21.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Btn: UIButton!
    @IBOutlet weak var choice2Btn: UIButton!
    
    var story = Story()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        customizeButtons()
    }
    
    @IBAction func choiceBtnTapped(_ sender: UIButton) {
        story.updateCurrentSceneIndex(with: sender.tag)
        updateUI()
        checkIfStoryIsOver()
    }
    
    func updateUI() {
        let currentScene = story.getCurrentScene()
        
        storyLabel.text = currentScene.text
        choice1Btn.setTitle(currentScene.choice1, for: .normal)
        choice2Btn.setTitle(currentScene.choice2, for: .normal)
        choice2Btn.isHidden = false
    }
    
    func customizeButtons() {
        choice1Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        choice1Btn.titleLabel?.minimumScaleFactor = 0.5
        choice1Btn.titleLabel?.numberOfLines = 0
        choice1Btn.titleEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        choice2Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        choice2Btn.titleLabel?.minimumScaleFactor = 0.5
        choice2Btn.titleLabel?.numberOfLines = 0
        choice2Btn.titleEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
    
    func checkIfStoryIsOver() {
        if story.isOver() {
            choice2Btn.isHidden = true
        }
    }
    
}
