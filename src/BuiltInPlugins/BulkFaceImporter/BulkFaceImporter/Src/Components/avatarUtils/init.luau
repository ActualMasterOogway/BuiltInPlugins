local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkFaceImporter");
local v1 = {};
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagBulkFaceImporterRemoveDashSplitOn);
local v3 = if v2() then nil else require(script.Parent.Parent.Parent.Packages._Index.Dash.Dash.splitOn);
v1.getFaceList = function(v4) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = {};
    for _, v7 in pairs(v4) do
        local v8 = if v2() then string.split(v7.Name, "_") else v3(v7.Name, "_");
        local v9 = v8[1];
        local v10 = v8[2];
        if v5[v9] == nil then
            v5[v9] = {
                [v10] = v7
            };
        else
            v5[v9][v10] = v7;
        end;
    end;
    return v5;
end;
v1.getAllAvatars = function() --[[ Line: 37 ]]
    local v11 = {};
    local l_workspace_Descendants_0 = workspace:GetDescendants();
    for _, v14 in pairs(l_workspace_Descendants_0) do
        if v14:IsA("Model") and v14:FindFirstChild("Humanoid") ~= nil then
            table.insert(v11, v14);
        end;
    end;
    return v11;
end;
v1.checkAvatar = function(v15) --[[ Line: 51 ]]
    local v16 = {};
    for _, v18 in v15 do
        if v18:FindFirstChild("Humanoid") ~= nil then
            table.insert(v16, v18);
        end;
    end;
    if #v16 ~= 0 then
        return v16;
    else
        return nil;
    end;
end;
return v1;