//
//  ExtendedImageViewController.swift
//  SlideShowApp
//
//  Created by 池上尚汰 on 2017/09/03.
//  Copyright © 2017年 shouta.ikegami. All rights reserved.
//

import UIKit

class ExtendedImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var segueImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //　画像を表示する
        imageView.image = segueImage

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
