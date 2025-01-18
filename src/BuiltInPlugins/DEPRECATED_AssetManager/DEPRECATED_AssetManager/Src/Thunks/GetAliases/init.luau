local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Cryo);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v4 = require(l_Parent_0.Src.Thunks.GetAssetResponse);
local v5 = require(l_Parent_0.Src.Util.Screens);
return function(v6, v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), v4 (copy)
    local v10 = {
        assets = {}
    };
    local v11 = 1;
    local function v12(v13) --[[ Line: 18 ]] --[[ Name: request ]]
        -- upvalues: v7 (copy), v5 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v6 (copy), v4 (ref), v10 (ref), v9 (copy), v11 (ref), v12 (copy)
        local v14 = v7 == v5.IMAGES.Path;
        local v15 = v7 == v5.MESHES.Path;
        local v16 = l_enableAudioImport_0() and v7 == v5.AUDIO.Path;
        local v17 = l_enableVideoImport_0() and v7 == v5.VIDEO.Path;
        local v18 = v7 == v5.MODELS.Path;
        local v19 = {
            ["Images/"] = v14, 
            ["Meshes/"] = v15, 
            ["Audio/"] = v16, 
            ["Video/"] = v17, 
            ["Models/"] = v18
        };
        if v14 or v15 or v16 or v17 or v18 then
            return v6.API.Universes.getAliases(game.GameId, v13):makeRequest():andThen(v4(v10, v7, v9, v13, v19)):andThen(function(v20, v21, v22) --[[ Line: 39 ]]
                -- upvalues: v10 (ref), v11 (ref), v12 (ref), v13 (copy)
                v10 = v20;
                v11 = v21;
                if not v22 then
                    return (v12(v13 + 1));
                else
                    return v10, v11;
                end;
            end);
        else
            return;
        end;
    end;
    return v12(v8);
end;