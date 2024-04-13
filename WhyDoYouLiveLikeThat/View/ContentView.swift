import SwiftUI

struct ContentView: View {
    @State private var selected: Tab = .a
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            if showMainView {
                CalendarView(selectedDate: .constant(Date()))
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
