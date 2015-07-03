//
//  EsportesViewController.swift
//  Wchair
//
//  Created by Vitor on 6/21/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit

class EsportesViewController: UIViewController {

    @IBOutlet weak var imagemScroll: UIScrollView!
    @IBOutlet weak var esporteDescription: UITextView!
    
    @IBOutlet weak var SegControl: UISegmentedControl!
    var esporte: Esporte?
    
    @IBAction func SegAction(sender: UISegmentedControl) {
        
        switch SegControl.selectedSegmentIndex{
        case 0:
            esporteDescription.text = esporte?.descricao
        case 1:
            esporteDescription.text = esporte?.classificacao
        case 2:
            esporteDescription.text = esporte?.modoDisputa
            
        default:
            break
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        esporteDescription.text = esporte!.descricao
        
        let image1 = UIImage(named: "Rugby")
        let image2 = UIImage(named: "Rugby2")
        let image3 = UIImage(named: "Rugby3")
        
        var colors:[UIColor] = [UIColor(patternImage: image1!), UIColor(patternImage: image2!), UIColor(patternImage: image3!)]
        var frame: CGRect = CGRectMake(0, 0, 0, 0)
        
        for index in 0..<colors.count {
            
            frame.origin.x = self.imagemScroll.frame.size.width * CGFloat(index)
            frame.size = self.imagemScroll.frame.size
            self.imagemScroll.pagingEnabled = true
            
            var subView = UIView(frame: frame)
            subView.backgroundColor = colors[index]
            self.imagemScroll.addSubview(subView)
        }
        
        self.imagemScroll.contentSize = CGSizeMake(self.imagemScroll.frame.size.width * CGFloat(colors.count), self.imagemScroll.frame.size.height)
        
        self.title = esporte!.modalidade
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
