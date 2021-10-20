//
//  AppDelegate.swift
//  FauxNotch
//
//  Created by Tanner W. Stokes on 10/20/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NotchWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let notchWidth: CGFloat = 170
        let notchHeight: CGFloat = 22
        
        var screenWidth: CGFloat {
            NSScreen.screens.first?.frame.width ?? 0
        }
        
        var screenHeight: CGFloat {
            NSScreen.screens.first?.frame.height ?? 0
        }
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view.
        window = NotchWindow(
            contentRect: NSRect(x: 0, y: 0, width: notchWidth, height: notchHeight),
            styleMask: [.borderless],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        let newRect = NSRect(
            x: (screenWidth / 2) - (notchWidth / 2),
            y: screenHeight - notchHeight,
            width: notchWidth,
            height: notchHeight
        )
        
        window.setFrame(newRect, display: true)
        window.level = .statusBar
        window.backgroundColor = .clear
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

/// An NSWindow subclass that's allowed to go over the Menu Bar
class NotchWindow: NSWindow {
    override func constrainFrameRect(_ frameRect: NSRect, to screen: NSScreen?) -> NSRect {
        return frameRect
    }
    
}
