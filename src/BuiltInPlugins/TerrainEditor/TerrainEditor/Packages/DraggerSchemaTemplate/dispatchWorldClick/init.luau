local _ = function(_, _, _) --[[ Line: 20 ]] --[[ Name: buildFreeformDragInfo ]]
    return {};
end;
return function(_, _, v6) --[[ Line: 28 ]]
    if not v6.ClickedSelectable then
        return "DragSelecting";
    elseif v6.SelectionNowContainsSelectable then
        return "FreeformSelectionDrag", {};
    else
        return "DragSelecting";
    end;
end;