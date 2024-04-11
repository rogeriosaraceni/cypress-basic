import assert from 'assert'

class RegisterForm{
  elements = {
    titleInput:    () => cy.get('#title'),
    titleFeedback: () => cy.get('#titleFeedback'),
    imageUrlInput: () => cy.get('#imageUrl'),
    urlFeedback:   () => cy.get('#urlFeedback'),
    submitBtn:     () => cy.get('#btnSubmit'),
  }

  typeTitle(text) {
    if (!text) return;
    this.elements.titleInput().type(text)
  }

  typeUrl(text) {
    if (!text) return;
    this.elements.imageUrlInput().type(text)
  }

  clickSubmit() {
    this.elements.submitBtn().click()
  }
}

const registerForm = new RegisterForm()

const colors = {
  error: 'rgb(220, 53, 69)',
  success: ''
}

describe('Registro de Imagem', () => {
  describe('Enviando uma imagem com entradas inválidas', () => {
    after(() => { 
      cy.clearLocalStorage()
    })

    const input = {
      title: '',
      url: ''
    }

    it('Dado que estou na página de registro de imagens', () => {
      cy.visit('/')
    })

    it(`Quando eu insiro "${input.title}" no campo de título`, () => {
      registerForm.typeTitle(input.title)
    })

    it(`Então eu insiro "${input.url}" no campo URL`, () => {
      registerForm.typeUrl(input.url)
    })
    
    it(`Então clico no botão enviar`, () => { 
      registerForm.clickSubmit()
    })

    it(`Então devo ver a mensagem "Por favor, digite um título para a imagem" acima do campo de título`, () => { 
      // registerForm.elements.titleFeedback().should(element => {
      //   debugger
      // })
      registerForm.elements.titleFeedback().should('contains.text', 'Please type a title for the image.')
    })

    it(`E devo ver a mensagem "Digite um URL válido" acima do campo imageUrl`, () => { 
      // registerForm.elements.urlFeedback().should(element => {
      //   debugger
      // })
      registerForm.elements.urlFeedback().should('contains.text', 'Please type a valid URL')
    })

    it(`E devo ver um ícone de exclamação nos campos de título e URL`, () => { 
      registerForm.elements.titleInput().should(([element]) => {
        const styles = window.getComputedStyle(element)
        const border = styles.getPropertyValue('border-right-color')
        //debugger

        assert.strictEqual(border, colors.error)
      })
    })
  })
})
