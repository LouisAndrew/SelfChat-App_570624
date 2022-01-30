//
//  ChatView.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 28.01.22.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
            Text(message.content)
                .padding(10)
                .background(message.sender ? .blue : Color(red: 240/255, green: 240/255, blue: 240/255))
                .cornerRadius(10)
                .foregroundColor(message.sender ? .white : .black)
                .multilineTextAlignment(message.sender ? .trailing : .leading)
    }
}

struct ChatView: View {
    
    var chatPartner: ChatPartner
    @ObservedObject var chatHistoryController: ChatHistoryController
    
    @State var hasError: Bool = false
    @State var errorMessage: String = ""
    @State var isSendMessageViewActive = false
    
    init(chatPartner: ChatPartner) {
        chatHistoryController = ChatHistoryController(chatPartner: chatPartner)
        self.chatPartner = chatPartner
    }
    
    func sendMessage(content: String, sender: Bool) {
        do {
            try chatHistoryController.addNewMessage(message: Message(content: content, sender: sender))
            isSendMessageViewActive = false
        } catch {
            hasError = true
            errorMessage = "Error: \(error)"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        if hasError {
                            Text("Has error")
                            Text(errorMessage)
                        }
                        
                        ForEach(chatHistoryController.chatHistory.messages, id: \.self) { message in
                            MessageView(message: message)
                                .frame(idealWidth: 100, maxWidth: .infinity, alignment: message.sender ? .trailing : .leading)
                                .padding(message.sender ? .trailing : .leading, 10)
                        }
                        
                        
                    }
                }
                
                NavigationLink(destination: SendMessageView { content, sender in
                    sendMessage(content: content, sender: sender)
                }, isActive: $isSendMessageViewActive) {
                        Button {
                           isSendMessageViewActive = true
                        } label: {
                            Text("Send New Message")
                            .font(.system(size: 20))
                            .padding([.top, .bottom], 8)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                }
            }
            .padding(16)
            .navigationTitle("Chatting with " + chatPartner.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    @State var isSendMessageViewActive = false
    
    static var previews: some View {
        ChatView(chatPartner: ChatPartner(name: "L1"))
    }
}
