//
//  SignInView.swift
//  Habit
//
//  Created by Virginia Mota on 10/04/22.
//

import SwiftUI




struct CalcView: View {
    
    @ObservedObject var viewModel: CalcViewModel
    

    @State var cafeC = ""
    @State var cafeE = ""
    @State var cafeO = ""
    @State var idade = ""
    @State var gestante = false
    @State var sensivel = false
    @State var tipo = 0
    @State var error : String? = nil
    @State var failure : Bool? = nil
    
    @State var action: Int? = 0
    
    @State var navigationBarHidden = true
    
    var body: some View {
        Group{
            switch viewModel.uiState { //validando os casos de uso desta tela
                case .goToResultScreen:
                viewModel.resultView( cafeC: $cafeC.wrappedValue, cafeE: $cafeE.wrappedValue, cafeO: $cafeO.wrappedValue, idade: $idade.wrappedValue, gestante: $gestante.wrappedValue, sensivel: $sensivel.wrappedValue)
                case .goToHomeScreen:
                    Text("Carregar tela home")
                case .error(let msg):
                    loadingView(error: msg)
                case .none:
                    loadingView()
            }
        }
        
    }
}

extension CalcView {
    
    func loadingView(error: String? = nil) -> some View {
        
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(alignment: .center){
                    Spacer(minLength: 40)
                    VStack(alignment: .center, spacing: 8){
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 30)
                        
                        Text("Cofee Calc")
                            .foregroundColor(.cyan)
                            .font(.title.bold())
                            .padding(.horizontal, 8)
                        
                        idadeView
                        
                        cafeinaView
                        
                        optionsView
                            .padding(20)
                        
                        buttonCalcView
                        
                        
                        Text("Copyright: @YYY")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 13).bold())
                            .padding(.top,16)
                    } //VStack
                } //VStack
            } //ScrollView
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.white)
            .navigationBarTitle("Cofee Calc", displayMode: .inline)
            .navigationBarHidden(navigationBarHidden)
        }
        
        
    }
    
    
    
}

extension CalcView {
    var optionsView: some View{
        
        VStack{
            Toggle(isOn: $gestante) {
                Text("Gestante/Lactante")
                    .foregroundColor(.black)
                    .font(.body.bold())
            }
            
            Toggle(isOn: $sensivel) {
                Text("Sensível a cefeína")
                    .foregroundColor(.black)
                    .font(.body.bold())
            }
        }
        
    }
}

extension CalcView {
    var idadeView: some View{
        VStack{
            
            Text("Sua idade: ")
                .foregroundColor(.black)
                .font(.title3.bold())
                .padding(.vertical, 8)
            
            TextField("", text: $idade)
                .foregroundColor(.black)
                .border(Color.black)
            
            /*if let error = error, failure == true, idade != ""{
                Text("Preencha seu nome").foregroundColor(Color.red)
            }*/
        }
        
    }
}


extension CalcView{
    var cafeinaView: some View{
        VStack{
            Text("Café Coado")
                .foregroundColor(.black)
                .font(.title3.bold())
                .padding(.top, 12)
                
            
            Text("Quantidade de xícaras tomadas: ")
                .foregroundColor(.black)
                .font(.body.bold())
                .padding(.vertical, 8)
            
            TextField("", text: $cafeC)
                .foregroundColor(.black)
                .border(Color.black)
            
            
            
            
            Text("Café Expresso")
                .foregroundColor(.black)
                .font(.title3.bold())
                .padding(.top, 12)
            
            Text("Quantidade de xícaras tomadas: ")
                .foregroundColor(.black)
                .font(.body.bold())
                .padding(.vertical, 8)
            
            TextField("", text: $cafeE)
                .foregroundColor(.black)
                .border(Color.black)
            
            
            
            
            Text("Outros")
                .foregroundColor(.black)
                .font(.title3.bold())
                .padding(.top, 12)
            
            Text("Quantidade em miligramas: ")
                .foregroundColor(.black)
                .font(.body.bold())
                .padding(.vertical, 8)
            
            TextField("", text: $cafeO)
                .foregroundColor(.black)
                .border(Color.black)
            
        }
    }
}

extension CalcView{
    var buttonCalcView: some View{
        Button("Calcular"){
            
            
            viewModel.result()
        }
        .disabled(cafeO == "" || cafeE == "" || cafeC == "" || idade == "")
        
    }
}



struct CalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView(viewModel: CalcViewModel())
    }
}
