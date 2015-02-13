//
//  ViewController.swift
//  swiftcalc-sample
//
//  Created by Shoken Fujisaki on 2/13/15.
//  Copyright (c) 2015 Shoken Fujisaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTypingNumber = false  // 数字をタイプ中か
    var bufferNumber : Int! = 0 // 計算中の数値
    var nextOperation : String? // 次に計算する操作 +, -
    
    @IBOutlet weak var display: UILabel!  // 結果を表示するラベル
    
    // 数字キーが押された時
    @IBAction func digit(sender: UIButton) {
        // ログに表示
        println("pushed \(sender.currentTitle)")
        
        if isTypingNumber {
            let digit = sender.currentTitle!
            display.text = display.text! + digit
        } else {
            display.text = sender.currentTitle!
            isTypingNumber = true
        }
    }
    
    @IBAction func operation(sender: UIButton) {
        // ログに表示
        println("pushed \(sender.currentTitle)")
        
        if sender.currentTitle == "C" {
            bufferNumber = 0
            nextOperation = nil
        } else {
            if nextOperation == nil {
                bufferNumber = displayInt()
            } else if nextOperation == "+" {
                bufferNumber = bufferNumber + displayInt()
            } else if nextOperation == "-" {
                bufferNumber = bufferNumber - displayInt()
            }
            
            if (sender.currentTitle == "+" || sender.currentTitle == "-") {
                nextOperation = sender.currentTitle
            }
        }
        
        display.text = "\(bufferNumber)"
        isTypingNumber = false
        
        if sender.currentTitle == "=" {
            bufferNumber = 0
            nextOperation = nil
        }
    }
    
    func displayInt() -> Int {
        if let displayInt : Int = display.text?.toInt() {
            return displayInt
        } else {
            return 0
        }
    }

}

