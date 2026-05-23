sub init()
    m.gridList = m.top.findNode("gridList")
    m.top.observeField("contentData", "onContentChanged")
end sub

sub onContentChanged()
    content = m.top.contentData
    if content = invalid
        return
    end if
    root = CreateObject("roSGNode", "ContentNode")
    row = content.getChild(0)
    count = row.getChildCount()
    for i = 0 to count - 1
        item = row.getChild(i)
        node = root.createChild("ContentNode")
        node.title = item.title
        node.HDPosterUrl = item.HDPosterUrl
    end for
    m.gridList.content = root
    m.gridList.setFocus(true)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press = false
        return false
    end if
    if key = "back"
        m.top.goBack = true
        return true
    end if
    return false
end function