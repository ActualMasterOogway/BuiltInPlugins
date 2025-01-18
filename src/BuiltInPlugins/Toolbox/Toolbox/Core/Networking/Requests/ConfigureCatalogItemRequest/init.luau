local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.NetworkError);
local v2 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v3 = require(l_Parent_0.Core.Actions.UploadResult);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local v5 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v6 = require(l_Parent_0.Core.Networking.Requests.ConfigureSalesRequest);
local function _(v7, v8) --[[ Line: 12 ]] --[[ Name: createConfigDataTable ]]
    return {
        name = v7, 
        description = v8, 
        genres = {
            "all"
        }
    };
end;
return function(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) --[[ Line: 22 ]]
    -- upvalues: v5 (copy), v2 (copy), v6 (copy), v4 (copy), v1 (copy), v3 (copy)
    return function(v20) --[[ Line: 34 ]]
        -- upvalues: v12 (ref), v5 (ref), v13 (ref), v2 (ref), v6 (ref), v10 (copy), v11 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v4 (ref), v1 (ref), v3 (ref)
        v12 = string.sub(v12, 1, v5.NAME_CHARACTER_LIMIT);
        v13 = string.sub(v13, 1, v5.DESCRIPTION_CHARACTER_LIMIT);
        v20:dispatch(v2(v5.SCREENS.UPLOADING_ASSET));
        local function v22(_) --[[ Line: 41 ]]
            -- upvalues: v20 (copy), v6 (ref), v10 (ref), v11 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref)
            v20:dispatch(v6(v10, v11, v14, v15, v16, v17, v18, v19));
        end;
        local function v24(v23) --[[ Line: 56 ]]
            -- upvalues: v4 (ref), v20 (copy), v1 (ref), v3 (ref)
            if v4.shouldDebugWarnings() then
                warn("Lua toolbox: Could not configure catalog item");
            end;
            v20:dispatch(v1({
                responseBody = v23
            }));
            v20:dispatch(v3(false));
        end;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        local l_v12_0 = v12;
        local l_v13_0 = v13;
        l_v10_0:configureCatalogItem(l_v11_0, {
            name = l_v12_0, 
            description = l_v13_0, 
            genres = {
                "all"
            }
        }):andThen(v22, v24);
    end;
end;