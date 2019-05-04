//
//  AddViewController.swift
//  NewTabbed
//
//  Created by Student on 08/04/19.
//  Copyright © 2019 ACEaceaceace. All rights reserved.
//

import UIKit
import CoreData

var incomeData = [Any]()

var contentsData = [Any]()
var incData = [Any]()
var exp = 100
var acc = ""
var cat = ""
var amt = 0
var con = ""
var inc_sum = 0
var exp_sum = 0


class AddViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var expenseButtonTitle: UIButton!
    @IBOutlet weak var incomeButtonTitle: UIButton!
    @IBOutlet weak var categoryButtonTitle: UIButton!
    @IBOutlet weak var accountButtonTitle: UIButton!

    @IBAction func subviewclose(_ sender: Any)
    {
        subviewclose()
    }

    
    @IBOutlet weak var categoryincomesubview: UIView!
    @IBOutlet weak var categorysubview: UIView!
    @IBOutlet weak var accountsubview: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        categorysubview.isHidden = true
        accountsubview.isHidden = true
        categoryincomesubview.isHidden = true
        self.contents.delegate = self
        save1.applydesign()
        save1.backgroundColor = UIColor(hex: 0x63B221)
        sampletextfield.isUserInteractionEnabled = false
        sampletextfield1.isUserInteractionEnabled = false

    }
 


    @IBOutlet weak var sampletextfield1: UITextField!
    @IBOutlet weak var sampletextfield: UITextField!
    @IBOutlet weak var expsample: UIButton!
    @IBOutlet weak var incsample: UIButton!
    @IBOutlet weak var save1: UIButton!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contents.resignFirstResponder()
        return (true)
    }
    @IBAction func accountsClicked(_ sender: Any)
    {
        /*UIView.transition(with: categorysubview, duration: 1000, options: [.curveEaseIn, .transitionCrossDissolve], animations:{
            self.categorysubview.isHidden = true
        }, completion: nil)*/
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .showHideTransitionViews, animations: {
        }, completion: nil)
        self.categorysubview.isHidden = true
        self.accountsubview.isHidden = false
        self.categoryincomesubview.isHidden = true
    }
    @IBAction func categoryClicked(_ sender: Any)
    {
        flowingsubviewscategory()
    }
    @IBOutlet weak var contents: UITextField!
    @IBOutlet weak var amount: UITextField!
    func flowingsubviewscategory(){
        if(exp == 0)
        {
            categorysubview.isHidden = false
            accountsubview.isHidden = true
            categoryincomesubview.isHidden = true
        }
        if(exp == 1)
        {
            categorysubview.isHidden = true
            accountsubview.isHidden = true
            categoryincomesubview.isHidden = false
        }
        if(exp == 100)
        {
            let alert = UIAlertController(title: "Please select the expense type", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    func subviewclose(){
        categorysubview.isHidden = true
        accountsubview.isHidden = true
        categoryincomesubview.isHidden = true
    }
    @IBAction func incomeClicked(_ sender: Any)
    {
        exp = 1
        //incomeButtonTitle.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        expenseButtonTitle.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        expenseButtonTitle.setTitleColor(UIColor.black, for: .normal)
        incsample.applydesign1()
        accountsubview.isHidden = false
    }
    @IBAction func cashClicked(_ sender: Any)
    {
        acc = "Cash"
        accountButtonTitle.setTitle("Cash",for: .normal)
        sampletextfield.text = "Cash"
        flowingsubviewscategory()
    }
    
    @IBAction func allowanceClicked(_ sender: Any) {
        cat = "Allowance";categoryButtonTitle.setTitle("Allowance",for: .normal)
        sampletextfield1.text = "Allowance"
        subviewclose()
    }
    
    @IBAction func salaryClicked(_ sender: Any) {
        cat = "Salary";categoryButtonTitle.setTitle("Salary",for: .normal)
        sampletextfield1.text = "Salary"
        subviewclose()
    }
    
    @IBAction func bonusClicked(_ sender: Any) {
        cat = "Bonus";categoryButtonTitle.setTitle("Bonus",for: .normal)
        sampletextfield1.text = "Bonus"
        subviewclose()
    }
    @IBAction func accountClicked(_ sender: Any)
    {
        acc = "Account";accountButtonTitle.setTitle("Account",for: .normal)
        sampletextfield.text = "Account"
        flowingsubviewscategory()
        
    }
    @IBAction func cardClicked(_ sender: Any)
    {
        acc = "Card";accountButtonTitle.setTitle("Card",for: .normal)
        sampletextfield.text = "Card"
        flowingsubviewscategory()
        
    }
    @IBAction func expenseClicked(_ sender: Any)
    {
        exp = 0
        //expenseButtonTitle.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        incomeButtonTitle.backgroundColor = UIColor(red: 1, green: 1.0, blue: 1, alpha: 0.5)
        incomeButtonTitle.setTitleColor(UIColor.black, for: .normal)
        expsample.applydesign1()
        accountsubview.isHidden = false
    }
    @IBAction func foodClicked(_ sender: Any)
    {
        cat = "Food";categoryButtonTitle.setTitle("Food",for: .normal)
        sampletextfield1.text = "Food"
        subviewclose()
    }
    @IBAction func SlifeClicked(_ sender: Any)
    {
        cat = "Social-Life";categoryButtonTitle.setTitle("Social-Life",for: .normal)
        sampletextfield1.text = "Social-Life"
        subviewclose()
    }
    @IBAction func selfdevClicked(_ sender: Any)
    {
        cat = "Self-Development";categoryButtonTitle.setTitle("Self-Development",for: .normal)
        sampletextfield1.text = "Self-Dev"
        subviewclose()
    }
    @IBAction func transportClicked(_ sender: Any)
    {
        cat = "Transportation";categoryButtonTitle.setTitle("Transport",for: .normal)
        sampletextfield1.text = "Transportation"
        subviewclose()
    }
    @IBAction func cultureClicked(_ sender: Any)
    {
        cat = "Culture";categoryButtonTitle.setTitle("Culture",for: .normal)
        sampletextfield1.text = "Culture"
        subviewclose()
    }
    @IBAction func householdClicked(_ sender: Any)
    {
        cat = "Household";categoryButtonTitle.setTitle("Household",for: .normal)
        sampletextfield1.text = "Household"
        subviewclose()
    }
    @IBAction func apparelClicked(_ sender: Any)
    {
        cat = "Apparel";categoryButtonTitle.setTitle("Apparel",for: .normal)
        sampletextfield1.text = "Apparel"
        subviewclose()
    }
    @IBAction func beautyClicked(_ sender: Any)
    {
        cat = "Beauty";categoryButtonTitle.setTitle("Beauty",for: .normal)
        sampletextfield1.text = "Beauty"
        subviewclose()
    }
    @IBAction func healthClicked(_ sender: Any)
    {
        cat = "Health";categoryButtonTitle.setTitle("Health",for: .normal)
        sampletextfield1.text = "Health"
        subviewclose()
    }
    @IBAction func educationClicked(_ sender: Any)
    {
        cat = "Education";categoryButtonTitle.setTitle("Education",for: .normal)
        sampletextfield1.text = "Education"
        subviewclose()
    }
    @IBAction func giftClicked(_ sender: Any)
    {
        cat = "Gift";categoryButtonTitle.setTitle("Gift",for: .normal)
        sampletextfield1.text = "Gift"
        subviewclose()
    }
    @IBAction func othersClicked(_ sender: Any)
    {
        cat = "Others";categoryButtonTitle.setTitle("Others",for: .normal)
        subviewclose()
    }
    func getContext() -> NSManagedObjectContext
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    @IBAction func SAVEClicked(_ sender: Any)
    {
        
            if ((acc != "") && (cat != "") && ((amount.text!) != "") && ((contents.text!) != ""))
            {
                let context = getContext()
                let newData = NSEntityDescription.insertNewObject(forEntityName: "Added_Data", into: context)
                newData.setValue(exp, forKey: "inc_exp")
                newData.setValue(acc, forKey: "account")
                newData.setValue(cat, forKey: "category")
                newData.setValue(Int(amount.text!)!, forKey:"amount")
                newData.setValue(contents.text!, forKey: "contents")
                let date = Date()
                newData.setValue(date , forKey: "date")
                do
                {
                    try context.save()
                }
                catch let err
                {
                    print(err.localizedDescription)
                }
                
            }
            else
            {
                let alert = UIAlertController(title: "Fill all the details", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }

