//
//  hangmanViewController.swift
//  Gunslinger Hangman
//
//  Created by Sam Zdziarski on 2/5/22.
//

import Cocoa
import AVFoundation
var audioPlayer: AVAudioPlayer?

class hangmanViewController: NSViewController {
    //objects to store functions for animating the two sprites
    @objc func cowboyTimerFire() {
        animateCowboy()
    }
    @objc func renegadeTimerFire() {
        animateRenegade()
    }
    //declaring two timers here but not setting them
    var cowboyTimer: Timer?
    var renegadeTimer: Timer?
    
    //creating a decodable structure so that I can fetch the word from the API
    struct Word: Decodable {
        var word: String
    }
    public var generatedWord: String = "piz" //this will hold the word the API fetches
    public var guessWord: String = "" //this holds the current players progress on the word
    public var letter = "" //this holds the chosen letter from the player
    public var bulletCount = 6 //buttel count variable (EI, guesses)
  
    //viewController directive to execute when the view loads
    override func viewDidLoad() {
        super.viewDidLoad() //still dont know what this means
        fetchWord() //fetches word from API
        hideOutcome() //hides the outcome message (you won/loss)
        //this will execute every time a letter is guessed
        animateCowboy() //does one initiation of the animation so that there isnt a pause
        animateRenegade() // ~ ~ but for renegade
        animateBodies() //actually starts the timer that fires the two above functions continously
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    //the timer that fires off the animations for the two sprites
    func animateBodies() {
        cowboyTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(cowboyTimerFire), userInfo: nil, repeats: true)
        renegadeTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(renegadeTimerFire), userInfo: nil, repeats: true)
    }
    //hides all views needed for outcome message (you win/lose)
    func hideOutcome() {
        resultLabel.controlView?.isHidden = true
        playAgainButton.isHidden = true
        outcomeLabel.isHidden = true
        outcomeBlock.isHidden = true
    }
    //shows all views for the outcome message
    func showOutcome() {
        outcomeLabel.stringValue = "The word was \(self.generatedWord)"
        resultLabel.controlView?.isHidden = false
        playAgainButton.isHidden = false
        outcomeLabel.isHidden = false
        outcomeBlock.isHidden = false
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    //all outlet declarations that need to be used
    @IBOutlet weak var bulletCounter: NSImageView!
    @IBOutlet weak var cowboy: NSImageCell!
    @IBOutlet weak var wordPresentation: NSTextFieldCell!
    @IBOutlet weak var renegade: NSImageView!
    @IBOutlet weak var resultLabel: NSImageCell!
    @IBOutlet weak var playAgainButton: NSButton!
    @IBOutlet weak var exitButton: NSButton!
    @IBOutlet weak var outcomeBlock: NSImageView!
    @IBOutlet weak var outcomeLabel: NSTextField!
    @IBOutlet weak var aLetter: NSButton!
    @IBOutlet weak var bLetter: NSButton!
    @IBOutlet weak var cLetter: NSButton!
    @IBOutlet weak var dLetter: NSButton!
    @IBOutlet weak var eLetter: NSButton!
    @IBOutlet weak var fLetter: NSButton!
    @IBOutlet weak var gLetter: NSButton!
    @IBOutlet weak var hLetter: NSButton!
    @IBOutlet weak var iLetter: NSButton!
    @IBOutlet weak var jLetter: NSButton!
    @IBOutlet weak var kLetter: NSButton!
    @IBOutlet weak var lLetter: NSButton!
    @IBOutlet weak var mLetter: NSButton!
    @IBOutlet weak var nLetter: NSButton!
    @IBOutlet weak var oLetter: NSButton!
    @IBOutlet weak var pLetter: NSButton!
    @IBOutlet weak var qLetter: NSButton!
    @IBOutlet weak var rLetter: NSButton!
    @IBOutlet weak var sLetter: NSButton!
    @IBOutlet weak var tLetter: NSButton!
    @IBOutlet weak var uLetter: NSButton!
    @IBOutlet weak var vLetter: NSButton!
    @IBOutlet weak var wLetter: NSButton!
    @IBOutlet weak var xLetter: NSButton!
    @IBOutlet weak var yLetter: NSButton!
    @IBOutlet weak var zLetter: NSButton!
    /////////////////////////////////////////////////////////////////////////////
    //dismisses the segue used to open up the gameplay view
    @IBAction func exitButtonPressed(_ sender: Any) {
        self.dismiss(self)
    }
    //all IBAction button senders here, sets letter to letter pressed, then "shoots" the image, checking everything for the gameplay, then sets the presentation word to the new updated word
    @IBAction func aLetterPressed(_ sender: Any) {
        letter = "a"
        shootWithoutSounds(letterImage: aLetter)
    }
    @IBAction func bLetterPressed(_ sender: Any) {
        letter = "b"
        shootLetter(letterImage: bLetter)
    }
    @IBAction func cLetterPressed(_ sender: Any) {
        letter = "c"
        shootLetter(letterImage: cLetter)
    }
    @IBAction func dLetterPressed(_ sender: Any) {
        letter = "d"
        shootLetter(letterImage: dLetter)
    }
    @IBAction func eLetterPressed(_ sender: Any) {
        letter = "e"
        shootLetter(letterImage: eLetter)
    }
    @IBAction func fLetterPressed(_ sender: Any) {
        letter = "f "
        shootLetter(letterImage: fLetter)
    }
    @IBAction func gLetterPressed(_ sender: Any) {
        letter = "g"
        shootLetter(letterImage: gLetter)
    }
    @IBAction func hLetterPressed(_ sender: Any) {
        letter = "h"
        shootLetter(letterImage: hLetter)
    }
    @IBAction func iLetterPressed(_ sender: Any) {
        letter = "i"
        shootLetter(letterImage: iLetter)
    }
    @IBAction func jLetterPressed(_ sender: Any) {
        letter = "j"
        shootLetter(letterImage: jLetter)
    }
    @IBAction func kLetterPressed(_ sender: Any) {
        letter = "k"
        shootLetter(letterImage: kLetter)
    }
    @IBAction func lLetterPressed(_ sender: Any) {
        letter = "l"
        shootLetter(letterImage: lLetter)
    }
    @IBAction func mLetterPressed(_ sender: Any) {
        letter = "m"
        shootLetter(letterImage: mLetter)
    }
    @IBAction func nLetterPressed(_ sender: Any) {
        letter = "n"
        shootLetter(letterImage: nLetter)
    }
    @IBAction func oLetterPressed(_ sender: Any) {
        letter = "o"
        shootLetter(letterImage: oLetter)
    }
    @IBAction func pLetterPressed(_ sender: Any) {
        letter = "p"
        shootLetter(letterImage: pLetter)
    }
    @IBAction func qLetterPressed(_ sender: Any) {
        letter = "q"
        shootLetter(letterImage: qLetter)
    }
    @IBAction func rLetterPressed(_ sender: Any) {
        letter = "r"
        shootLetter(letterImage: rLetter)
    }
    @IBAction func sLetterPressed(_ sender: Any) {
        letter = "s"
        shootLetter(letterImage: sLetter)
    }
    @IBAction func tLetterPressed(_ sender: Any) {
        letter = "t"
        shootLetter(letterImage: tLetter)
    }
    @IBAction func uLetterPressed(_ sender: Any) {
        letter = "u"
        shootLetter(letterImage: uLetter)
    }
    @IBAction func vLetterPressed(_ sender: Any) {
        letter = "v"
        shootLetter(letterImage: vLetter)
    }
    @IBAction func wLetterPressed(_ sender: Any) {
        letter = "w"
        shootLetter(letterImage: wLetter)
    }
    @IBAction func xLetterPressed(_ sender: Any) {
        letter = "x"
        shootLetter(letterImage: xLetter)
    }
    @IBAction func yLetterPressed(_ sender: Any) {
        letter = "y"
        shootLetter(letterImage: yLetter)
    }
    @IBAction func zLetterPressed(_ sender: Any) {
        letter = "z"
        shootLetter(letterImage: zLetter)
    }
    //if the play again button is pressed, then reset the board (duh)
    @IBAction func playAgainPressed(_ sender: Any) {
        reset()
    }
    /////////////////////////////////////////////////////////////////////////////
    lazy var letterButtons: [NSButton] = [self.aLetter, self.bLetter, self.cLetter, self.dLetter, self.eLetter, self.fLetter, self.gLetter, self.hLetter, self.iLetter, self.jLetter, self.kLetter, self.lLetter, self.mLetter, self.nLetter, self.oLetter, self.pLetter, self.qLetter, self.rLetter, self.sLetter, self.tLetter, self.uLetter, self.vLetter, self.wLetter, self.xLetter, self.yLetter, self.zLetter]
    /////////////////////////////////////////////////////////////////////////////
    //Audio function to play the gunshot with AVAudio
    func playGunshot() {
        let url = Bundle.main.url(forResource: "gunShot", withExtension: "mp3")
        guard url != nil else {return}
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        }
        catch {
            print("error");
        }
    }
    /////////////////////////////////////////////////////////////////////////////
    //function that encapsulates everything else, and leads the gameplay
    func shootLetter(letterImage: NSButton) {
        playGunshot()
        //sets the letter to the shotLetter image, as to show it has been chosen
        letterImage.image = NSImage(named:"shotLetter");
        //disables the button that is shot so you cant click it
        (letterImage.cell! as! NSButtonCell).imageDimsWhenDisabled = false
        letterImage.isEnabled = false;
        //animates the cowboy shooting (yee haw)
        animateShot()
        //if the letter is not found in the word then the renegade shoots, using one of your lives
        if checkLetter(Letter: letter, Word: generatedWord, guessWord: guessWord) == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                renegadeShoot()
            }
            guessWord = replaceLetters(letter: letter, word: generatedWord, wordGuess: guessWord)
        } else {
            //if not, then change the guessword to represent the updated word
            guessWord = replaceLetters(letter: letter, word: generatedWord, wordGuess: guessWord)
        }
        //if you lose then it shows the losing animation of the renegade shooting the player (the cowboy)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            if bulletCount == 0 {
                lose()
            }
        }
        //checks if the word is complete and if it is you win :)
        wordPresentation.stringValue = guessWord
        checkIfWin(word: generatedWord, guessWord: guessWord)
    }
    //function that does everything the above one does, but doesnt make the gunshot sound
    //made this because there was a bug where the sound would play twice when pressing A (couldnt fix)
    func shootWithoutSounds(letterImage: NSButton) {
        letterImage.image = NSImage(named:"shotLetter");
        (letterImage.cell! as! NSButtonCell).imageDimsWhenDisabled = false
        letterImage.isEnabled = false;
        animateShot()
        if checkLetter(Letter: letter, Word: generatedWord, guessWord: guessWord) == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                renegadeShoot()
            }
            guessWord = replaceLetters(letter: letter, word: generatedWord, wordGuess: guessWord)
        } else {
            guessWord = replaceLetters(letter: letter, word: generatedWord, wordGuess: guessWord)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            if bulletCount == 0 {
                lose()
            }
        }
        wordPresentation.stringValue = guessWord
        checkIfWin(word: generatedWord, guessWord: guessWord)
    }
    //if the letter is not in the word then it brings the bullet counter down and changes the counter sprite image
    //the deduction of your lives
    func shootBullet() {
        bulletCount -= 1;
        switch (bulletCount) {
        case 5:
            bulletCounter.image = NSImage(named:"5BulletCounter")
        case 4:
            bulletCounter.image = NSImage(named:"4BulletCounter")
        case 3:
            bulletCounter.image = NSImage(named:"3BulletCounter")
        case 2:
            bulletCounter.image = NSImage(named:"2BulletCounter")
        case 1:
            bulletCounter.image = NSImage(named:"1BulletCounter")
        case 0:
            bulletCounter.image = NSImage(named:"0BulletCounter")
        default:
            print("error")
        }
    }
   //
    func lose() {
        //invalidates timers to prevent animations screwing up
        cowboyTimer?.invalidate()
        renegadeTimer?.invalidate()
        //disables all buttons on the board if they are not already disabled
        for button in self.letterButtons {
            if button.isEnabled == true {
                (button.cell! as! NSButtonCell).imageDimsWhenDisabled = false
                button.isEnabled = false
            }
        }
        //plays losing animation using asyncs
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            playGunshot()
            self.renegade.image = NSImage(named: "renegadeShoot")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                self.renegade.image = NSImage(named: "renegade")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                self.cowboy.image = NSImage(named: "cowboyDead")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                resultLabel.image = NSImage(named: "youLost")
                showOutcome()

            }
        }
    }
    //this checks if you completed the word
    func checkIfWin(word: String, guessWord: String){
        var won = false; //sets a bool to be used to determine if a win did occur
        var modifiedString = "" //creates an empty string
        //feeds the guessword input (minus the _s) into the string so that it can be compared
        modifiedString.append(guessWord[0])
        for i in 1...guessWord.count - 1 {
            if i % 2 == 0 {
                modifiedString.append(guessWord[i])
            }
        }
        //compares guessword (without _s) to the word caught from the API
        if modifiedString == word {
            //if it is the same then you won woohoo
            won = true
        } else {
            //if not you hasnt won :cryge:
            won = false
        }
        //if you DID win then it plays the win function stuff
        if won == true {
            win()
        }
    }
    //the function that executes when you win
    func win() {
        //basically the same as loss but the cowboy shoots the renegade instead
        renegadeTimer?.invalidate()
        cowboyTimer?.invalidate()
        for button in self.letterButtons {
            if button.isEnabled == true {
                (button.cell! as! NSButtonCell).imageDimsWhenDisabled = false
                button.isEnabled = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                animateShot()
                playGunshot()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                    self.cowboy.image = NSImage(named: "cowboy")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    self.renegade.image = NSImage(named: "renegadeDead")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                    resultLabel.image = NSImage(named: "youWon")
                    showOutcome()
                }
            }
        }
    }
    //shows the animaion of the cowboy shooting
    func animateShot() {
        cowboy.image = NSImage(named: "cowboyShoot");
        //asyncs for a third of a second where the cowboys shot is seen
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            self.cowboy.image = NSImage(named: "cowboy");
        }
    }
    //same as above, but renegade shoots

    func renegadeShoot() {
        renegade.image = NSImage(named: "renegadeShoot")
        shootBullet()
        playGunshot()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            self.renegade.image = NSImage(named: "renegade")
        }
    }
    //checks the letter to see if there was any change
    func checkLetter(Letter: String, Word: String, guessWord: String) -> Bool {
        let newString = replaceLetters(letter: Letter, word: Word, wordGuess: guessWord)
        if newString != guessWord {
            return true
        } else {
            return false
        }
    }
    //functions to animate each sprite on an async
    func animateCowboy() {
            cowboy.image = NSImage(named: "cowboy1")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                cowboy.image = NSImage(named: "cowboy")
            }
    }
    func animateRenegade() {
            renegade.image = NSImage(named: "renegade1")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                renegade.image = NSImage(named: "renegade")
            }
    }
    //resets the entire board back to default status
    func reset() {
        //get new word here
        hideOutcome()
        guessWord = makePresentationString(word: generatedWord)
        cowboy.image = NSImage(named: "cowboy")
        renegade.image = NSImage(named: "renegade")
        bulletCount = 6
        for button in self.letterButtons {
            button.isEnabled = true
        }
        bulletCounter.image = NSImage(named: "6BulletCounter")
        //theres no other way :(
        aLetter.image = NSImage(named: "aLetter")
        bLetter.image = NSImage(named: "bLetter")
        cLetter.image = NSImage(named: "cLetter")
        bLetter.image = NSImage(named: "bLetter")
        dLetter.image = NSImage(named: "dLetter")
        eLetter.image = NSImage(named: "eLetter")
        fLetter.image = NSImage(named: "fLetter")
        gLetter.image = NSImage(named: "gLetter")
        hLetter.image = NSImage(named: "hLetter")
        iLetter.image = NSImage(named: "iLetter")
        jLetter.image = NSImage(named: "jLetter")
        kLetter.image = NSImage(named: "kLetter")
        lLetter.image = NSImage(named: "lletter")
        mLetter.image = NSImage(named: "mLetter")
        nLetter.image = NSImage(named: "nLetter")
        oLetter.image = NSImage(named: "oLetter")
        pLetter.image = NSImage(named: "pLetter")
        qLetter.image = NSImage(named: "qLetter")
        rLetter.image = NSImage(named: "rLetter")
        sLetter.image = NSImage(named: "sLetter")
        tLetter.image = NSImage(named: "tLetter")
        uLetter.image = NSImage(named: "uLetter")
        vLetter.image = NSImage(named: "vLetter")
        wLetter.image = NSImage(named: "wLetter")
        xLetter.image = NSImage(named: "xLetter")
        yLetter.image = NSImage(named: "yLetter")
        zLetter.image = NSImage(named: "zLetter")
        fetchWord()
        guessWord = makePresentationString(word: self.generatedWord)
        if wordPresentation != nil {
            wordPresentation.stringValue = guessWord
        }
        animateCowboy()
        animateRenegade()
        animateBodies()
    
    }
    //function to fetch word from the API
    func fetchWord() {
     
        let url = URL(string: "https://clemsonhackman.com/api/word?key=\(API_KEY)")!
        Task {
        let (data,_) = try await URLSession.shared.data(from: url)
            let JSON = (String(data: data, encoding: .utf8)!) //gets the JSON data and stores it in a var
            
            let jsonData = JSON.data(using: .utf8)! //decodes the JSON using UTF8
            //decodes the word using a JSONDecoder
            let word: Word = try! JSONDecoder().decode(Word.self, from: jsonData)
            
            //sets generated word to the data decoded from the JSON
            self.generatedWord = word.word
            print(self.generatedWord)
            guessWord = makePresentationString(word: generatedWord)
            wordPresentation.stringValue = guessWord //sets the word label to the guessword//creating the guessWord default with _'s
        }
    }

}
