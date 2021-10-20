//
//  ContentView.swift
//  FauxNotch
//
//  Created by Tanner W. Stokes on 10/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NotchShape()
            .fill(Color.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
