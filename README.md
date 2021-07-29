# Projeto de exemplo para utilização do framework Modal Customization (Swift)
Esse é um projeto de exemplo em Swift para mostrar o funcionamento do framework [Modal Customization](https://github.com/ModalCustomizationFramework/ModalCustomizationFramework). O projeto contém um botão que será utilizado como trigger para a modal no arquivo **ViewController**, siga o tutorial abaixo para integrar o projeto com o framework.

## Como Integrar o framework ao projeto?

Para acessar o framework por meio do SPM, lá no Xcode em File -> Swift Packages -> Add Package Dependency,
adicione o link (https://github.com/ModalCustomizationFramework/ModalCustomizationSPM.git) na barra de pesquisa e aperte em **next**,
selecione **Branch** e aperte em **next**

## Tutorial 

1. Faça o download do projeto [Example-Swift]()
2. Navegue até o arquivo **ViewController** e importe o framework
~~~swift
import ModalCustomizationFramework
~~~
3. Na classe **ViewController** adicione a variável do tipo ModalTransitioningDelegate
~~~swift
var modalTransitioningDelegate: ModalTransitioningDelegate?
~~~
4. Na primeira linha da função **@objc func buttonAction()** instancie a classe **ModalCustomization** por meio dela você terá acesso as funções 
que customizam o modal.
~~~swift
 let modalCustomization = ModalCustomization()
~~~
5. Na próxima linha customize a modal chamando as funções abaixo

~~~swift
// Escolher entre ModalScaleStateShort(menos que metade da tela), ModalScaleStateNormal(metade da tela), ModalScaleStateAdjustedOnce(tela inteira) / valor padrão : ModalScaleStateNormal
 modalCustomization.setModalScaleState(ModalScaleStateShort)
 
 // Escolher entre lightMode e darkMode / valor padrão: lightMode
 modalCustomization.setModalBlurEffectStyle(darkMode)
 
 // Definir se a modal expande quando o usuário arrasta para cima ou se permanece com a mesma altura / valor padrão : false
 modalCustomization.setIsModalExpansive(true)
~~~

6. Na próxima linha instancie uma view controller que será sua modal view controller
~~~swift
  let modalController = UIViewController()
  // faça uma modificação na cor para visualizar melhor
  modalController.view.backgroundColor = .orange
~~~

7. Na próxima linha, ainda dentro da função, instancie a classe ModalTransitioningDelegate atribuindo o objeto retornado para o modalTransitioningDelegate da ViewController
~~~swift
  self.modalTransitioningDelegate = ModalTransitioningDelegate(viewController: self, presenting: modalController )
~~~

8. Em seguida descreva o tipo de apresentação da controller da modal como custom. 
~~~swift
 modalController.modalPresentationStyle = .custom
~~~
 9. O transitioning delegate será responsável por instanciar a view que será apresentada por meio de uma Presentation Controller(responsável por animações, altura da modal, blur effect e gestures).
~~~swift
 modalController.transitioningDelegate = self.modalTransitioningDelegate
~~~

10. Por fim, apresente a modal controller.
 ~~~swift
 present(modalController, animated: true, completion: nil)
~~~
