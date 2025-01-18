local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v2 = require(l_script_FirstAncestor_0.Views.DEPRECATED_WireframeMeshView);
local _ = require(l_script_FirstAncestor_0.MeshWrapperObjects.CageMeshWrapperObject);
local _ = require(l_script_FirstAncestor_0.Views.ToolAdornees);
local _ = require(l_script_FirstAncestor_0.Types);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v7 = {};
v7.__index = v7;
local v8 = {
    2, 
    3, 
    1
};
v7.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: l_CoreGui_0 (copy), v7 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Archivable = false;
    l_Folder_0.Name = "WireframeMeshView";
    l_Folder_0.Parent = l_CoreGui_0;
    local v10 = setmetatable({
        _folder = l_Folder_0, 
        _connections = {}, 
        _wireframeHandleAdornments = {}
    }, v7);
    local function v11() --[[ Line: 46 ]] --[[ Name: onFolderChanged ]]
        -- upvalues: v10 (copy)
        if v10._onFolderChangedCallback ~= nil then
            v10._onFolderChangedCallback();
        end;
    end;
    table.insert(v10._connections, l_Folder_0.AncestryChanged:Connect(v11));
    table.insert(v10._connections, l_Folder_0.ChildRemoved:Connect(v11));
    return v10;
end;
v7.render = function(v12, v13) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy)
    local v14 = v13.Context:getTriangleIndexData();
    local v15 = v13.Context:getVertexData();
    local v16 = v13.Context:getSegmentationMap();
    local function _(v17, v18, v19) --[[ Line: 76 ]] --[[ Name: isSegment ]]
        -- upvalues: v16 (copy)
        local v20 = false;
        if v16 ~= nil then
            v20 = false;
            if v16[v17] ~= nil then
                v20 = (v16[v17][Vector3.new(v18, v19)] or v16[v17][Vector3.new(v19, v18)]) ~= nil;
            end;
        end;
        return v20;
    end;
    v12._onFolderChangedCallback = v13.FolderChangedCallback;
    if v14 == nil or v15 == nil then
        return;
    else
        for _, v23 in v12._wireframeHandleAdornments do
            v23.main:Clear();
            v23.segments:Clear();
        end;
        for v24, v25 in v14 do
            local v26 = v13.ToolAdornees:getAdornee(v24);
            local v27 = v12._wireframeHandleAdornments[v26];
            if v27 == nil then
                local l_WireframeHandleAdornment_0 = Instance.new("WireframeHandleAdornment");
                l_WireframeHandleAdornment_0.Adornee = v26;
                l_WireframeHandleAdornment_0.Color3 = v13.WireColor;
                l_WireframeHandleAdornment_0.Parent = v12._folder;
                local l_WireframeHandleAdornment_1 = Instance.new("WireframeHandleAdornment");
                l_WireframeHandleAdornment_1.Adornee = v26;
                l_WireframeHandleAdornment_1.Color3 = v13.SegmentColor or v13.WireColor;
                l_WireframeHandleAdornment_1.Parent = v12._folder;
                v27 = {
                    main = l_WireframeHandleAdornment_0, 
                    segments = l_WireframeHandleAdornment_1
                };
                v12._wireframeHandleAdornments[v26] = v27;
            end;
            for _, v31 in v25 do
                for v32, v33 in v8 do
                    local v34 = if v31[v32] < v31[v33] then v31[v32] else v31[v33];
                    local v35 = if v31[v32] < v31[v33] then v31[v33] else v31[v32];
                    local v36 = false;
                    if v16 ~= nil then
                        v36 = false;
                        if v16[v24] ~= nil then
                            v36 = (v16[v24][Vector3.new(v34, v35)] or v16[v24][Vector3.new(v35, v34)]) ~= nil;
                        end;
                    end;
                    if v36 then
                        v27.segments:AddLine(v15[v24][v34], v15[v24][v35]);
                    else
                        v27.main:AddLine(v15[v24][v34], v15[v24][v35]);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v7.disconnect = function(v37) --[[ Line: 145 ]] --[[ Name: disconnect ]]
    for _, v39 in v37._connections do
        v39:Disconnect();
    end;
end;
v7.cleanup = function(v40) --[[ Line: 151 ]] --[[ Name: cleanup ]]
    v40:disconnect();
    for _, v42 in v40._wireframeHandleAdornments do
        v42.main:Destroy();
        v42.segments:Destroy();
    end;
    v40._folder:Destroy();
end;
if v6() then
    return v7;
else
    return v2;
end;