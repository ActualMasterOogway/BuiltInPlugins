local v0 = require(script.Parent.Utility);
local v1 = require(script.Parent.SelectionManager);
local v2 = require(script.Parent.InstanceInfo);
local v3 = require(script.Parent.Analytics);
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = game:DefineFastFlag("SelectRotatedGuiObjects", false);
local v7 = game:DefineFastFlag("UIEditorFixSelectionZIndexOrdering", false);
local v8 = game:DefineFastFlag("UIEditorFixDisplayOrderAndTransparencySelection", false);
local v9 = {};
local v10 = {};
local v11 = nil;
local function v18(v12) --[[ Line: 23 ]] --[[ Name: calculateVisibleBounds ]]
    if v12.AbsoluteRotation ~= 0 then
        return v12.AbsolutePosition, v12.AbsoluteSize;
    else
        local l_AbsolutePosition_0 = v12.AbsolutePosition;
        local v14 = v12.AbsoluteSize + l_AbsolutePosition_0;
        local l_v12_FirstAncestorWhichIsA_0 = v12:FindFirstAncestorWhichIsA("GuiObject");
        while l_v12_FirstAncestorWhichIsA_0 do
            if l_v12_FirstAncestorWhichIsA_0.ClipsDescendants then
                local l_AbsolutePosition_1 = l_v12_FirstAncestorWhichIsA_0.AbsolutePosition;
                local v17 = l_v12_FirstAncestorWhichIsA_0.AbsoluteSize + l_AbsolutePosition_1;
                l_AbsolutePosition_0 = Vector2.new(math.max(l_AbsolutePosition_0.X, l_AbsolutePosition_1.X), (math.max(l_AbsolutePosition_0.Y, l_AbsolutePosition_1.Y)));
                v14 = Vector2.new(math.min(v14.X, v17.X), (math.min(v14.Y, v17.Y)));
            end;
            l_v12_FirstAncestorWhichIsA_0 = l_v12_FirstAncestorWhichIsA_0:FindFirstAncestorWhichIsA("GuiObject");
        end;
        return l_AbsolutePosition_0, v14 - l_AbsolutePosition_0;
    end;
end;
local function v26(v19, v20) --[[ Line: 49 ]] --[[ Name: doesPointExistInInstance ]]
    -- upvalues: v18 (copy)
    if not v20 or not v20:IsA("GuiBase2d") then
        return false;
    else
        local v21, v22 = v18(v20);
        local l_v22_0 = v22;
        l_v22_0 = Vector2.new(math.max(5, l_v22_0.X), (math.max(5, l_v22_0.Y)));
        local v24 = v21 + v22 * 0.5 - l_v22_0 * 0.5;
        local v25 = false;
        if v19.x >= v24.x then
            v25 = false;
            if v19.x <= v24.x + l_v22_0.x then
                v25 = false;
                if v19.y >= v24.y then
                    v25 = v19.y <= v24.y + l_v22_0.y;
                end;
            end;
        end;
        return v25;
    end;
end;
local function v27(v28) --[[ Line: 67 ]] --[[ Name: collectVisibleGuiObjectsUnder ]]
    -- upvalues: v6 (copy), v2 (copy), v27 (copy)
    local v29 = {};
    if v6 then
        for _, v31 in (v28:GetDescendants()) do
            if (v31:IsA("GuiBase2d") or v31:IsA("Folder")) and v2:isVisible(v31) then
                table.insert(v29, v31);
            end;
        end;
        return v29;
    else
        local l_v28_Children_0 = v28:GetChildren();
        for v33 = 1, #l_v28_Children_0 do
            if l_v28_Children_0[v33]:IsA("GuiBase2d") or l_v28_Children_0[v33]:IsA("Folder") then
                local v34 = v27(l_v28_Children_0[v33]);
                if v2:isVisible(l_v28_Children_0[v33]) then
                    table.insert(v29, l_v28_Children_0[v33]);
                end;
                for v35 = 1, #v34 do
                    table.insert(v29, v34[v35]);
                end;
            end;
        end;
        return v29;
    end;
end;
local function v42(v36) --[[ Line: 102 ]] --[[ Name: guessScreenGui ]]
    -- upvalues: v27 (copy)
    local v37 = v27(v36);
    local v38 = {};
    for v39 = 1, #v37 do
        v38[v37[v39]] = v39;
    end;
    table.sort(v37, function(v40, v41) --[[ Line: 111 ]] --[[ Name: guiSort ]]
        -- upvalues: v38 (copy)
        if v40.ZIndex == v41.ZIndex then
            return v38[v40] < v38[v41];
        else
            return v40.ZIndex < v41.ZIndex;
        end;
    end);
    return v37;
end;
local function v47() --[[ Line: 123 ]] --[[ Name: refreshPaintOrder ]]
    -- upvalues: v9 (ref), v42 (copy), v10 (copy)
    local l_Children_0 = game:GetService("StarterGui"):GetChildren();
    v9 = {};
    for v44 = 1, #l_Children_0 do
        if l_Children_0[v44]:IsA("ScreenGui") or l_Children_0[v44]:IsA("Folder") then
            local v45 = v42(l_Children_0[v44]);
            for v46 = 1, #v45 do
                table.insert(v9, v45[v46]);
                v10[v45[v46]] = #v9;
            end;
        end;
    end;
end;
local function v55(v48) --[[ Line: 142 ]] --[[ Name: getGuiObjectsAtPoint ]]
    -- upvalues: v6 (copy), v8 (copy), l_StarterGui_0 (copy), v2 (copy), v7 (copy), v9 (ref), v26 (copy)
    local v49 = {};
    if v6 then
        if v8 then
            local l_l_StarterGui_0_GuiObjectsAtPosition_0 = l_StarterGui_0:GetGuiObjectsAtPosition(v48.X, v48.Y);
            for v51 = 1, #l_l_StarterGui_0_GuiObjectsAtPosition_0 do
                if v2:isVisible(l_l_StarterGui_0_GuiObjectsAtPosition_0[v51]) then
                    table.insert(v49, l_l_StarterGui_0_GuiObjectsAtPosition_0[v51]);
                end;
            end;
        else
            v49 = l_StarterGui_0:GetGuiObjectsAtPosition(v48.X, v48.Y);
        end;
        if not v7 then
            table.sort(v49, function(v52, v53) --[[ Line: 158 ]]
                return v52.ZIndex < v53.ZIndex;
            end);
            return v49;
        end;
    else
        for v54 = #v9, 1, -1 do
            if v26(v48, v9[v54]) then
                table.insert(v49, v9[v54]);
            end;
        end;
    end;
    return v49;
end;
local function v60(v56) --[[ Line: 173 ]] --[[ Name: getTopLevelItemAtPoint ]]
    -- upvalues: v47 (copy), v55 (copy), l_UserInputService_0 (copy), v0 (copy), v11 (ref)
    v47();
    local v57 = v55(v56);
    local v58 = v57[1];
    if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt) then
        local v59 = v0:findItemInTable(v11, v57);
        if v59 ~= 0 and v59 ~= #v57 then
            v58 = v57[v59 + 1];
        end;
    end;
    return v58;
end;
local function _(v61, v62) --[[ Line: 190 ]] --[[ Name: toggleItemsExistenceInTable ]]
    -- upvalues: v0 (copy)
    local v63 = v0:findItemInTable(v61, v62);
    if v63 > 0 then
        table.remove(v62, v63);
        return false;
    else
        table.insert(v62, v61);
        return true;
    end;
end;
return {
    getGuiObjects = function(_) --[[ Line: 204 ]] --[[ Name: getGuiObjects ]]
        -- upvalues: v9 (ref)
        local v66 = {};
        for v67, v68 in ipairs(v9) do
            v66[v67] = v68;
        end;
        return v66;
    end, 
    getGuiObjectsAtPoint = function(_, v70) --[[ Line: 212 ]] --[[ Name: getGuiObjectsAtPoint ]]
        -- upvalues: v55 (copy)
        return (v55(v70));
    end, 
    refreshPaintOrder = function(_) --[[ Line: 216 ]] --[[ Name: refreshPaintOrder ]]
        -- upvalues: v47 (copy)
        v47();
    end, 
    selectTopLevelItemAtPoint = function(_, v73) --[[ Line: 220 ]] --[[ Name: selectTopLevelItemAtPoint ]]
        -- upvalues: v60 (copy), v1 (copy), l_UserInputService_0 (copy), v0 (copy), v3 (copy), v11 (ref)
        local v74 = v60(v73);
        local v75 = {
            unpack((v1:getRawSelection()))
        };
        local v76 = false;
        if v74 then
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                local l_v75_0 = v75;
                local v78 = v0:findItemInTable(v74, l_v75_0);
                local v79;
                if v78 > 0 then
                    table.remove(l_v75_0, v78);
                    v79 = false;
                else
                    table.insert(l_v75_0, v74);
                    v79 = true;
                end;
                if v79 then
                    v3:reportEvent("AddToSelection");
                else
                    v3:reportEvent("RemoveFromSelection");
                end;
                v76 = true;
            elseif v0:findItemInTable(v74, v75) == 0 then
                v75 = {
                    v74
                };
            end;
        elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            return nil;
        elseif v0:findItemInTable(v74, v75) == 0 then
            v75 = {
                v74
            };
        end;
        v11 = v74;
        if v1:setSelection(v75) and not v76 then
            if v1:hasFilteredSelection() then
                v3:reportEvent("Select");
            else
                v3:reportEvent("Deselect");
            end;
        end;
        return v11;
    end, 
    selectAllObjectsInBounds = function(_, v81, v82) --[[ Line: 267 ]] --[[ Name: selectAllObjectsInBounds ]]
        -- upvalues: v9 (ref), v1 (copy)
        local v83 = Vector2.new(math.min(v81.X, v82.X), (math.min(v81.Y, v82.Y)));
        local v84 = Vector2.new(math.max(v81.X, v82.X), (math.max(v81.Y, v82.Y)));
        local v85 = {};
        for v86 = 1, #v9 do
            if v9[v86].AbsolutePosition.X >= v83.X and v9[v86].AbsolutePosition.Y >= v83.Y and v9[v86].AbsolutePosition.X + v9[v86].AbsoluteSize.X <= v84.X and v9[v86].AbsolutePosition.Y + v9[v86].AbsoluteSize.Y <= v84.Y then
                table.insert(v85, v9[v86]);
            end;
        end;
        v1:setSelection(v85);
    end, 
    toggleSelectionOfAllObjectsInBounds = function(_, v88, v89, v90) --[[ Line: 286 ]] --[[ Name: toggleSelectionOfAllObjectsInBounds ]]
        -- upvalues: v9 (ref), v0 (copy), v1 (copy)
        local v91 = Vector2.new(math.min(v89.X, v90.X), (math.min(v89.Y, v90.Y)));
        local v92 = Vector2.new(math.max(v89.X, v90.X), (math.max(v89.Y, v90.Y)));
        local v93 = {};
        for v94 = 1, #v9 do
            if v9[v94].AbsolutePosition.X >= v91.X and v9[v94].AbsolutePosition.Y >= v91.Y and v9[v94].AbsolutePosition.X + v9[v94].AbsoluteSize.X <= v92.X and v9[v94].AbsolutePosition.Y + v9[v94].AbsoluteSize.Y <= v92.Y then
                table.insert(v93, v9[v94]);
            end;
        end;
        for v95 = 1, #v88 do
            local v96 = v0:findItemInTable(v88[v95], v93);
            if v96 ~= 0 then
                table.remove(v93, v96);
            else
                table.insert(v93, v88[v95]);
            end;
        end;
        v1:setSelection(v93);
    end
};