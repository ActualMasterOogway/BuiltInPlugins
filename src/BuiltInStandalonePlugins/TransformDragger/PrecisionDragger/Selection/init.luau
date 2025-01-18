local v0 = require(script.Parent.Rubberband);
local v1 = require(script.Parent.Metapart);
local v2 = {};
local v3 = {};
local v4 = nil;
local function v9() --[[ Line: 9 ]] --[[ Name: calculateFilteredSelection ]]
    -- upvalues: v2 (ref)
    local v5 = {};
    local v6 = 1;
    for _, v8 in ipairs(v2) do
        if (v8:IsA("BasePart") or v8:IsA("Model")) and not v8:IsA("Workspace") and not v8:IsA("Terrain") and v8:isDescendantOf(workspace) then
            v5[v6] = v8;
            v6 = v6 + 1;
        end;
    end;
    return v5;
end;
local function v10() --[[ Line: 28 ]] --[[ Name: updateSelection ]]
    -- upvalues: v2 (ref), v0 (copy), v3 (ref), v9 (copy), v4 (ref), v1 (copy)
    v2 = game:GetService("Selection"):Get();
    if v0.isRubberBandDragInProgress() then
        return;
    else
        v3 = v9();
        if v4 then
            v4.Unsubscribe();
        end;
        v4 = v1.convertToPart(v3, true);
        return;
    end;
end;
local function v11() --[[ Line: 42 ]] --[[ Name: getCurrentSelection ]]
    -- upvalues: v2 (ref)
    return v2;
end;
local function v12() --[[ Line: 46 ]] --[[ Name: getFilteredSelection ]]
    -- upvalues: v3 (ref)
    return v3;
end;
local function v13() --[[ Line: 50 ]] --[[ Name: getFilteredSelectionMetapart ]]
    -- upvalues: v4 (ref)
    return v4;
end;
return {
    updateSelection = v10, 
    getCurrentSelection = v11, 
    getFilteredSelection = v12, 
    getFilteredSelectionMetapart = v13
};