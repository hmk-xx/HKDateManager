//
//  ViewController.swift
//  HKDateManagerApp
//
//  Created by Harish Kumar11 on 06/07/18.
//  Copyright © 2018 Harish Kumar11. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableViewDateFormatter: UITableView?
    @IBOutlet weak var textFieldDateFormatter: UITextField?
    @IBOutlet weak var textFieldCurrentDate: UITextField?
    @IBOutlet weak var textFieldChangeDate: UITextField?
    var isDropDown:Bool = false
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
    @IBAction func methodShowDateFormatter(sender: AnyObject) {
        
        self.methodDropDown(isOpen: isDropDown)
        
    }
    func methodDropDown(isOpen:Bool){
        if isOpen {
            isDropDown = false
            tableViewDateFormatter?.isHidden = true
        }else{
            isDropDown = true
            tableViewDateFormatter?.isHidden = false
        }
    }
    
    func methodGetCurrentDate()->NSDate{
        let date = Date() as NSDate
        return date
    }
    func methodSetCurrentDate(){
        self.textFieldDateFormatter?.text =  self.arrayDateFormatters[0]
        let stringCurrentDate:String = DateManagerClass.methodStringFromDate(dateFromString: self.methodGetCurrentDate(), stringDateFormatter: (textFieldDateFormatter?.text)!)
        self.textFieldCurrentDate?.text = stringCurrentDate
        self.textFieldChangeDate?.text = stringCurrentDate

    }
    func methodConvertDate(indexValue:Int){
        textFieldDateFormatter?.text = arrayDateFormatters[indexValue]
        
        let stringConvertDate:String = DateManagerClass.methodStringFromDate(dateFromString: self.methodGetCurrentDate(), stringDateFormatter: (textFieldDateFormatter?.text)!)
        self.textFieldChangeDate?.text = stringConvertDate
    }
// MARK: - UITableView Delegates & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return arrayDateFormatters.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = arrayDateFormatters[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.methodConvertDate(indexValue: indexPath.row)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

