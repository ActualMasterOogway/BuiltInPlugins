local _ = game:GetService("Workspace");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local l_Views_0 = l_Parent_0.Views;
local l_Util_0 = l_Parent_0.Util;
local v5 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v6 = require(l_Views_0.ControlPointView);
local _ = require(l_Views_0.types);
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.getUnusedViewsToRemove);
local v10 = require(l_Util_0.cleanupUnusedViews);
local v11 = require(l_Util_0.Selectable);
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), l_CoreGui_0 (copy), v8 (copy), v6 (copy), v5 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v14 = setmetatable({}, v12);
    local v15 = {};
    local v16 = {};
    local v17 = nil;
    local v18 = {};
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local function v25() --[[ Line: 45 ]] --[[ Name: _onFolderChangedWrapper ]]
        -- upvalues: v20 (ref)
        if v20 then
            v20();
        end;
    end;
    local function _() --[[ Line: 51 ]] --[[ Name: _connect ]]
        -- upvalues: v21 (ref), v17 (ref), v25 (copy), v22 (ref), v23 (ref), v19 (ref), v24 (ref)
        v21 = v17.AncestryChanged:Connect(v25);
        v22 = v17.DescendantRemoving:Connect(v25);
        v23 = v19.AncestryChanged:Connect(v25);
        v24 = v19.ChildRemoved:Connect(v25);
    end;
    v14.render = function(v27, v28) --[[ Line: 59 ]] --[[ Name: render ]]
        -- upvalues: v20 (ref), v17 (ref), v19 (ref), l_CoreGui_0 (ref), v8 (ref), v21 (ref), v25 (copy), v22 (ref), v23 (ref), v24 (ref), v13 (copy), v18 (ref), v16 (ref), v15 (ref), v6 (ref), v5 (ref), v9 (ref), v10 (ref)
        local l_ControlPointPositions_0 = v28.ControlPointPositions;
        local l_Adornees_0 = v28.Adornees;
        local l_Transparency_0 = v28.Transparency;
        local l_IsSelected_0 = v28.IsSelected;
        local l_IsHovered_0 = v28.IsHovered;
        local l_SelectedMesh_0 = v28.SelectedMesh;
        v20 = v28.FolderChangedCallback;
        if not v17 and not v19 then
            v17 = Instance.new("Folder");
            v17.Parent = l_CoreGui_0;
            v17.Name = v8.ControlPointsAdornmentsFolderName;
            v17.Archivable = false;
            v17:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 73 ]]
                -- upvalues: v17 (ref), v8 (ref)
                if v17.Name ~= v8.ControlPointsAdornmentsFolderName then
                    v17.Name = v8.ControlPointsAdornmentsFolderName;
                end;
            end);
            v19 = Instance.new("Folder");
            v19.Archivable = false;
            v19.Parent = game.Workspace;
            v19.Name = v8.ControlPointsFolderName;
            v19:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 83 ]]
                -- upvalues: v19 (ref), v8 (ref)
                if v19.Name ~= v8.ControlPointsFolderName then
                    v19.Name = v8.ControlPointsFolderName;
                end;
            end);
            v21 = v17.AncestryChanged:Connect(v25);
            v22 = v17.DescendantRemoving:Connect(v25);
            v23 = v19.AncestryChanged:Connect(v25);
            v24 = v19.ChildRemoved:Connect(v25);
        end;
        for v35, v36 in pairs(l_ControlPointPositions_0) do
            if not l_SelectedMesh_0 or v35 == l_SelectedMesh_0 then
                local v37 = v13:getMeshOrigin(v35);
                for v38 in pairs(v36) do
                    assert(l_Adornees_0:getAdornee(v35), "Adornee part should exist for: " .. v35 .. " in game.Workspace." .. v8.ControlPointsFolderName);
                    if not v18[v35] then
                        v18[v35] = Instance.new("Folder");
                        v18[v35].Name = v35;
                        v18[v35].Archivable = false;
                        v18[v35].Parent = v19;
                        v18[v35]:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 111 ]]
                            -- upvalues: v18 (ref), v35 (copy)
                            if v18[v35].Name ~= v35 then
                                v18[v35].Name = v35;
                            end;
                        end);
                    end;
                    if not v16[v35] then
                        v16[v35] = Instance.new("Folder");
                        v16[v35].Name = v35;
                        v16[v35].Archivable = false;
                        v16[v35].Parent = v17;
                        v16[v35]:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 122 ]]
                            -- upvalues: v16 (ref), v35 (copy)
                            if v16[v35].Name ~= v35 then
                                v16[v35].Name = v35;
                            end;
                        end);
                    end;
                    if not v15[v35] then
                        v15[v35] = {};
                    end;
                    if not v15[v35][v38] then
                        v15[v35][v38] = v6.new();
                    end;
                    v15[v35][v38]:render({
                        Name = v38, 
                        Transparency = l_Transparency_0, 
                        Position = l_ControlPointPositions_0[v35][v38], 
                        PartParent = v18[v35], 
                        Adornee = l_Adornees_0:getAdornee(v35), 
                        AdornmentParent = v16[v35], 
                        Selected = l_IsSelected_0(v35, v38) and true or false, 
                        Hovered = l_IsHovered_0(v35, v38), 
                        Shape = "Sphere", 
                        Size = v8.ControlPoint.Size, 
                        Weight = l_IsSelected_0(v35, v38), 
                        MeshOrigin = v37, 
                        Color = if v5() and v28.CenterHoveredPoint ~= nil and v28.CenterHoveredPoint.Parent == v16[v35] and tonumber(v28.CenterHoveredPoint.Name) == v38 then v8.ControlPoint.HoveredCenterColor else nil
                    });
                end;
            end;
        end;
        local v39 = v9(v15, l_ControlPointPositions_0);
        if #v39 > 0 then
            v27:disconnect();
            v10(v15, v39);
            v21 = v17.AncestryChanged:Connect(v25);
            v22 = v17.DescendantRemoving:Connect(v25);
            v23 = v19.AncestryChanged:Connect(v25);
            v24 = v19.ChildRemoved:Connect(v25);
        end;
    end;
    v14.disconnect = function(_) --[[ Line: 167 ]] --[[ Name: disconnect ]]
        -- upvalues: v21 (ref), v22 (ref), v23 (ref), v24 (ref)
        if v21 then
            v21:Disconnect();
            v21 = nil;
        end;
        if v22 then
            v22:Disconnect();
            v22 = nil;
        end;
        if v23 then
            v23:Disconnect();
            v23 = nil;
        end;
        if v24 then
            v24:Disconnect();
            v24 = nil;
        end;
    end;
    v14.cleanup = function(v41) --[[ Line: 186 ]] --[[ Name: cleanup ]]
        -- upvalues: v15 (ref), v18 (ref), v16 (ref), v17 (ref), v19 (ref)
        v41:disconnect();
        for _, v43 in pairs(v15) do
            for _, v45 in pairs(v43) do
                v45:cleanup();
            end;
        end;
        for _, v47 in pairs(v18) do
            v47:Destroy();
        end;
        v18 = {};
        for _, v49 in pairs(v16) do
            v49:Destroy();
        end;
        v16 = {};
        if v17 then
            v17:Destroy();
            v17 = nil;
        end;
        if v19 then
            v19:Destroy();
            v19 = nil;
        end;
        v15 = {};
    end;
    v14.getSelectablesForMesh = function(_, v51, v52) --[[ Line: 215 ]] --[[ Name: getSelectablesForMesh ]]
        -- upvalues: v15 (ref), v13 (copy), v11 (ref)
        if not v52 then
            error("Could not get selectables for mesh, selectables argument was nil.");
            return;
        else
            local v53 = v15[v51];
            if not v53 then
                error("No views were found for mesh: " .. v51);
                return;
            else
                local v54 = v13:getMeshOrigin(v51);
                for v55, v56 in pairs(v53) do
                    table.insert(v52, {
                        Center = v54 * v56.adornment.CFrame.p, 
                        Selectable = v11.new(v51, v55)
                    });
                end;
                return;
            end;
        end;
    end;
    v14.getSelectables = function(v57) --[[ Line: 235 ]] --[[ Name: getSelectables ]]
        -- upvalues: v15 (ref)
        local v58 = {};
        for v59 in pairs(v15) do
            v57:getSelectablesForMesh(v59, v58);
        end;
        return v58;
    end;
    return v14;
end;
return v12;