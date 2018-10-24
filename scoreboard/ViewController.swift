//
//  ViewController.swift
//  scoreboard
//
//  Created by Verónica Matos on 16/10/18.
//  Copyright © 2018 DpT. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    /** VISITANTE */
    @IBOutlet weak var labelScoreVisitante: NSTextField!
    @IBOutlet weak var stepperScoreVisitante: NSStepper!
    @IBOutlet weak var labelFaltasVisitante: NSTextField!
    @IBOutlet weak var stepperFaltasVisitante: NSStepper!
    /** LOCAL */
    @IBOutlet weak var labelScoreLocal: NSTextField!
    @IBOutlet weak var stepperScoreLocal: NSStepper!
    @IBOutlet weak var labelFaltasLocal: NSTextField!
    @IBOutlet weak var stepperFaltasLocal: NSStepper!
    /** PERIOD */
    @IBOutlet weak var labelPeriodo: NSTextField!
    @IBOutlet weak var stepperPeriodo: NSStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stepperScoreVisitanteChanged(self)
        stepperScoreLocalChanged(self)
        stepperFaltasLocalChanged(self)
        stepperFaltasVisitanteChanged(self)
        stepperPeriodoChanged(self)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    /**
     * Updates labelScoreLocal on stepper change and writes value in file
     */
    @IBAction func stepperScoreLocalChanged(sender: AnyObject) {
        let scoreLocal = stepperScoreLocal.integerValue
        labelScoreLocal.stringValue = "\(scoreLocal)"
        writeInFile(scoreLocal, fileName: "scoreLocal")
    }
    
    /**
     * Updates labelScoreVisitante on stepper change and writes value in file
     */
    @IBAction func stepperScoreVisitanteChanged(sender: AnyObject) {
        let scoreVisitante = stepperScoreVisitante.integerValue
        labelScoreVisitante.stringValue = "\(scoreVisitante)"
        writeInFile(scoreVisitante, fileName: "scoreVis")
    }
    
    
    /**
     * Updates labelFaltasLocal on stepper change and writes value in file
     */
    @IBAction func stepperFaltasLocalChanged(sender: AnyObject) {
        let faltasLocal = stepperFaltasLocal.integerValue
        labelFaltasLocal.stringValue = "\(faltasLocal)"
        writeInFile(faltasLocal, fileName: "faltasLocal")
    }
    
    /**
     * Updates labelFaltasVisitante on stepper change and writes value in file
     */
    @IBAction func stepperFaltasVisitanteChanged(sender: AnyObject) {
        let faltasVisitante = stepperFaltasVisitante.integerValue
        labelFaltasVisitante.stringValue = "\(faltasVisitante)"
        writeInFile(faltasVisitante, fileName: "faltasVis")
    }
    
    /**
     * Resets faults
     */
    @IBAction func resetFaltasButton(sender: AnyObject) {
        let resetValue = 0
        labelFaltasLocal.stringValue = "\(resetValue)"
        labelFaltasVisitante.stringValue = "\(resetValue)"
        stepperFaltasLocal.integerValue = resetValue
        stepperFaltasVisitante.integerValue = resetValue
        writeInFile(resetValue, fileName: "faltasVis")
        writeInFile(resetValue, fileName: "faltasLocal")
    }
    
    /**
     * Updates labelPeriodo on stepper change and writes value in file
     */
    @IBAction func stepperPeriodoChanged(sender: AnyObject) {
        let periodo = stepperPeriodo.integerValue
        labelPeriodo.stringValue = "\(periodo)"
        writeInFile(periodo, fileName: "periodo")
    }
    
    /**
     * Writes in fileName.txt file the value specified
     */
    func writeInFile(value: Int, fileName: String){
        let path = "/Users/SalomeMatos/Documents/XcodeProjects/scoreboard/scoreboard/\(fileName).txt"
        let text = "\(value)"
        
        do {
            try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }catch let error as NSError {
            print("[ERROR] ViewController.writeInFile: \(error)")
        }
    
    }
}

