//
//  ViewController.swift
//  Streamming VideoApp
//
//  Created by Sina Taherkhani on 8/27/1400 AP.
//

import UIKit
import StrimmingVideo
class ViewController: UIViewController {

    private let videoplayer = StrimmingVideoPlayer()
    
    @IBOutlet var Url_Text: UITextField!
    @IBOutlet var PlayView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        videoplayer.add(view: PlayView)
        self.hideKeyboardWhenTappedAround()
    }
    @IBAction func Play(_ sender: Any) {
        guard let text = Url_Text.text, let url = URL(string: text) else { return }
        videoplayer.play(url: url)
    }
    @IBAction func Stop(_ sender: Any) {
        videoplayer.puase()
    }    
    @IBAction func Clear(_ sender: Any) {
        Url_Text.text = nil
        videoplayer.puase()
    }
    
}
extension ViewController{
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
