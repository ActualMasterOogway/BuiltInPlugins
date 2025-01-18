return function(_, _, v2) --[[ Line: 20 ]]
    if v2.SelectionNowContainsSelectable then
        return "Ready";
    else
        return "DragSelecting";
    end;
end;