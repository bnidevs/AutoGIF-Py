//
//  Functionals.swift
//  AutoGIF Spooler
//
//  Created by Bill Ni on 2/12/22.
//

import Foundation
import Aperture
import AVFoundation

class Recorder {
    public var recorder: Aperture!
    public var fileType: Bool = false
    // false == WEBM, true == GIF
    
    init() {
        let paths = FileManager.default.urls(for: .moviesDirectory, in: .userDomainMask)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd--HH:mm:ss"
        let url = URL(string: paths[0].absoluteString + "AutoGIF-" + dateformatter.string(from: Date()) + ".mp4")!
        recorder = try! Aperture(destination: url, videoCodec: AVVideoCodecType.h264)
    }

    func startStop(){
        if(recorder.isRecording){
            recorder.stop()
        }else{
            recorder.start()
        }
    }

    func changeFileType(){
        fileType = !fileType;
    }
}
