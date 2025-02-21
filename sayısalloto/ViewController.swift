//
//  ViewController.swift
//  sayısalloto
//
//  Created by Trakya7 on 21.02.2025.
//
import UIKit

class ViewController: UIViewController {

    // IBOutlet'ları bağla (6 adet UILabel)
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    // Sayılar için bir fonksiyon oluşturacağız
    @IBAction func generateNumbers(_ sender: UIButton) {
        let numbers = generateLotoNumbers()
        
        // Sayıları ve renkleri etiketlere yerleştir
        label1.text = String(numbers[0])
        label2.text = String(numbers[1])
        label3.text = String(numbers[2])
        label4.text = String(numbers[3])
        label5.text = String(numbers[4])
        label6.text = String(numbers[5])
        
        // Etiketlerin arka planlarını ve metin renklerini rastgele değiştir
        setLabelColor(label: label1)
        setLabelColor(label: label2)
        setLabelColor(label: label3)
        setLabelColor(label: label4)
        setLabelColor(label: label5)
        setLabelColor(label: label6)
        
        // Buton rengini değiştirme
        setButtonColor(button: sender)
    }
    
    // Sayısal loto sayıları oluşturma fonksiyonu
    func generateLotoNumbers() -> [Int] {
        var numbers = Set<Int>()
        
        // 6 farklı rastgele sayı üret (1-49 arası)
        while numbers.count < 6 {
            let randomNumber = Int.random(in: 1...49)
            numbers.insert(randomNumber)
        }
        
        // Set'i diziye çevir ve sıralama işlemi yap
        return Array(numbers).sorted()
    }

    // Etiketin arka plan rengini ve metin rengini rastgele ayarla
    func setLabelColor(label: UILabel) {
        let randomColor = randomColor()  // Rastgele renk seç
        label.backgroundColor = randomColor
        
        // Metin rengi ile kontrast bir renk ayarla
        label.textColor = (randomColor.isLight()) ? .black : .white
    }

    // Buton rengini değiştirme fonksiyonu
    func setButtonColor(button: UIButton) {
        let randomColor = randomColor()  // Rastgele renk seç
        button.backgroundColor = randomColor
        button.setTitleColor(.white, for: .normal)
    }
    
    // Rastgele renk üreten fonksiyon
    func randomColor() -> UIColor {
        // Renk oluştururken daha kontrollü bir şekilde renk seçimi yapabiliriz
        let red = CGFloat.random(in: 0.5...1.0)   // Renk tonlarını biraz daha kısıtlayabiliriz
        let green = CGFloat.random(in: 0.5...1.0)
        let blue = CGFloat.random(in: 0.5...1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// UIColor extension: Renklerin açık mı koyu mu olduğunu kontrol etmek için
extension UIColor {
    func isLight() -> Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5
    }
}

