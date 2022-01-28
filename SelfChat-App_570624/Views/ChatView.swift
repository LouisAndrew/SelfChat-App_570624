//
//  ChatView.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 28.01.22.
//

import SwiftUI

struct ChatView: View {
    var chatPartner: ChatPartner
    
    var body: some View {
        Text("Chatting with: " + chatPartner.name)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatPartner: ChatPartner(name: "L1"))
    }
}
