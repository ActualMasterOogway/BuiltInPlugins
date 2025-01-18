local l_script_FirstAncestor_0 = script:FindFirstAncestor("PathEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getShortcuts)();
local l_PathEditorCustomBindings_0 = game:GetFastFlag("PathEditorCustomBindings");
local v3 = nil;
v3 = if l_PathEditorCustomBindings_0 then {
    "DoneEditing", 
    "AddPointMode", 
    "AddTangentMode", 
    "MoveTool"
} else {
    "DoneEditing", 
    "AddPointMode", 
    "AddTangentMode", 
    "MoveTool", 
    "DeletePoint", 
    "DeletePoint2"
};
local function v7(_, v5, v6) --[[ Line: 35 ]] --[[ Name: makeAction ]]
    -- upvalues: l_PathEditorCustomBindings_0 (copy)
    if l_PathEditorCustomBindings_0 then
        return {
            id = v6, 
            text = v5:getText("ShortcutNames", v6), 
            statusTip = v5:getText("ShortcutDescriptions", v6), 
            allowBinding = true
        };
    else
        return {
            id = v6, 
            text = v5:getText("ContextMenu", v6), 
            allowBinding = false
        };
    end;
end;
return function(v8, v9) --[[ Line: 52 ]]
    -- upvalues: v3 (ref), v7 (copy), v1 (copy), l_PathEditorCustomBindings_0 (copy)
    local v10 = {};
    for _, v12 in ipairs(v3) do
        v10[v12] = v7(v8, v9, v12);
    end;
    v10.MoveTool.defaultShortcut = v1.Move;
    v10.AddPointMode.defaultShortcut = v1.AddPoint;
    v10.AddTangentMode.defaultShortcut = v1.AddTangent;
    v10.DoneEditing.defaultShortcut = v1.Done;
    if not l_PathEditorCustomBindings_0 then
        v10.DeletePoint.defaultShortcut = v1.Delete;
        v10.DeletePoint2.defaultShortcut = v1.Delete2;
    end;
    return v10;
end;