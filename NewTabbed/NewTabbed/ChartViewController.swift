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
    func init_graph()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = false
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        
        
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: Double(inc_sum),label: "Income"))
        entries.append(PieChartDataEntry(value: Double(exp_sum),label: "Expense"))
        let dataSet = PieChartDataSet(entries :entries, label: "")		
        let c1 = NSUIColor(hex: 0x3A015C)
        let c2 = NSUIColor(hex: 0x4F0147)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        dataSet.colors = [c1, c2, c3, c4, c5]
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //pieChart.isHidden = true
        init_graph()
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
