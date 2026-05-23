sub init()
    m.router = m.top.findNode("router")
    m.viewStack = []
    navigateTo("HomeLanderView")
end sub

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

sub setupObservers(viewName as string, view as object)
    if viewName = "HomeLanderView"
        view.observeField("itemSelected", "onItemSelected")
    end if
    if viewName = "GridLanderView"
        view.observeField("goBack", "onBackPressed")
        view.observeField("itemSelected", "onGridItemSelected")
    end if
end sub

sub onItemSelected(event as dynamic)
    content = event.getData()
    navigateTo("GridLanderView", content)
end sub

sub onBackPressed()
    navigateBack()
end sub