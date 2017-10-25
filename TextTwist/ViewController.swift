//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var mixWord: UILabel!
    @IBOutlet weak var userMessage: UILabel!
    @IBOutlet weak var guessTextUserInput: UITextField!
    var model = WordData()
    var wordRndMix = WordData.allInfo[0]
    var wordSpecific = WordData.allInfo[0].letters
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordRndMix = model.getRndWord()
        wordSpecific = wordRndMix.letters
        guessTextUserInput.delegate = self
        mixWord.text = wordRndMix.letters
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.upperBound - range.lowerBound == 1 && string == "" && textField.text?.count != 0 {
            
            guard let lastChr = textField.text?.last?.description else {
                return false
            }
            wordSpecific.append(Character(lastChr))
            mixWord.text =  wordSpecific
            return true
        }
        if wordRndMix.letters.contains(string) {
            for chrIdx in wordSpecific.indices {
                if String(wordSpecific[chrIdx]) == string {
                    wordSpecific.remove(at: chrIdx)
                    mixWord.text = wordSpecific
                    return true
                }
            }
            userMessage.text = ""
            return true
        } else {
            userMessage.text = "You can't add \(string)"
            return false
        }
    }
    
}

