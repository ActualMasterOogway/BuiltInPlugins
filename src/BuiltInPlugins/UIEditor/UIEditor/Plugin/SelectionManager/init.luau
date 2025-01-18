local _ = require(script.Parent.FFlag);
local v1 = require(script.Parent.Utility);
local l_Selection_0 = game:GetService("Selection");
local v3 = {};
local v4 = {};
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = 0;
local v9 = {};
local v10 = false;
local _ = function(v11, v12) --[[ Line: 29 ]] --[[ Name: onChangedEvent ]]
    -- upvalues: v7 (copy)
    for _, v14 in pairs(v7) do
        v14(v11, v12);
    end;
end;
local function _() --[[ Line: 35 ]] --[[ Name: disconnectChangedEvents ]]
    -- upvalues: v4 (ref), v6 (copy)
    for v16 = 1, #v4 do
        v6[v4[v16]]:disconnect();
    end;
end;
local function v23() --[[ Line: 41 ]] --[[ Name: connectChangedEvents ]]
    -- upvalues: v4 (ref), v6 (copy), v7 (copy)
    for v18 = 1, #v4 do
        v6[v4[v18]] = v4[v18].Changed:connect(function(v19) --[[ Line: 43 ]]
            -- upvalues: v4 (ref), v18 (copy), v7 (ref)
            local v20 = v4[v18];
            for _, v22 in pairs(v7) do
                v22(v20, v19);
            end;
        end);
    end;
end;
local function v24(v25, v26) --[[ Line: 49 ]] --[[ Name: ancestorExistsInList ]]
    -- upvalues: v1 (copy), v24 (copy)
    if not v25 or not v25:IsA("GuiBase2d") then
        return false;
    elseif v1:findItemInTable(v25, v26) ~= 0 then
        return true;
    else
        return v24(v25.Parent, v26);
    end;
end;
local v35 = {
    connectSelectionInstancesChanged = function(_, v28) --[[ Line: 61 ]] --[[ Name: connectSelectionInstancesChanged ]]
        -- upvalues: v8 (ref), v7 (copy)
        v8 = v8 + 1;
        v7[v8] = v28;
        return v8;
    end, 
    disconnectSelectionInstancesChanged = function(_, v30) --[[ Line: 68 ]] --[[ Name: disconnectSelectionInstancesChanged ]]
        -- upvalues: v7 (copy)
        if not v30 then
            return nil;
        else
            v7[v30] = nil;
            return nil;
        end;
    end, 
    connectFilteredSelectionChanged = function(_, v32) --[[ Line: 81 ]] --[[ Name: connectFilteredSelectionChanged ]]
        -- upvalues: v9 (copy)
        table.insert(v9, v32);
    end, 
    disconnectFilteredSelectionChanged = function(_, v34) --[[ Line: 90 ]] --[[ Name: disconnectFilteredSelectionChanged ]]
        -- upvalues: v1 (copy), v9 (copy)
        assert(v1:removeItemFromTable(v34, v9), "Could not remove listener from listeners");
    end
};
local _ = function() --[[ Line: 98 ]] --[[ Name: notifyFilteredSelectionChanged ]]
    -- upvalues: v9 (copy)
    for _, v37 in ipairs(v9) do
        v37:onSelectionChanged();
    end;
end;
local function v40(v39) --[[ Line: 105 ]] --[[ Name: isGui ]]
    if game:GetEngineFeature("UIDragDetector") then
        if game:GetFastFlag("UIEditorAvoidEditingPath2D") then
            return (not not v39:IsA("GuiObject") or v39:IsA("UIComponent")) and not v39:IsA("Path2D") and not v39:IsA("UIDragDetector");
        else
            return (not not v39:IsA("GuiObject") or v39:IsA("UIComponent")) and not v39:IsA("UIDragDetector");
        end;
    elseif game:GetFastFlag("UIEditorAvoidEditingPath2D") then
        return (not not v39:IsA("GuiObject") or v39:IsA("UIComponent")) and not v39:IsA("Path2D");
    else
        return v39:IsA("GuiObject") or v39:IsA("UIComponent");
    end;
end;
local function v44(v41) --[[ Line: 126 ]] --[[ Name: areAllAncestorsGuiBase2dToStarterGui ]]
    -- upvalues: v40 (copy)
    if not v40(v41) then
        return false;
    else
        local v42 = false;
        local l_Parent_0 = v41.Parent;
        while l_Parent_0 ~= nil do
            if l_Parent_0 == game:GetService("StarterGui") then
                return true;
            elseif l_Parent_0:IsA("GuiBase2d") or l_Parent_0:IsA("Folder") then
                l_Parent_0 = l_Parent_0.Parent;
            else
                break;
            end;
        end;
        return v42;
    end;
end;
local function _(v45) --[[ Line: 150 ]] --[[ Name: isDescendantOfScreenGui ]]
    return v45:FindFirstAncestorOfClass("ScreenGui") ~= nil;
end;
v35.passesGuiFilter = function(_, v48) --[[ Line: 159 ]] --[[ Name: passesGuiFilter ]]
    -- upvalues: v44 (copy)
    local v49 = v44(v48);
    local v50 = v48:FindFirstAncestorOfClass("ScreenGui") ~= nil;
    return v49 and v50;
end;
v35.onDescendantAddedToStarterGui = function(_, v52) --[[ Line: 172 ]] --[[ Name: onDescendantAddedToStarterGui ]]
    -- upvalues: v35 (copy)
    if v35:passesGuiFilter(v52) and v52:IsA("GuiObject") then
        v35:onSelectionChanged();
    end;
end;
v35.onParentChanged = function(_, _) --[[ Line: 184 ]] --[[ Name: onParentChanged ]]
    -- upvalues: v35 (copy)
    v35:onSelectionChanged();
end;
v35.onSelectionChanged = function(_) --[[ Line: 190 ]] --[[ Name: onSelectionChanged ]]
    -- upvalues: v4 (ref), v6 (copy), l_Selection_0 (copy), v3 (ref), v5 (ref), v35 (copy), v1 (copy), v24 (copy), v23 (copy), v10 (ref), v9 (copy)
    for v56 = 1, #v4 do
        v6[v4[v56]]:disconnect();
    end;
    local v57 = l_Selection_0:Get();
    v3 = v57;
    v4 = {};
    v5 = {};
    for v58 = 1, #v3 do
        local v59 = v3[v58];
        if v35:passesGuiFilter(v59) and v59:IsA("GuiObject") then
            table.insert(v4, v59);
        end;
    end;
    for v60 = 1, #v4 do
        local l_Parent_1 = v57[v60].Parent;
        if not if l_Parent_1 and l_Parent_1:IsA("GuiBase2d") then v1:findItemInTable(l_Parent_1, v57) ~= 0 or v24(l_Parent_1.Parent, v57) else false then
            table.insert(v5, v4[v60]);
        end;
    end;
    v23();
    if not v10 then
        for _, v63 in ipairs(v9) do
            v63:onSelectionChanged();
        end;
    end;
end;
v35.getRawSelection = function(_) --[[ Line: 218 ]] --[[ Name: getRawSelection ]]
    -- upvalues: v3 (ref)
    return {
        unpack(v3)
    };
end;
v35.getFilteredSelection = function(_) --[[ Line: 222 ]] --[[ Name: getFilteredSelection ]]
    -- upvalues: v4 (ref)
    return {
        unpack(v4)
    };
end;
v35.getFilteredSelectionCommonAncestors = function(_) --[[ Line: 226 ]] --[[ Name: getFilteredSelectionCommonAncestors ]]
    -- upvalues: v5 (ref)
    return {
        unpack(v5)
    };
end;
v35.hasSelection = function(_) --[[ Line: 230 ]] --[[ Name: hasSelection ]]
    -- upvalues: v3 (ref)
    return #v3 ~= 0;
end;
v35.hasFilteredSelection = function(_) --[[ Line: 234 ]] --[[ Name: hasFilteredSelection ]]
    -- upvalues: v4 (ref)
    return #v4 ~= 0;
end;
v35.setSelection = function(_, v70) --[[ Line: 238 ]] --[[ Name: setSelection ]]
    -- upvalues: v1 (copy), v3 (ref), l_Selection_0 (copy)
    if v1:tablesAreEquivalent(v3, v70) then
        return false;
    else
        l_Selection_0:Set(v70);
        return true;
    end;
end;
v35.setSuppressFilteredSelectionChanged = function(_, v72) --[[ Line: 255 ]] --[[ Name: setSuppressFilteredSelectionChanged ]]
    -- upvalues: v10 (ref), v9 (copy)
    if v10 == v72 then
        return;
    else
        v10 = v72;
        if not v72 then
            for _, v74 in ipairs(v9) do
                v74:onSelectionChanged();
            end;
        end;
        return;
    end;
end;
return v35;