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
    
//    
//    {
//    name: "tote wrap",
//    url: "tote_wrap.mp3"
//    },
//    {
//    name: "tote life",
//    url: "IB_tote_life.mp3"
//    },
//    {
//    name: "best thing",
//    url: "IB_best_thing_to_happen.mp3"
//    },
//    {
//    name: "enjoys basking",
//    url: "IB_enjoys_basking.mp3"
//    },
//    {
//    name: "will coach you",
//    url: "IB_coach_you_manhood.mp3"
//    },
//    {
//    name: "still proud",
//    url: "IB_is_still_proud.mp3"
//    },
//    {
//    name: "thinks you're precious",
//    url: "IB_thinks_youre_precious.mp3"
//    },
//    {
//    name: "will not bless you",
//    url: "IB_will_not_bless_you.mp3"
//    },
//    {
//    name: "top bear now",
//    url: "IB_wants_top_bear.mp3"
//    },


    
    let soundBytes = [
        SoundByte(mName: "Merry Xmas Min!", mInternalName: "IB_koreanxmasheaven"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
        SoundByte(mName: "needs bug spray", mInternalName: "IB_bug_spray"),
        SoundByte(mName: "is survivor", mInternalName: "IB_is_survivor"),
        SoundByte(mName: "made her a pashmina", mInternalName: "IB_made_a_pajmina"),
        SoundByte(mName: "settled that", mInternalName: "IB_settled_that"),
        SoundByte(mName: "likes turtle", mInternalName: "IB_turtle"),
        SoundByte(mName: "don't ditch", mInternalName: "IB_dont_ditch"),
        SoundByte(mName: "turtle neck", mInternalName: "IB_turtle_neck"),
        SoundByte(mName: "miss yoga", mInternalName: "IB_miss_yoga"),
        SoundByte(mName: "cleanbabies", mInternalName: "IB_cleanbabies"),
        SoundByte(mName: "hates butts", mInternalName: "IB_hates_butts"),
        SoundByte(mName: "believed in you", mInternalName: "IB_believed_in_you"),
        SoundByte(mName: "is in", mInternalName: "IB_is_in"),
        SoundByte(mName: "too many secrets", mInternalName: "IB_too_many_secrets"),
        SoundByte(mName: "ossuoshipshoe", mInternalName: "IB_ossuoshipshoe"),
        SoundByte(mName: "poodi something", mInternalName: "IB_poogi_something"),
        SoundByte(mName: "shilliyagisamnidad", mInternalName: "IB_shilliyagisamnidad"),
        SoundByte(mName: "jizomida", mInternalName: "IB_jizomida"),
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

