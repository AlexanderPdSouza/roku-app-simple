sub init()
    m.overlay = m.top.findNode("overlay")
end sub

sub loadData()
    m.task = CreateObject("roSGNode", "Service")
    m.task.observeField("response", "onDataLoaded")
    m.task.control = "run"
end sub