local l_Util_0 = script:FindFirstAncestor("R15Migrator").Src.Util;
local v1 = require(l_Util_0.SaveInterface);
local v2 = {
    game:GetService("Chat"), 
    game:GetService("Lighting"), 
    game:GetService("ReplicatedFirst"), 
    game:GetService("ReplicatedStorage"), 
    game:GetService("ServerScriptService"), 
    game:GetService("ServerStorage"), 
    game:GetService("StarterGui"), 
    game:GetService("StarterPack"), 
    game:GetService("StarterPlayer"), 
    game:GetService("Workspace")
};
local function v8(v3, v4, v5) --[[ Line: 19 ]] --[[ Name: filterDescendants ]]
    for _, v7 in v4 do
        if not v3 or v3(v7) then
            table.insert(v5, v7);
        end;
    end;
end;
return function(v9) --[[ Line: 28 ]] --[[ Name: findAllInServices ]]
    -- upvalues: v2 (copy), v1 (copy), v8 (copy)
    local v10 = {};
    for _, v12 in v2 do
        assert(v1.isRootSaveFolderChildOf(v12) or not v1.isRootSaveFolderDescendantOf(v12));
        if v1.isRootSaveFolderChildOf(v12) then
            for _, v14 in v12:GetChildren() do
                if not v1.isRootSaveFolder(v14) then
                    local l_v14_Descendants_0 = v14:GetDescendants();
                    table.insert(l_v14_Descendants_0, v14);
                    v8(v9, l_v14_Descendants_0, v10);
                end;
            end;
        else
            v8(v9, v12:GetDescendants(), v10);
        end;
    end;
    return v10;
end;