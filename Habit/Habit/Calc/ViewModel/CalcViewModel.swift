//
//  SignInViewModel.swift
//  Habit
//
//  Created by Virginia Mota on 10/04/22.
//

import SwiftUI

class CalcViewModel: ObservableObject {
    
    @Published var uiState: CalcUIState = .none
        
    func result(){
        //self.uiState = .loading //para gerarmos uma barra de progresso
        
        //simulando nosso login
        //DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            //o bloco sera disparado apos 2 segundos
           // self.uiState = .error("Usuário já existente")
        self.uiState = .goToResultScreen
        //}
    }
    
}

extension CalcViewModel{
    func resultView( cafeC: String = "0", cafeE: String = "0", cafeO: String = "0", idade: String = "0", gestante: Bool, sensivel: Bool) -> some View{
        
        var resultado = true
        var cafeina: Double = 0
        
        if let cafeinaC = Double(cafeC){
            if let cafeinaE = Double(cafeE){
                if let cafeinaO = Double(cafeO){
                        
                    cafeina += cafeinaO
                    cafeina += (cafeinaC * 100)
                    cafeina += (cafeinaE * 300) // Convertendo o valor de xícaras para mg
        
                    if let idadeI = Int(idade){
                        
                        if(sensivel || gestante){ //Pessoas gestantes ou com sensibilidade limite 200mg
                            
                            if(cafeina > 200){
                                resultado = false
                            }
                            
                        }else{ //Restante das pessoas depende da idade
                            
                            if (idadeI >= 18){ // Adultos limite 400mg
                                
                                if(cafeina > 400){
                                    resultado = false
                                }
                                
                            }else if(idadeI >= 2){ // Criancas e adolescentes limite 100mg
                                
                                if(cafeina > 100){
                                    resultado = false
                                }
                                
                            }else{ // Bebês não devem beber café
                                
                                resultado = false
                                
                            }
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                }
            }
            
        }
            
            
        
        
        
        return CalcViewRouter.makeResultView(resultado: resultado)
    }
}
