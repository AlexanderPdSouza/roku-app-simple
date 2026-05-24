sub init()
    m.router = m.top.findNode("router")
    m.viewStack = []
    navigateTo("HomeLanderView")
end sub

'' navigateTo 
'Navega para a tela criando uma ui mais limpa e solida, tendo controle do que vai ser renderizado guardando o component anterior e criando o novo
sub navigateTo(viewName as string, data = invalid)
    if m.currentView <> invalid
        m.currentView.visible = false
    end if
    view = CreateObject("roSGNode", viewName)
    if data <> invalid
        view.contentData = data
    end if
    setupObservers(viewName, view)
    m.router.appendChild(view)
    m.viewStack.push(view)
    m.currentView = view
    view.visible = true
    view.setFocus(true)
end sub

''navigateBack
'Navegar para tras utilizado o component já criado, trazendo todas a informações existente nele,ex vai para o mesmo item que estava em foco quando passou para proxima tela.
sub navigateBack()
    if m.viewStack.count() <= 1
        return
    end if
    currentView = m.viewStack.pop()
    m.router.removeChild(currentView)
    previousView = m.viewStack.peek()
    previousView.visible = true
    previousView.callFunc("restoreFocus")
    previousView.setFocus(true)
    m.currentView = previousView
end sub

''setupObservers
'só cria os observers para cada tipo de view para deixar a função navigateTo limpa.
sub setupObservers(viewName as string, view as object)
    if viewName = "HomeLanderView"
        view.observeField("itemSelected", "onItemSelected")
    end if
    if viewName = "GridLanderView"
        view.observeField("goBack", "onBackPressed")
        view.observeField("itemSelected", "onGridItemSelected")
    end if
end sub

''onItemSelected
'fallback para o clique no item.
sub onItemSelected(event as dynamic)
    content = event.getData()
    navigateTo("GridLanderView", content)
end sub

''onBackPressed
'função que é ativada quando é apertado o back.
sub onBackPressed()
    navigateBack()
end sub