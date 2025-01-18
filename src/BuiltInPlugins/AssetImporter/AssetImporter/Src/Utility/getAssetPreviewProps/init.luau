local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.getInsertContext);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.getAssetRenderModel);
return function(v3, v4, v5, v6) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v7 = {
        model = nil, 
        initDist = 0, 
        insertContextOffset = Vector3.new(), 
        workspacePreview = nil, 
        model = v2(v3)
    };
    v7.initDist = v7.model:GetExtentsSize().Magnitude;
    if v6 and v4.InsertInWorkspace and v5 then
        local v8, v9 = v1(v4, v7.model);
        v7.workspacePreview = v8;
        v7.insertContextOffset = v9;
    end;
    return v7;
end;