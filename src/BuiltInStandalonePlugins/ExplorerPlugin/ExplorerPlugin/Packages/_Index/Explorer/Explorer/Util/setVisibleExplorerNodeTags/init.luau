local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local _ = require(l_script_FirstAncestor_0.Hooks.useImperativeTagger);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
return function(v4, v5, v6) --[[ Line: 7 ]] --[[ Name: setVisibleExplorerNodeTags ]]
    v6("selected", v4.selectionState and "Explorer-Selected");
    v6("selectionKind", v4.selectionState and ("Explorer-SelectionKind-%*"):format(v4.selectionState.kind));
    v6("selectionSegment", v4.selectionState and ("Explorer-SelectionSegment-%*"):format(v4.selectionState.segment));
    v6("isSelectedWithin", v4.isSelectedWithin and "Explorer-SelectedWithin" or nil);
    local v7 = if v5 then nil else v4.hoverState;
    v6("hovered", v7 and "Explorer-Hovered");
    v6("hoveredKind", v7 and ("Explorer-HoveredKind-%*"):format(v7));
    v6("dragging", v5 ~= nil and v5.targetId == v4.datum.id and "Explorer-DraggingInto" or "");
end;