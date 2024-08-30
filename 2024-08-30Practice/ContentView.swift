//
//  ContentView.swift
//  2024-08-30Practice
//
//  Created by Mac on 2024/08/30.
//

import SwiftUI

struct ContentView: View {
    struct Fruit: Identifiable, Hashable{
        let id: String = UUID().uuidString
        let name: String

    }

    var fruits = [
        Fruit(name: "Apple"), Fruit(name: "Banana"),Fruit(name: "Kiwi"),Fruit(name: "Orange"),Fruit(name:"Pear")
    ]
    @State private var selectedFruits = Set<Fruit>()
    @State private var selectedFruit: Fruit?
    @State private var showAlert = false
    
    
    
    var body: some View {
        VStack{
            NavigationView {
                Text("change")
                    .frame(maxWidth: .infinity, minHeight: 20)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .navigationTitle("Title")
                    .toolbar {
                        EditButton()
                    }
            }
            .padding(.bottom, 10)
                
                ScrollView(.horizontal){
                    HStack(spacing:10){
                        ForEach(fruits) { fruit in
                            Text(fruit.name)
                                .foregroundStyle(.black)
                                .font(.title3)
                                .frame(width: 100, height: 50)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                                .shadow(radius: 3) // Add a shadow for depth
                                .padding([.top, .bottom], 5)
                                .onTapGesture {
                                    selectedFruit = fruit
                                    showAlert = true
                                }
                        }
                        
                    }
                }
                .frame(height:50)
                .padding(.vertical, 5)
                .alert(item: $selectedFruit) { fruit in
                    Alert(
                        title: Text("Selected Fruit"),
                        message: Text(fruit.name),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            Text("\(selectedFruits.count)")
            .padding(.top, 10)
            
            List(fruits, id: \.self,selection: $selectedFruits){fruit in Text(fruit.name)
            }.toolbar{EditButton()}
            .padding(.top, 10)
            .padding([.horizontal, .bottom])
        }
    }


#Preview {
    ContentView()
}
