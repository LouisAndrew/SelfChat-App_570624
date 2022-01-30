//
//  SelectPartnerMenu.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import SwiftUI

struct PartnerLink: View {
    var chatPartner: ChatPartner
    
    func getRandomColor() -> Color {
        let colors: [Color] = [.red, .indigo, .green, .brown, .mint, .indigo]
        return colors[Int.random(in: 0..<colors.count)]
    }
    
    var body: some View {
        NavigationLink(destination: ChatView(chatPartner: chatPartner)) {
            ZStack {
                Circle()
                    .fill(getRandomColor())
                    .frame(width: 100, height: 100)
                Text(chatPartner.name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 32))
            }
        }
    }
}

struct SelectPartnerMenu: View {
    
    @ObservedObject var chatPartnersController = ChatPartnersController.controller
    
    func newPartner() {
        let amountOfPartners = chatPartnersController.chatPartners.partners.count
        chatPartnersController.addChatPartner(name: "P" + String(amountOfPartners))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        if chatPartnersController.chatPartners.partners.count == 0 {
                            Text("No partners found. Click the button below to start chatting")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .padding(.bottom, 32)
                                .padding([.trailing, .leading], 64)
                        } else {
                            VStack {
                                ForEach(chatPartnersController.chatPartners.getPartners(odd: true), id: \.self) { partner in
                                    PartnerLink(chatPartner: partner)
                                }
                            }
                            .padding([.leading, .trailing], 16)
                            
                            VStack {
                                ForEach(chatPartnersController.chatPartners.getPartners(odd: false), id: \.self) { partner in
                                    PartnerLink(chatPartner: partner)
                                }
                            }
                            .padding([.leading, .trailing], 16)
                        }
                    }
                    
                    Button(action: {
                           newPartner()
                        }, label: {
                            Text("Add chat partner")
                                .padding(.all, 12)
                        })
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(5)
                            .padding(.top, 48)
                            .padding(.bottom, 24)
                    
                    Text("HTW WiSe21/22")
                    Text("Louis Andrew, s0570624")
                }
            }
            .navigationTitle("Conversation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SelectPartnerMenu_Previews: PreviewProvider {
    static var previews: some View {
        SelectPartnerMenu()
    }
}
