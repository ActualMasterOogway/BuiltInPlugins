local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.NetworkError);
local v2 = require(l_Parent_0.Core.Actions.UploadResult);
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
return function(v6, v7, v8, v9) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), l_Promise_0 (copy)
    return function(v10) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v3 (ref), v1 (ref), v8 (copy), v9 (copy), l_Promise_0 (ref), v6 (copy), v7 (copy)
        local function v11() --[[ Line: 12 ]]
            -- upvalues: v10 (copy), v2 (ref)
            v10:dispatch(v2(true));
        end;
        local function v13(_) --[[ Line: 16 ]]
            -- upvalues: v3 (ref), v10 (copy), v1 (ref), v2 (ref)
            if v3.shouldDebugWarnings() then
                warn("Lua toolbox: Could not configure tags");
            end;
            v10:dispatch(v1("Could not configure tags"));
            v10:dispatch(v2(false));
        end;
        local v14 = {};
        for _, v16 in pairs(v8) do
            v14[v16.tag.tagId] = true;
        end;
        local v17 = {};
        local v18 = {};
        if v9 then
            for _, v20 in pairs(v9) do
                v17[v20.tagId] = true;
                if not v14[v20.tagId] then
                    table.insert(v18, v20.tagId);
                end;
            end;
        end;
        local v21 = {};
        for _, v23 in pairs(v8) do
            if not v17[v23.tag.tagId] then
                table.insert(v21, v23.id);
            end;
        end;
        local v24 = {
            l_Promise_0.resolve()
        };
        for _, v26 in pairs(v21) do
            table.insert(v24, v6:deleteAssetItemTag(v26));
        end;
        l_Promise_0.all(unpack(v24)):andThen(function() --[[ Line: 54 ]]
            -- upvalues: l_Promise_0 (ref), v18 (copy), v6 (ref), v7 (ref), v11 (copy), v13 (copy)
            local v27 = {
                l_Promise_0.resolve()
            };
            for _, v29 in pairs(v18) do
                table.insert(v27, v6:addAssetTag(v7, v29));
            end;
            l_Promise_0.all(unpack(v27)):andThen(v11, v13);
        end, v13);
    end;
end;