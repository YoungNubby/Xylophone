//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileName : String = ""
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
  // arrays start at 0, so we add -1 to our tag when called
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
      
        selectedSoundFileName = soundArray[sender.tag - 1]
        
        print(selectedSoundFileName)
        
        playSound()
      
    }
    
    
    func playSound() {
        let soundURL = Bundle.main.url (forResource: selectedSoundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
            
        catch {
            print(error)
        }
        
        audioPlayer.play()
    }
 

}

// stackoverflow and developer.apple.com + reference for info on class and functions etc.
//OSStatus.com good for loking up error codes
//LondonBrewery Recipe for sound, more or less: 1. import a sound code library 2. add AVAudio Player controller delegate 3. add audioPlayer variable with ! 4. create soundURL that contains sound file, inside notePressed 5. set up audio player to "try" and play sound 6. catch block 7. profit
//do, catch, and try- methods for finding errors
//NOTE~ local variables are only available locally, must make within class for a global scope
