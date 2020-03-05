//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岡野真生 on 2020/02/25.
//  Copyright © 2020 maiki.okano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageIndex = 0
    var timer: Timer!
    let images = [UIImage(named: "egg_with_bread.jpg"), UIImage(named: "pancake4.jpg"), UIImage(named: "ソーセージ.jpg")]
    var timer_sec: Int = 0
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBAction func TapImage(_ sender: Any) {
        self.performSegue(withIdentifier: "MoveView2", sender: imageField.image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveView2" {
            let secondViewController = segue.destination as! View2Controller
            secondViewController.bigImage = sender as! UIImage
            setButtonEnabled(next: true, back: true)
            playPauseButton.setTitle("再生", for: .normal)
            // タイマーを停止
            self.timer.invalidate()
        }
    }
    
    
    @IBOutlet var TapImage: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageField.image = images[0]

        //ボタンの有効性
        setButtonEnabled(next: true, back: true)
    }
    
    func setButtonEnabled(next: Bool, back: Bool){
        self.nextButton.isEnabled = next
        self.backButton.isEnabled = back
       
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        print(timer_sec)
        if self.timer_sec % 2 == 0 {
            if imageIndex == 2 {
                imageIndex = 0
            } else {
                imageIndex += 1
            }
            imageField.image = images[imageIndex]
        }
    }

    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
                imageIndex = 0
            } else {
                imageIndex += 1
            }
            imageField.image = images[imageIndex]
    }
    
    //戻るボタン
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
                imageIndex = 2
            } else {
                imageIndex -= 1
            }
            imageField.image = images[imageIndex]
    }
    
     // 再生ボタン
    @IBAction func playPause(_ sender: Any) {
        if playPauseButton.titleLabel?.text == "再生"{
            setButtonEnabled(next: false, back: false)
            playPauseButton.setTitle("停止", for: .normal)
            // 再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }else{
            setButtonEnabled(next: true, back: true)
            playPauseButton.setTitle("再生", for: .normal)
            // タイマーを停止
            self.timer.invalidate()
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

