//
//  ChartViewController.swift
//  NewTabbed
//
//  Created by admin on 28/04/19.
//  Copyright © 2019 ACEaceaceace. All rights reserved.
//

import UIKit
import Charts
class ChartViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var incexpchart: UIButton!
    @IBOutlet weak var incomeschart: UIButton!
    @IBOutlet weak var expenseschart: UIButton!
    //inc vs exp
    
    @IBAction func incecpchartClicked(_ sender: Any) {
        init_graph_Inc_Exp()
    }
    
    @IBAction func incomeschartClicked(_ sender: Any)
    {
        //all income categories total
        inc_cat()
    }
    
    @IBAction func expenseschartClicked(_ sender: Any)
    {
        //all expenses categories total
        exp_cat()
    }
    func inc_cat()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: Double(allowance),label: "Allowance"))
        entries.append(PieChartDataEntry(value: Double(salary),label: "Salary"))
        entries.append(PieChartDataEntry(value: Double(bonus),label: "Bonus"))
        let dataSet = PieChartDataSet(entries :entries, label: "")
        let c1 = NSUIColor(hex: 0x63B221)
        let c2 = NSUIColor(hex: 0x376114)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        dataSet.colors = [c1, c2, c3, c4, c5]
        
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
        
    }
    func init_graph_Inc_Exp()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: Double(inc_sum),label: "Income"))
        entries.append(PieChartDataEntry(value: Double(exp_sum),label: "Expense"))
        let dataSet = PieChartDataSet(entries :entries, label: "")		
        let c1 = NSUIColor(hex: 0x63B221)
        let c2 = NSUIColor(hex: 0x376114)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        dataSet.colors = [c1, c2, c3, c4, c5]
        
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
    }
    func exp_cat()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: Double(food),label: "Food"))
        entries.append(PieChartDataEntry(value: Double(social),label: "Social"))
        entries.append(PieChartDataEntry(value: Double(self_dev),label: "Self-Developemt"))
        entries.append(PieChartDataEntry(value: Double(transportation),label: "Transportation"))
        entries.append(PieChartDataEntry(value: Double(culture),label: "Culture"))
        entries.append(PieChartDataEntry(value: Double(house),label: "Household"))
        entries.append(PieChartDataEntry(value: Double(apparrel),label: "Apparel"))
        entries.append(PieChartDataEntry(value: Double(beauty),label: "Beauty"))
        entries.append(PieChartDataEntry(value: Double(health),label: "Health"))
        entries.append(PieChartDataEntry(value: Double(education),label: "Education"))
        entries.append(PieChartDataEntry(value: Double(gift),label: "Gift"))
        entries.append(PieChartDataEntry(value: Double(others),label: "Others"))
        let dataSet = PieChartDataSet(entries :entries, label: "")
        let c1 = NSUIColor(hex: 0x63B221)
        let c2 = NSUIColor(hex: 0x376114)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        let c6 = NSUIColor(hex: 0x63B221)
        let c7 = NSUIColor(hex: 0x376114)
        let c8 = NSUIColor(hex: 0x35012C)
        let c9 = NSUIColor(hex: 0x290025)
        let c10 = NSUIColor(hex: 0x11001C)
        let c11 = NSUIColor(hex: 0x63B221)
        let c12 = NSUIColor(hex: 0x376114)
       
        
        dataSet.colors = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12]
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
    }
       //income
    override func viewDidLoad()
    {
        super.viewDidLoad()
        incexpchart.applydesign1()
        incomeschart.applydesign1()
        expenseschart.applydesign1()
        //pieChart.isHidden = true
        
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
