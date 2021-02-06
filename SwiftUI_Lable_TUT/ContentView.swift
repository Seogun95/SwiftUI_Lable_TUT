//
//  ContentView.swift
//  SwiftUI_Lable_TUT
//
//  Created by 김선중 on 2021/02/06.
//

import SwiftUI

struct ContentView: View {
    
    @ScaledMetric var size: CGFloat = 1
    
    var body: some View {
        
        List {
            Group {
                //1. 기본적인 레이블
                Label("나의 계정", systemImage: "person.crop.circle")
                //2. 제목만 표시하는 레이블 스타일
                Label("Wi-Fi", systemImage: "wifi")
                    .labelStyle(TitleOnlyLabelStyle())
                //3. 아이콘만 표시하는 레이블 스타일
                Label("Wi-Fi", systemImage: "wifi")
                    .labelStyle(IconOnlyLabelStyle())
                //4. 레이블 크기 변경
                Label("개인용 핫스팟", systemImage: "personalhotspot")
                    //.font(.largeTitle)
                    .font(.system(size: 30))
                
                //5. 텍스트와 이미지 각각 커스튬
                Label {
                    Text("에어팟")
                        .foregroundColor(Color.orange)
                } icon : {
                    Image(systemName: "airpodspro")
                        .foregroundColor(Color.blue)
                }
            }
            Group {
                //6. 사용자 이미지 사용
                Label {
                    Text("서근 개발블로그")
                        .font(.system(size: 16))
                } icon : {
                    Image("welcome")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
                //7. 라벨 이미지 대신 도형넣기-1
                Label {
                    Text("서근 개발블로그")
                        .foregroundColor(.blue)
                } icon : {
                    Capsule().frame(width: 20, height: 30)
                        .foregroundColor(.black)
                }
                //8. 라벨 이미지 대신 도형넣기-2
                Label {
                    Text("서근")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                        .clipShape(Capsule())
                        .padding(-10)
                } icon: {
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.blue)
                        .frame(width: 64, height: 64)
                    
                }
                Group {
                    //9. 사용자 레이블 스타일 적용
                    Label("사용자 레이블 스타일 지정 (1)", systemImage: "paperplane.circle.fill")
                        .labelStyle(YellowBackgroundLableStyle())
                    //9-1
                    Label {
                        Text("사용자 레이블 스타일 지정 (2)")
                    } icon : {
                        Image(systemName: "paperplane.circle.fill")
                        
                    }  //레이블스타일은 레이블 밖에서 작성해야한다.
                    .labelStyle(YellowBackgroundLableStyle())
                    
                    
                    //10. vertical 레이블
                    Label {
                        Text("수직 레이블뷰")
                    } icon : {
                        Image(systemName: "moon.fill")
                    }
                    .labelStyle(VerticalLabelStyle())
                }
                
                Section {
                    //11. 아이콘에 색상 추가
                    Label("Airplane Mode", systemImage: "airplane").labelStyle(ColorfulIconLabelStyle(color: .orange, size: size))
                    Label("Wi-Fi", systemImage: "wifi").labelStyle(ColorfulIconLabelStyle(color: .blue, size: size))
                    Label("Bluetooth", systemImage: "airpodspro").labelStyle(ColorfulIconLabelStyle(color: .blue, size: size))
                    Label("Cellular", systemImage: "antenna.radiowaves.left.and.right").labelStyle(ColorfulIconLabelStyle(color: .green, size: size))
                    Label("Personal Hotspot", systemImage: "personalhotspot").labelStyle(ColorfulIconLabelStyle(color: .green, size: size))
                }
                Section {
                    Label("Notifications", systemImage: "app.badge").labelStyle(ColorfulIconLabelStyle(color: .red, size: size))
                    Label("Sounds & Haptics", systemImage: "speaker.wave.3.fill").labelStyle(ColorfulIconLabelStyle(color: .red, size: size))
                    Label("Do not disturb", systemImage: "moon.fill").labelStyle(ColorfulIconLabelStyle(color: .purple, size: size))
                    Label("Display time", systemImage: "hourglass").labelStyle(ColorfulIconLabelStyle(color: .purple, size: size))
                }
                
            }
        } .listStyle(GroupedListStyle())
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 사용자 레이블 스타일 생성 - 배경색 스타일
struct YellowBackgroundLableStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .background(Color.yellow)
            .cornerRadius(20)
    }
}

// 사용자 레이블 스타일 생성 - Vertical 레이블 스타일 생성
struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .padding(5)
            configuration.title
        }
    }
}

// 사용자 레이블 스타일 생성 - Color fulI 아이콘 스타일
struct ColorfulIconLabelStyle: LabelStyle {
    var color: Color
    var size: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .imageScale(.small)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 7 * size).frame(width: 28 * size, height: 28 * size).foregroundColor(color))
        }
    }
}
