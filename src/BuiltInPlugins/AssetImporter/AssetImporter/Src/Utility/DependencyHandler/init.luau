local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_assign_0 = require(l_script_FirstAncestor_0.Packages.Dash).assign;
local function v3(v2) --[[ Line: 24 ]] --[[ Name: getAxesToFilter ]]
    if v2 == Enum.NormalId.Top or v2 == Enum.NormalId.Bottom then
        return {
            Top = true, 
            Bottom = true
        };
    elseif v2 == Enum.NormalId.Right or v2 == Enum.NormalId.Left then
        return {
            Right = true, 
            Left = true
        };
    else
        return {
            Front = true, 
            Back = true
        };
    end;
end;
local function v8(v4) --[[ Line: 34 ]] --[[ Name: getAxesFilterTable ]]
    -- upvalues: l_assign_0 (copy), v3 (copy)
    local v5 = {};
    for _, v7 in pairs(v4) do
        l_assign_0(v5, (v3(v7)));
    end;
    return v5;
end;
local v11 = {
    WorldForward = v8, 
    WorldUp = v8, 
    RigType = function(_, v10) --[[ Line: 42 ]] --[[ Name: getRigTypeFilterTable ]]
        if not v10:IsAvatar() then
            return {
                R15 = true
            };
        else
            return {};
        end;
    end
};
return function(v12, v13, v14) --[[ Line: 55 ]] --[[ Name: dependentsHandler ]]
    -- upvalues: v11 (copy)
    if v11[v12] then
        return v11[v12](v13, v14);
    else
        return nil;
    end;
end;