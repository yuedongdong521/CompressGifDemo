//
//  GifViewController.swift
//  CompressGifDemo
//
//  Created by ydd on 2019/8/9.
//  Copyright © 2019 ydd. All rights reserved.
//

import UIKit

class GifViewController: UIViewController {
    
    fileprivate lazy var _gifView: UIImageView = {
        let view = UIImageView.init(frame: CGRect(x: 100, y: 100, width: 250, height: 150))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton.init(type: .system)
        btn.setTitle("close", for: .normal)
        btn.frame = CGRect(x: 20, y: 100, width: 50, height: 50)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        self.view.addSubview(btn)
        
        self.view.addSubview(_gifView)
        
        do {
            
            let gifData = try Data(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "source1", ofType: "gif") ?? ""))
            print("压缩前：\((Float(gifData.count) / 1024.0))kb")
            
            let compressData = UIImage.scalGIFWithData(gitData: gifData, scalSize: CGSize(width: 250, height: 150))
            print("压缩后：\((Float(gifData.count) / 1024.0))kb")
            _gifView.gifData = compressData
            
        } catch {
            print("gif读取失败")
        }
        
        _gifView.startGIF()

        // Do any additional setup after loading the view.
    }
    
    @objc func closeAction() {
        _gifView.stopGIF()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
