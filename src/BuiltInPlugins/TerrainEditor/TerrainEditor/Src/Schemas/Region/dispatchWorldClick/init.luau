return function(_, _, v2) --[[ Line: 1 ]]
    if not v2.ClickedItem then
        return "DragSelecting";
    else
        return "Ready";
    end;
end;