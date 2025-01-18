local l_Parent_0 = script.Parent;
local v1 = require(script.Url);
local l_Networking_0 = require(l_Parent_0.Http).Networking;
local v3 = require(l_Parent_0.Util.strict);
local function v4(v5, v6, v7) --[[ Line: 48 ]] --[[ Name: initDirectoryWithArgs ]]
    -- upvalues: v4 (copy), v3 (copy)
    assert(v5:IsA("Instance"), "dir is expected to be an Instance");
    local v8 = {};
    for _, v10 in ipairs(v5:GetChildren()) do
        if v10.ClassName == "Folder" then
            v8[v10.Name] = v4(v10, v6, v7);
        elseif v10.ClassName == "ModuleScript" then
            local v11 = require(v10);
            v8[v10.Name] = v11(v6, v7);
        else
            warn(string.format("Unexpected object found when constructing children table : %s", v10:GetFullName()));
        end;
    end;
    if next(v8) == nil then
        warn(string.format("Could not find any children for %s", v5:GetFullName()));
    end;
    return v3(v8);
end;
local v12 = {
    Url = v1
};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 83 ]] --[[ Name: new ]]
    -- upvalues: l_Networking_0 (copy), v1 (copy), v4 (copy), v12 (copy)
    if not v13 then
        v13 = {};
    end;
    local v14 = v13.networking or l_Networking_0.new({
        isInternal = true
    });
    local v15 = v13.baseUrl or v1.new();
    local v16 = {
        _baseUrls = v15, 
        APIS = v4(script.APIS, v14, v15), 
        API = v4(script.API, v14, v15), 
        AssetGame = v4(script.AssetGame, v14, v15), 
        Catalog = v4(script.Catalog, v14, v15), 
        GameInternationalization = v4(script.GameInternationalization, v14, v15), 
        Inventory = v4(script.Inventory, v14, v15), 
        Locale = v4(script.Locale, v14, v15), 
        LocalizationTables = v4(script.LocalizationTables, v14, v15), 
        Develop = v4(script.Develop, v14, v15), 
        TranslationRoles = v4(script.TranslationRoles, v14, v15), 
        WWW = v4(script.WWW, v14, v15)
    };
    setmetatable(v16, v12);
    return v16;
end;
return v12;