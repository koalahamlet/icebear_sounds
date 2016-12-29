//
//  ViewController.swift
//  test_soundboard
//
//  Created by mikehuff on 12/22/16.
//  Copyright © 2016 mikehuff. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var myTableView: UITableView!
    
    var audioplayers = [AVAudioPlayer]()
    
    class SoundByte {
        let name: String
        let internalName: String
        init(mName:String, mInternalName : String) {
            name = mName
            internalName = mInternalName
        }
    }
    
    
    let soundBytes = [
        SoundByte(mName: "thank you", mInternalName: "IB_jizomida"),
        SoundByte(mName: "hello", mInternalName: "IB_awnyawng"),]
    
    // needed for cell recycling
    let cellIdentifier = "asdfasdf"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in soundBytes {
//            URL(fileURLWithPath:)
            let isThisAnUrl = URL(fileURLWithPath: Bundle.main.path(forResource: sound.internalName, ofType: "mp3")!)
            do {
                print(isThisAnUrl)
                let audioplayer = try AVAudioPlayer(contentsOf: isThisAnUrl)
                audioplayers.append(audioplayer)
                print("I added a audioplayer")
            }
            catch {
                audioplayers.append(AVAudioPlayer())
                print("I failed an audioplayer")
            }
            
            
//            let url = Bundle.main.url(forResource: sound.internalName, withExtension: "mp3")!
        }
        
//        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")!
//        let audioPlayer = try AVAudioPlayer(contentsOf: url)
//        audioPlayers.append(audioPlayer)
        
        //maybe don't need these anymore
//        myTableView.dataSource = self
//        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func buttonClicked(_ sender: Any) {
        print("clicked button")
        for player in audioplayers {
            print(player.isPlaying)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
     return soundBytes.count
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = soundBytes[indexPath.row].name
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        audioplayers[indexPath.row].play()
        
//        do {
//            let url = Bundle.main.url(forResource: soundBytes[indexPath.row].internalName, withExtension: "mp3")!
//            print(url)
//            let audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer.play()
//            print("played cell \(indexPath.row)")
//        } catch {
//            print("error cell \(indexPath.row)")
//        
//        }
        
        print("clicked cell \(indexPath.row)")
    }
    
}

