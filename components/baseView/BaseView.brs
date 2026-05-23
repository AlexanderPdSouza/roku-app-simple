sub init()
    m.overlay = m.top.findNode("overlay")
    m.top.observeField("loading", "onLoadingChanged")
end sub

sub onLoadingChanged()
    isLoading = m.top.loading
    m.overlay.visible = isLoading
end sub

sub showLoading()
    m.top.loading = true
end sub

sub hideLoading()
    m.top.loading = false
end sub

sub loadData()
    m.task = CreateObject("roSGNode", "Service")
    m.task.observeField("response", "onDataLoaded")
    m.task.control = "run"
end sub