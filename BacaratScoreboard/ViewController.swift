//
//  ViewController.swift
//  BacaratScoreboard
//
//  Created by Alumno on 17/10/17.
//  Copyright © 2017 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var banker: UIButton!
    @IBOutlet var player: UIButton!
    @IBOutlet var tie: UIButton!
    @IBOutlet var thrashcan: UIButton!
    
    @IBOutlet var bankerScore: UILabel!
    @IBOutlet var tieScore: UILabel!
    @IBOutlet var playerScore: UILabel!
    
    @IBOutlet var Scoreboard: UICollectionView!
    
    var bankerWins:Int = 0
    var playerWins:Int = 0
    var tieWins:Int = 0
    
    var images:[String] = ["caret-down"]
    override func viewDidLoad() {
        super.viewDidLoad()
        banker.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        player.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        tie.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        thrashcan.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.Scoreboard.delegate = self
        self.Scoreboard.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonClicked(sender: AnyObject?) {
        //Al llenarse la pantalla, que el siguiente click limpie las imagenes sin perder la cuenta de cuantas veces gano cada cual.
        if(images.count > 48) {
            images.removeAll()
            Scoreboard.reloadData()
        }
        
        if sender === banker {
            bankerWins++
            images.insert("banker", atIndex:images.count)
            Scoreboard.reloadData()
            loadLabelScore()
        } else if sender === player {
            playerWins++
            images.insert("player", atIndex:images.count)
            Scoreboard.reloadData()
            loadLabelScore()
        } else if sender === tie {
            tieWins++
            images.insert("tie", atIndex:images.count)
            Scoreboard.reloadData()
            loadLabelScore()
        } else if sender === thrashcan {
            bankerWins = 0
            playerWins = 0
            tieWins = 0
            images.removeAll()
            Scoreboard.reloadData()
            loadLabelScore()
        }
    }
    
    func loadLabelScore() {
        bankerScore.text = "\(bankerWins)"
        playerScore.text = "\(playerWins)"
        tieScore.text = "\(tieWins)"
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collection_cell", forIndexPath: indexPath) as! MyCollectionViewCell
        cell.myImageView.image = UIImage(named: images[indexPath.row])
        return cell;
    }

}

