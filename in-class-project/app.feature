Especificações de teste BDD (Behavior Driven Development) 

Feature: Image Registration (EN)

    Scenario: Submitting an image with invalid inputs
        Given I am on the image registration page
        When I enter "" in the title field
        Then I enter "" in the URL field
        Then I click the submit button
        Then I should see "Please type a title for the image" message above the title field
        And I should see "Please type a valid URL" message above the imageUrl field
        And I should see an exclamation icon in the title and URL fields

  Scenario: Submitting an image with valid inputs using enter key
        Given I am on the image registration page
        When I enter "Alien BR" in the title field
        Then I should see a check icon in the title field
        When I enter "https://cdn.mos.cms.futurecdn.net/eM9EvWyDxXcnQTTyH8c8p5-1200-80.jpg" in the URL field
        Then I should see a check icon in the imageUrl field
        Then I can hit enter to submit the form
        And the list of registered images should be updated with the new item
        And the new item should be stored in the localStorage
        Then The inputs should be cleared

  Scenario: Submitting an image and updating the list
        Given I am on the image registration page
        Then I have entered "BR Alien" in the title field
        Then I have entered "https://cdn.mos.cms.futurecdn.net/eM9EvWyDxXcnQTTyH8c8p5-1200-80.jpg" in the URL field
        When I click the submit button
        And the list of registered images should be updated with the new item
        And the new item should be stored in the localStorage
        Then The inputs should be cleared

  Scenario: Refreshing the page after submitting an image clicking in the submit button
        Given I am on the image registration page
        Then I have submitted an image by clicking the submit button
        When I refresh the page
        Then I should still see the submitted image in the list of registered images

--------------------------------------------------------------------------------------

Recurso: Registro de Imagem (PT-BR)

    Cenário: Enviando uma imagem com entradas inválidas
        Dado que estou na página de registro de imagens
        Quando eu insiro "" no campo de título
        Então eu insiro "" no campo URL
        Então clico no botão enviar
        Então devo ver a mensagem "Por favor, digite um título para a imagem" acima do campo de título
        E devo ver a mensagem "Digite um URL válido" acima do campo imageUrl
        E devo ver um ícone de exclamação nos campos de título e URL

   Cenário: Enviando uma imagem com entradas válidas usando a tecla Enter
        Dado que estou na página de registro de imagens
        Quando eu digito "Alien BR" no campo de título
        Então devo ver um ícone de verificação no campo de título
        Quando eu insiro "https://cdn.mos.cms.futurecdn.net/eM9EvWyDxXcnQTTyH8c8p5-1200-80.jpg" no campo URL
        Então devo ver um ícone de verificação no campo imageUrl
        Então posso pressionar Enter para enviar o formulário
        E a lista de imagens cadastradas deverá ser atualizada com o novo item
        E o novo item deve ser armazenado no localStorage
        Então as entradas devem ser limpas

   Cenário: Enviando uma imagem e atualizando a lista
        Dado que estou na página de registro de imagens
        Então eu digitei "BR Alien" no campo do título
        Então digitei "https://cdn.mos.cms.futurecdn.net/eM9EvWyDxXcnQTTyH8c8p5-1200-80.jpg" no campo URL
        Quando clico no botão enviar
        E a lista de imagens cadastradas deverá ser atualizada com o novo item
        E o novo item deve ser armazenado no localStorage
        Então as entradas devem ser limpas

   Cenário: Atualizando a página após enviar uma imagem clicando no botão enviar
        Dado que estou na página de registro de imagens
        Então enviei uma imagem clicando no botão enviar
        Quando eu atualizo a página
        Então ainda devo ver a imagem enviada na lista de imagens cadastradas
