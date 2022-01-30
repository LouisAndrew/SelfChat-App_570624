//
//  SendMessageView.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 30.01.22.
//

import SwiftUI

struct SendMessageView: View {
    var onSendMessage: (_ content: String, _ sender: Bool) -> Void
    
    @State var content = ""
    @State var sender = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Send new message")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding([.bottom, .top], 16)
            
            HStack(spacing: 8) {
                TextField("Text content", text: $content)
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .border(.gray, width: 1)
                        .cornerRadius(2)
                
                Button {
                    if content != "" {
                        onSendMessage(content, sender)
                    }
                } label: {
                    Text("Send")
                        .padding(EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 12))
                        .foregroundColor(.white)
                        .background(.blue)
                }
                .cornerRadius(8)
            }
            
            Divider()
            
            Toggle(isOn: $sender) {
                Text("Sender")
            }
        }
        .padding([.trailing, .leading], 16)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SendMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageView { content, sender in
            print(content)
            print(sender)
        }
    }
}
