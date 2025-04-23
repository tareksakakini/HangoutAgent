import SwiftUI

struct ChatListView: View {
    @EnvironmentObject private var vm: ViewModel
    
    @State var user: User

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.chatbots, id: \.self) {chatbot in
                    if user.subscriptions.contains(chatbot.id) {
                        NavigationLink {
                            ChatView(user: user, chatbot: chatbot)
                        } label: {
                            Text(chatbot.name)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatListView(user: DemoData.users[0])
        .environmentObject(ViewModel())
}

