//
//  ViewController.swift
//  Gunslinger Hangman
//
//  Created by Sam Zdziarski on 2/4/22.
//

import Cocoa

class ViewController: NSViewController {
   
    /////////////////////////////////////////////////////////////////////////////
    @objc func fireTimer() {
        animatePlay()
    }
    var timer: Timer?
    @IBOutlet weak var startButton: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        animatePlay()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }

    func animatePlay() {
        startButton.image = NSImage(named: "playButton2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            startButton.image = NSImage(named: "playButton1")

        }
        
    }


}


