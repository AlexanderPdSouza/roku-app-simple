sub init()
    m.router = m.top.findNode("router")
    showView("HomeLanderView")
end sub

sub showView(viewName as string, data = invalid)
    if m.currentView <> invalid
        m.router.removeChild(m.currentView)
    end if
    view = CreateObject("roSGNode", viewName)
    if viewName = "HomeLanderView"
        view.observeField("itemSelected", "onItemSelected")
    end if
    if viewName = "GridLanderView"
        view.observeField("goBack", "onBackPressed")
        view.contentData = data
    end if
    m.router.appendChild(view)
    view.setFocus(true)
    m.currentView = view
end sub

sub onItemSelected(event as dynamic)
    content = event.getData()
    showView("GridLanderView",content)
end sub

sub onBackPressed()
    if m.currentView <> invalid
        m.router.removeChild(m.currentView)
    end if
    showView("HomeLanderView")
end sub