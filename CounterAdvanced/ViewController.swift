//
//  ViewController.swift
//  CounterAdvanced
//
//  Created by Doryush Normatov on 11/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var numberOfBooksCount: UILabel!
    
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var decrementButton: UIButton!
    
    @IBOutlet weak var annulNumberButton: UIButton!
    
    private var numberOfBooks: Int = 0 {
        didSet {
            numberOfBooksCount.text = "\(numberOfBooks)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incrementButton.layer.cornerRadius = incrementButton.frame.height / 2
        
        decrementButton.layer.cornerRadius = decrementButton.frame.height / 2
        
        annulNumberButton.layer.cornerRadius = annulNumberButton.frame.height / 2
   
        historyTextView.text = "История изменений:\n\n"
    }
    
    
    @IBAction func incrementTapped(_ sender: Any) {
        numberOfBooks += 1
        addHistoryEntry("Значение изменено на +1\n")
    }
    
    @IBAction func decrementTapped(_ sender: Any) {
        if numberOfBooks >= 1 {
            numberOfBooks -= 1
            addHistoryEntry("Значение изменено на -1\n")
        }else {
            numberOfBooks = 0
            addHistoryEntry("Попытка уменьшить значение счётчика ниже 0\n")
        }
    }
    
    @IBAction func annulTapped(_ sender: Any) {
        numberOfBooks = 0
        addHistoryEntry("Значение сброшено\n")
    }
    
    private func addHistoryEntry(_ changeDescription: String) {
            let currentDateTime = getCurrentDateTime()
            let newEntry = "[\(currentDateTime)]: \(changeDescription)\n"
            historyTextView.text += newEntry
            let range = NSRange(location: historyTextView.text.count - 1, length: 1)
            historyTextView.scrollRangeToVisible(range)
        }
    
    private func getCurrentDateTime() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            return formatter.string(from: Date())
        }
}
