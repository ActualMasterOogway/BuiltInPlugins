local l_Parent_0 = script:FindFirstAncestor("TestHelpers").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_copy_0 = v1.copy;
local l_findIndex_0 = v1.findIndex;
local v4 = {
    "rbxassetid://12789941723", 
    "rbxassetid://12789941660", 
    "rbxassetid://12789941574", 
    "rbxassetid://12789941461"
};
local v5 = {
    "rbxassetid://12786287584", 
    "rbxassetid://12786288920", 
    "rbxassetid://12786290575", 
    "rbxassetid://12786292067"
};
local v6 = {};
local v7 = {
    "rbxassetid://12786287591", 
    "rbxassetid://12786288913", 
    "rbxassetid://12786290514", 
    "rbxassetid://12786292068"
};
local v8 = {
    "rbxassetid://12786287570", 
    "rbxassetid://12786288901", 
    "rbxassetid://12786290539", 
    "rbxassetid://12786292059"
};
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    return (setmetatable({}, v9));
end;
v9.GenerateImagesAsync = function(_, v11, _) --[[ Line: 55 ]] --[[ Name: GenerateImagesAsync ]]
    -- upvalues: l_copy_0 (copy), v4 (copy)
    return l_copy_0(v4), v11, 100;
end;
v9.GenerateMaterialMapsAsync = function(_, v14) --[[ Line: 63 ]] --[[ Name: GenerateMaterialMapsAsync ]]
    -- upvalues: l_findIndex_0 (copy), v4 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v16 = l_findIndex_0(v4, function(v15) --[[ Line: 64 ]]
        -- upvalues: v14 (copy)
        return v15 == v14;
    end);
    assert(v16 ~= nil, "Invalid index");
    return {
        MetalnessMap = v6[v16], 
        NormalMap = v7[v16], 
        RoughnessMap = v8[v16]
    };
end;
v9.UploadMaterialAsync = function(_, v18) --[[ Line: 79 ]] --[[ Name: UploadMaterialAsync ]]
    -- upvalues: l_findIndex_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v20 = l_findIndex_0(v4, function(v19) --[[ Line: 80 ]]
        -- upvalues: v18 (copy)
        return v19 == v18;
    end);
    assert(v20 ~= nil, "Invalid index");
    return {
        ColorMap = v5[v20], 
        MetalnessMap = v6[v20], 
        NormalMap = v7[v20], 
        RoughnessMap = v8[v20]
    };
end;
v9.Destroy = function(_) --[[ Line: 93 ]] --[[ Name: Destroy ]]

end;
return v9;