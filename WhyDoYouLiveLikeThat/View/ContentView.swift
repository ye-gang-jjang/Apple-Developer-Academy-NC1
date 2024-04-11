import SwiftUI

struct ContentView: View {
    @State private var selected: Tab = .a
    @State private var showMainView = true
    
    var body: some View {
        ZStack {
            if showMainView {
                ZStack {
                    TabView(selection: $selected) {
                        Group {
                            NavigationStack {
                                CalendarView()
                            }
                            .tag(Tab.a)
                            
                            NavigationStack {
//                                ContentView()
                            }
                            .tag(Tab.b)
                            
                            NavigationStack {
                                MypageView()
                            }
                            .tag(Tab.c)
                        }
                        .toolbar(.hidden, for: .tabBar)
                    }
                    
                    VStack {
                        Spacer()
                        TabBar(selected: $selected)
                    }
                }
            }
            else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}


#Preview {
    ContentView()
}
