//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 池上尚汰 on 2017/09/03.
//  Copyright © 2017年 shouta.ikegami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onTapImage(_ sender: Any) {
        //セグエを利用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let eivc: ExtendedImageViewController = (segue.destination as? ExtendedImageViewController)!
        // viewControllerのimageに画像を設定
        eivc.segueImage = imageView.image!
    }

    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // バンドルした画像ファイルの読み込み
        let image = UIImage(named: "image1.jpeg")
        
        // Image Viewに画像を設定
        imageView.image = image
        
    }
    
    //Timerによって一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        // print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
    
        // 画像の名前の配列
        let imageNameArray = ["image1.jpeg", "image2.jpeg", "image3.jpeg"]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最後の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
    
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
    
        // 画像を読み込み
        let image = UIImage(named: name)
    
        // ImageViewに読み込んだ画像をセット
        imageView.image = image
    
    }
    
    
    @IBAction func onPrev(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func onNext(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }

    @IBOutlet weak var playOrStopButton: UIButton!
    @IBOutlet weak var onPrevButton: UIButton!
    @IBOutlet weak var onNextButton: UIButton!
    
    @IBAction func playOrStop(_ sender: Any) {
        
        if self.timer == nil {
        // タイマーを設定
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
            playOrStopButton.setTitle("停止", for: UIControlState.normal)
            onPrevButton.isEnabled = false
            onNextButton.isEnabled = false
        } else {
            self.timer?.invalidate()
            playOrStopButton.setTitle("再生", for: UIControlState.normal)
            onPrevButton.isEnabled = true
            onNextButton.isEnabled = true
            
        }
    }
    
    @IBAction func unwind(sender: UIStoryboardSegue) {
        
    }
}

