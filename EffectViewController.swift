//
//  EffectViewController.swift
//  Camera.swift
//
//  Created by 安田 悠麿 on 2020/08/13.
//  Copyright © 2020 安田 悠麿. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        effectimage.image = originalImage
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var originalImage : UIImage?
    @IBOutlet weak var effectimage: UIImageView!
    
    @IBAction func effectButtonAction(_ sender: Any) {
//        エフェクト前画像をアンラップしてエフェクト画像として取り出す
        if let image = originalImage{
        
//        フィルター名を指定
        let filterName = "CIPhotoEffectMono"
            let rotate = image.imageOrientation
            let inputImage = CIImage(image: image)
            guard let effectFilter = CIFilter(name: filterName) else {
                return
            }
//            エフェクトのパラメータを初期化
            effectFilter.setDefaults()
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            guard let outputImage = effectFilter.outputImage else{
                return
            }
//            CIContextのインスタンスを取得
            let ciContext = CIContext(options: nil)
            
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                return
            }
            effectimage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
        }
        
        
    }
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
