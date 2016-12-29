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
//    name: "believed in you",
//    url: "IB_believed_in_you.mp3"
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
//    {
//    name: "needs bug spray",
//    url: "IB_bug_spray.mp3"
//    },
//    {
//    name: "is survivor",
//    url: "IB_is_survivor.mp3"
//    },
//    {
//    name: "made her a pashmina",
//    url: "IB_made_a_pajmina.mp3"
//    },
//    {
//    name: "settled that",
//    url: "IB_settled_that.mp3"
//    },
//    {
//    name: "likes turtle",
//    url: "IB_turtle.mp3"
//    },
//    {
//    name: "don't ditch",
//    url: "IB_dont_ditch.mp3"
//    },
//    {
//    name: "turtleneck",
//    url: "IB_turtle_neck.mp3"
//    },
//    {
//    name: "miss yoga",
//    url: "IB_miss_yoga.mp3"
//    },
//    {
//    name: "smells like clean babies",
//    url: "IB_cleanbabies.mp3"
//    },
//    {
//    name: "hates butts",
//    url: "IB_hates_butts.mp3"
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
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
//        SoundByte(mName: "", mInternalName: "IB_"),
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

