sub init()
    m.poster = m.top.findNode("itemPoster")
    m.label = m.top.findNode("itemLabel")
end sub

sub showcontent()
    item = m.top.itemContent
    if item = invalid
        return
    end if
    if item.HDPosterUrl <> invalid
        m.poster.uri = item.HDPosterUrl
    end if
    m.label.text = item.title
end sub

sub showfocus()
    scale = 1 + (m.top.focusPercent * 0.08)
    m.poster.scale = [scale, scale]
end sub