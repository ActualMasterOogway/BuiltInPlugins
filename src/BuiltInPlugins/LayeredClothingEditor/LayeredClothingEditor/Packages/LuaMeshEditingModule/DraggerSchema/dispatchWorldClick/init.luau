local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
return function(_, v3, v4) --[[ Line: 23 ]]
    -- upvalues: v1 (copy)
    if v1() and v3:doesAllowFreeformDrag() then
        return "FreeformSelectionDrag";
    elseif not v4.ClickedItem then
        return "DragSelecting";
    else
        return "Ready";
    end;
end;