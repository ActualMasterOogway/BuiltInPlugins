local _ = function(_, _, v2) --[[ Line: 1 ]] --[[ Name: buildFreeformDragInfo ]]
    return {
        ClickedSelectable = v2.ClickedSelectable, 
        HandleId = "Part"
    };
end;
return function(_, v5, v6) --[[ Line: 8 ]]
    if v5:doesAllowFreeformDrag() and v6.SelectionNowContainsSelectable and v6.ClickedSelectable:IsA("PVInstance") then
        return "FreeformSelectionDrag", {
            ClickedSelectable = v6.ClickedSelectable, 
            HandleId = "Part"
        };
    else
        return "Ready";
    end;
end;