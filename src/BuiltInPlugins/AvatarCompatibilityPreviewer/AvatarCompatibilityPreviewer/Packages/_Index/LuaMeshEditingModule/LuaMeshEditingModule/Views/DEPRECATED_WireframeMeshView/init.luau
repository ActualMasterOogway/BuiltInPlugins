local v0 = require(script.Parent.ControlEdgeView);
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = {};
v2.__index = v2;
local v3 = {
    2, 
    3, 
    1
};
v2.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy), v0 (copy), l_CoreGui_0 (copy)
    local v4 = setmetatable({}, v2);
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local function v8() --[[ Line: 23 ]] --[[ Name: _onFolderChangedWrapper ]]
        -- upvalues: v5 (ref)
        if v5 then
            v5();
        end;
    end;
    local function _() --[[ Line: 29 ]] --[[ Name: _connect ]]
        -- upvalues: v6 (ref), v4 (copy), v8 (copy), v7 (ref)
        v6 = v4.folder.AncestryChanged:Connect(v8);
        v7 = v4.folder.ChildRemoved:Connect(v8);
    end;
    local function v28(v10, v11) --[[ Line: 35 ]] --[[ Name: _renderLinks ]]
        -- upvalues: v3 (ref), v0 (ref)
        local l_Context_0 = v11.Context;
        local l_Transparency_0 = v11.Transparency;
        local l_WireColor_0 = v11.WireColor;
        local l_ToolAdornees_0 = v11.ToolAdornees;
        local l_Visible_0 = v11.Visible;
        assert(l_ToolAdornees_0 ~= nil, "ToolAdornees cannot be nil!");
        assert(l_Context_0 ~= nil, "Context cannot be nil!");
        local v17 = l_Context_0:getTriangleIndexData();
        local v18 = l_Context_0:getVertexData();
        if v17 and v18 then
            for v19, v20 in pairs(v17) do
                if not v10.adorns[v19] then
                    v10.adorns[v19] = {};
                end;
                local v21 = l_ToolAdornees_0:getAdornee(v19);
                for _, v23 in pairs(v20) do
                    for v24, v25 in ipairs(v3) do
                        local v26 = if v23[v24] < v23[v25] then v23[v24] else v23[v25];
                        local v27 = if v23[v24] < v23[v25] then v23[v25] else v23[v24];
                        if not v10.adorns[v19][v26] then
                            v10.adorns[v19][v26] = {};
                        end;
                        if not v10.adorns[v19][v26][v27] then
                            v10.adorns[v19][v26][v27] = v0.new();
                        end;
                        v10.adorns[v19][v26][v27]:render({
                            Adornee = v21, 
                            StartPoint = v18[v19][v26], 
                            EndPoint = v18[v19][v27], 
                            Transparency = l_Transparency_0, 
                            Color = l_WireColor_0, 
                            Visible = l_Visible_0, 
                            Parent = v10.folder
                        });
                    end;
                end;
            end;
        end;
    end;
    v4.render = function(v29, v30) --[[ Line: 83 ]] --[[ Name: render ]]
        -- upvalues: l_CoreGui_0 (ref), v5 (ref), v6 (ref), v4 (copy), v8 (copy), v7 (ref), v28 (copy)
        if not v29.folder then
            v29.folder = Instance.new("Folder");
            v29.folder.Archivable = false;
            v29.folder.Parent = l_CoreGui_0;
            v5 = v30.FolderChangedCallback;
            v6 = v4.folder.AncestryChanged:Connect(v8);
            v7 = v4.folder.ChildRemoved:Connect(v8);
        end;
        if not v29.adorns then
            v29.adorns = {};
        end;
        v28(v29, v30);
    end;
    v2.disconnect = function(_) --[[ Line: 99 ]] --[[ Name: disconnect ]]
        -- upvalues: v6 (ref), v7 (ref)
        if v6 then
            v6:Disconnect();
            v6 = nil;
        end;
        if v7 then
            v7:Disconnect();
            v7 = nil;
        end;
    end;
    v4.cleanup = function(v32) --[[ Line: 110 ]] --[[ Name: cleanup ]]
        v32:disconnect();
        if v32.adorns then
            for _, v34 in pairs(v32.adorns) do
                for _, v36 in pairs(v34) do
                    for _, v38 in pairs(v36) do
                        v38:cleanup();
                    end;
                end;
            end;
            v32.adorns = nil;
        end;
        if v32.folder then
            v32.folder:Destroy();
            v32.folder = nil;
        end;
    end;
    return v4;
end;
return v2;