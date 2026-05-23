sub init()
    m.rowList = m.top.findNode("rowList")
    m.rowList.observeField("rowItemSelected", "onItemSelected")
    m.rowList.observeField("rowItemFocused", "onRowItemFocused")
    m.lastFocusedRow = -1
    m.lastFocusedItem = -1
    showLoading()
    loadData()
end sub

sub onDataLoaded(event)
    hideLoading()
    data = event.getData()
    if data = invalid or data.results = invalid
        return
    end if
    root = CreateObject("roSGNode", "ContentNode")
    row = root.createChild("ContentNode")
    for each item in data.results
        node = row.createChild("ContentNode")
        node.title = item.name
        urlParts = item.url.tokenize("/")
        id = urlParts[urlParts.count() - 1]
        node.HDPosterUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/" + id + ".png"
    end for
    m.rowList.content = root
    m.rowList.setFocus(true)
end sub

sub onRowItemFocused()
    focused = m.rowList.rowItemFocused
    if focused <> invalid
        m.lastFocusedRow = focused[0]
        m.lastFocusedItem = focused[1]
    end if
end sub

sub restoreFocus()
    m.rowList.jumpToRowItem = [
        m.lastFocusedRow,
        m.lastFocusedItem
    ]
    m.rowList.setFocus(true)
end sub

sub onItemSelected()
    selected = m.rowList.rowItemSelected
    if selected = invalid
        return
    end if
    item = m.rowList.content.getChild(selected[0]).getChild(selected[1])
    m.top.itemSelected = m.rowList.content
end sub