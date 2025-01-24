
import SwiftUI
import UserNotifications
//2
struct ContentView: View {
    
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){ success , error in
            if success {
                print("Bildirim izni var")
            }else{
                print("Bildirim izni yok")
            }
        }
    }
    
    var body: some View {
        VStack {
            Button("BİLDİRİM OLUŞTUR"){
                let icerik = UNMutableNotificationContent()
                icerik.title = "Başlık"
                icerik.subtitle = "Alt Başlık"
                icerik.body = "İçerik"
                icerik.badge = 1
                icerik.sound = UNNotificationSound.default
                
                let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                
                let istek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
                
                UNUserNotificationCenter.current().add(istek)
            }
        }
    }
}

#Preview {
    ContentView()
}
