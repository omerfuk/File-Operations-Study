//
//  ViewController.swift
//  File Islemleri Uygulama
//
//  Created by Ömer Faruk Kılıçaslan on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resimTutucu: UIImageView!
    @IBOutlet weak var textFieldGirdi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func yaz(_ sender: Any) {
        
        let mesaj:String = textFieldGirdi.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            do{
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                
                textFieldGirdi.text = ""
                
            }catch{
                print("Dosya hata oluştu")
            }
        }
    }
    
    @IBAction func oku(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            do{
                textFieldGirdi.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
                
                
            }catch{
                print("Dosya okunurken hata oluştu")
            }
        }
        
    }
    @IBAction func sil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                    textFieldGirdi.text = ""
                    
                    
                }catch{
                    print("Dosya silinrken hata oluştu")
                }
            }
            
            
        }
    }
    @IBAction func resimKaydet(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("resimim.png")
            
            let resim = UIImage(named: "resim")
                
                do{
                    try resim!.pngData()?.write(to: dosyaYolu)
                    
                    
                }catch{
                    print("Resim Kaydedilirken hata oluştu")
                }
            }
        
        
    }
    @IBAction func resimGoster(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("resimim.png")
            
            self.resimTutucu.image = UIImage(contentsOfFile: dosyaYolu.path)
        }
    }
    @IBAction func resimSil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let dosyaYolu = dir.appendingPathComponent("resimim.png")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                    
                    
                    
                }catch{
                    print("Resim silinrken hata oluştu")
                }
            }
    }
}

}
