//
//  ContentView.swift
//  AutoGIF Spooler
//
//  Created by Bill Ni on 2/12/22.
//

import SwiftUI
import Aperture

struct ContentView: View {
    @Binding public var recorder: Recorder
    
    @State public var recordingState = false
    @State public var fileType = true
    @State public var writing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("AutoGIF")
                .font(.system(size: 18, weight: .bold))
                .padding([.leading], 10)
            VStack(alignment: .center){
                HStack(alignment: .center, spacing: 10){
                    Text("Recording")
                        .font(.system(size: 16, weight: .semibold))
                    Circle()
                        .fill(recordingState ? Color.red : Color.gray)
                        .frame(width: 10, height: 10)
                }
                    .frame(width: 200, height: 20, alignment: .topLeading)
                Button(recordingState ? "Stop" : "Start", action: callSS)
            }
                .frame(width: 200, height: 50)
                .padding(10)
                .background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.3))
                .cornerRadius(5)
            VStack(alignment: .center){
                HStack(alignment: .center, spacing: 10){
                    Text("File Output")
                        .font(.system(size: 16, weight: .semibold))
                }
                    .frame(width: 200, height: 20, alignment: .topLeading)
                HStack(alignment: .center, spacing: 10){
                    HStack(alignment: .center) {
                        Text(fileType ? "GIF" : "WEBM")
                            .font(.system(size: 14))
                    }
                        .frame(width: 50, height: 20, alignment: .center)
                    Toggle("", isOn: $fileType)
                        .toggleStyle(SwitchToggleStyle())
                }
                    .frame(width: 200, height: 20, alignment: .center)
            }
                .frame(width: 200, height: 50)
                .padding(10)
                .background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.3))
                .cornerRadius(5)
            HStack(alignment: .center){
                Text("Status: " + (writing ? "Writing" : "Idle"))
                    .font(.system(size: 14))
                Spacer()
                Button("Quit", action: {NSApp.terminate(self)})
                    .disabled(writing)
            }
                .frame(width: 200, height: 20, alignment: .center)
                .padding(10)
        }
            .frame(width: 200, height: 220, alignment: .center)
            .padding(20)
    }
    
    func callSS(){
        recordingState = !recordingState
        recorder.startStop()
    }
    
    func switchFT(){
        fileType = !fileType
//        apd.recorder.changeFileType()
    }
}
