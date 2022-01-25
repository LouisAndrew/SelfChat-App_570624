//
//  SelectPartnerMenu.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import SwiftUI

struct SelectPartnerMenu: View {
    
    @ObservedObject var chatPartnersController = ChatPartnersController.controller
    @State var counter = 0
    
    var body: some View {
        HStack {
            ForEach(chatPartnersController.chatPartners.partners, id: \.self) { partner in
                Text(partner.name)
            }
            Button(action: {
                chatPartnersController.addChatPartner(name: "P" + String(counter))
                counter += 1
            }, label: {
                Text("Add chat partner")
            })
        }
    }
}

struct SelectPartnerMenu_Previews: PreviewProvider {
    static var previews: some View {
        SelectPartnerMenu()
    }
}
