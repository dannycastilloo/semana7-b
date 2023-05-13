//
//  HomeViewModel.swift
//  semana7-b
//
//  Created by MAC37 on 13/05/23.
//

import Foundation

class HomeViewModel {
    
    var toDos: [toDo] = [toDo]()
        
    let urlToDos: String = "https://jsonplaceholder.typicode.com/todos"
        
    func loadData() async {
            
        guard let url = URL(string: urlToDos) else {
            print("Error en URL")
            return
        }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodeResponse = try? JSONDecoder().decode([toDo].self, from: data) {
                toDos = decodeResponse
            }
            
        } catch let error {
            
            print("Error: \(error.localizedDescription)")
            
        }
        
    }
}
