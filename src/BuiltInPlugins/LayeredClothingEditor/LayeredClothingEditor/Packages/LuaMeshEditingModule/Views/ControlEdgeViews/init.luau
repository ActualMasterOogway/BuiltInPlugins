local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local l_Views_0 = l_Parent_0.Views;
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Views_0.ControlEdgeView);
local _ = require(l_Views_0.types);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.getUnusedViewsToRemove);
local v8 = require(l_Util_0.cleanupUnusedViews);
local v9 = {};
v9.__index = v9;
local v10 = Color3.new(0, 0, 0);
v9.new = function(v11) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_CoreGui_0 (copy), v6 (copy), v4 (copy), v10 (copy), v7 (copy), v8 (copy)
    local v12 = setmetatable({}, v9);
    local v13 = {};
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local function v18() --[[ Line: 38 ]] --[[ Name: _onFolderChangedWrapper ]]
        -- upvalues: v15 (ref)
        if v15 then
            v15();
        end;
    end;
    local function _() --[[ Line: 44 ]] --[[ Name: _connect ]]
        -- upvalues: v16 (ref), v14 (ref), v18 (copy), v17 (ref)
        v16 = v14.AncestryChanged:Connect(v18);
        v17 = v14.ChildRemoved:Connect(v18);
    end;
    v12.render = function(v20, v21) --[[ Line: 49 ]] --[[ Name: render ]]
        -- upvalues: v15 (ref), v14 (ref), l_CoreGui_0 (ref), v16 (ref), v18 (copy), v17 (ref), v11 (copy), v6 (ref), v13 (ref), v4 (ref), v10 (ref), v7 (ref), v8 (ref)
        local l_ControlPointPositions_0 = v21.ControlPointPositions;
        local l_ControlPointEdges_0 = v21.ControlPointEdges;
        local l_Adornees_0 = v21.Adornees;
        local l_Transparency_0 = v21.Transparency;
        local l_SelectedMesh_0 = v21.SelectedMesh;
        v15 = v21.FolderChangedCallback;
        if not v14 then
            v14 = Instance.new("Folder");
            v14.Parent = l_CoreGui_0;
            v14.Name = "ControlEdgeViews";
            v14:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 61 ]]
                -- upvalues: v14 (ref)
                if v14.Name ~= "ControlEdgeViews" then
                    v14.Name = "ControlEdgeViews";
                end;
            end);
            v16 = v14.AncestryChanged:Connect(v18);
            v17 = v14.ChildRemoved:Connect(v18);
        end;
        for v27, v28 in pairs(l_ControlPointEdges_0) do
            if not l_SelectedMesh_0 or v27 == l_SelectedMesh_0 then
                local _ = v11:getMeshOrigin(v27);
                for v30 in pairs(v28) do
                    local v31 = l_Adornees_0:getAdornee(v27);
                    assert(v31, "Adornee part should exist for: " .. v27 .. " in game.Workspace." .. v6.ControlPointsFolderName);
                    if not v13[v27] then
                        v13[v27] = {};
                    end;
                    if not v13[v27][v30] then
                        v13[v27][v30] = v4.new();
                    end;
                    local l_Start_0 = l_ControlPointEdges_0[v27][v30].Start;
                    local l_End_0 = l_ControlPointEdges_0[v27][v30].End;
                    v13[v27][v30]:render({
                        Name = v30, 
                        Transparency = l_Transparency_0, 
                        StartPoint = l_ControlPointPositions_0[v27][l_Start_0], 
                        EndPoint = l_ControlPointPositions_0[v27][l_End_0], 
                        Parent = v14, 
                        Adornee = v31, 
                        Color = v10
                    });
                end;
            end;
        end;
        local v34 = v7(v13, l_ControlPointEdges_0);
        if #v34 > 0 then
            v20:disconnect();
            v8(v13, v34);
            v16 = v14.AncestryChanged:Connect(v18);
            v17 = v14.ChildRemoved:Connect(v18);
        end;
    end;
    v12.disconnect = function(_) --[[ Line: 114 ]] --[[ Name: disconnect ]]
        -- upvalues: v16 (ref), v17 (ref)
        if v16 then
            v16:Disconnect();
            v16 = nil;
        end;
        if v17 then
            v17:Disconnect();
            v17 = nil;
        end;
    end;
    v12.cleanup = function(v36) --[[ Line: 125 ]] --[[ Name: cleanup ]]
        -- upvalues: v13 (ref), v14 (ref)
        v36:disconnect();
        for _, v38 in pairs(v13) do
            for _, v40 in pairs(v38) do
                v40:cleanup();
            end;
        end;
        if v14 then
            v14:Destroy();
            v14 = nil;
        end;
        v13 = {};
    end;
    return v12;
end;
return v9;