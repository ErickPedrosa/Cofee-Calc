//
//  ResultViewModel.swift
//  Cofee
//
//  Created by coltec on 09/05/23.
//

import SwiftUI

class ResultViewModel: ObservableObject {
    
    @Published var uiState: ResultUIState = .none
        
    func returnToCalc(){
        //self.uiState = .loading //para gerarmos uma barra de progresso
        
        //simulando nosso login
        //DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            //o bloco sera disparado apos 2 segundos
           // self.uiState = .error("Usuário já existente")
        self.uiState = .goToCalcScreen
        //}
    }
    
}

extension ResultViewModel{
    func calcView() -> some View{
        return ResultViewRouter.makeCalcView()
    }
}
