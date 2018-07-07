//
//  ViewController.swift
//  HKDateManagerApp
//
//  Created by Harish Kumar11 on 06/07/18.
//  Copyright © 2018 Harish Kumar11. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var pickerViewDateFormatter: UIPickerView?
    @IBOutlet weak var textFieldCurrentDate: UITextField?
    @IBOutlet weak var textFieldChangeDate: UITextField?
    var arrayDateFormatters = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayDateFormatters.append("yyyy-MM-dd'T'HH:mm:ssZ")
        arrayDateFormatters.append("EEEE, MMM d, yyyy")
        arrayDateFormatters.append("MM/dd/yyyy")
        arrayDateFormatters.append("MM-dd-yyyy HH:mm")
        arrayDateFormatters.append("MMM d, h:mm a")
        arrayDateFormatters.append("MMMM yyyy")
        arrayDateFormatters.append("MMM d, yyyy")
        arrayDateFormatters.append("E, d MMM yyyy HH:mm:ss Z")
        arrayDateFormatters.append("dd.MM.yy")
        
        self.methodSetCurrentDate()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func methodGetCurrentDate()->NSDate{
        let date = Date() as NSDate
        return date
    }
    func methodSetCurrentDate(){
        let stringCurrentDate:String = DateManagerClass.methodStringFromDate(dateFromString: self.methodGetCurrentDate(), stringDateFormatter: arrayDateFormatters[0])
        self.textFieldCurrentDate?.text = stringCurrentDate
        self.textFieldChangeDate?.text = stringCurrentDate

    }
    func methodConvertDate(indexValue:Int){
        
        let stringConvertDate:String = DateManagerClass.methodStringFromDate(dateFromString: self.methodGetCurrentDate(), stringDateFormatter: arrayDateFormatters[indexValue])
        self.textFieldChangeDate?.text = stringConvertDate
    }
// MARK: - UIPickerView Delegates & DataSource
    // The number of columns of data
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1

    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDateFormatters.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDateFormatters[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.methodConvertDate(indexValue: row)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

