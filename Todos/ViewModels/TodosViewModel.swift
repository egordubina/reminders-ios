//
//  TodosViewModel.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import Foundation
import SwiftData

@Observable
class TodosVieModel {
    var modelContext: ModelContext
    var todos: [TodoItem] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
        
    }
}
