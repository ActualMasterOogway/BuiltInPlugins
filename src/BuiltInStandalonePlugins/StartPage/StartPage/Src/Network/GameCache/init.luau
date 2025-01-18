local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Network.NetworkCache);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_collectArray_0 = v3.collectArray;
local l_includes_0 = v3.includes;
local v6 = game:DefineFastFlag("LuaStartPageGameCacheUnloadClearTempUrls", false);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = v1.new(function(v8) --[[ Line: 21 ]] --[[ Name: getGameKey ]]
    local v9 = v8.Id or v8.FilePath or v8.ContentId;
    assert(v9, "Item has no Id or FilePath or ContentId");
    return (tostring(v9));
end, function(v10) --[[ Line: 27 ]] --[[ Name: getQueryDetails ]]
    return {
        pageSize = v10.pageSize or 10, 
        alwaysRefetch = not v10.isTemplates, 
        sortFn = v10.searchKey == "Recents" and function(v11, v12) --[[ Line: 32 ]]
            if not v11.LastViewed then
                warn("Game must have an updated date value");
                return false;
            elseif not v12.LastViewed then
                warn("Game must have an updated date value");
                return true;
            else
                local v13 = DateTime.fromIsoDate(v11.LastViewed);
                local v14 = DateTime.fromIsoDate(v12.LastViewed);
                if not v13 then
                    warn((("LastViewed of game must be converted to DateTime: %*"):format(v13)));
                    return false;
                elseif not v14 then
                    warn((("LastViewed of game must be converted to DateTime: %*"):format(v14)));
                    return false;
                else
                    return v13.UnixTimestampMillis > v14.UnixTimestampMillis;
                end;
            end;
        end or nil
    };
end);
local v16 = {};
local v17 = nil;
v15.tempUrls = v16;
v15.load = function() --[[ Line: 62 ]]
    -- upvalues: v17 (ref), l_StartPageManager_0 (copy), v16 (ref), v15 (copy), l_includes_0 (copy), l_collectArray_0 (copy)
    v17 = l_StartPageManager_0.ImageImportedSignal:Connect(function(v18, v19) --[[ Line: 63 ]]
        -- upvalues: v16 (ref), v15 (ref), l_includes_0 (ref), l_collectArray_0 (ref)
        if v16[v18] then
            return;
        else
            v16[v18] = v19;
            v15:updateItemsByFilter(function(v20) --[[ Line: 69 ]]
                -- upvalues: v16 (ref), l_includes_0 (ref), v18 (copy), l_collectArray_0 (ref)
                if v20.CDNUrl then
                    local v21 = v16[v20.CDNUrl];
                    if v20.ImageUrl ~= v21 then
                        return {
                            Id = v20.Id, 
                            ImageUrl = v21
                        };
                    end;
                end;
                if not v20.TeamCreateCDNUrls or not l_includes_0(v20.TeamCreateCDNUrls, v18) then
                    return nil;
                else
                    local v24 = l_collectArray_0(v20.TeamCreateCDNUrls, function(_, v23) --[[ Line: 82 ]]
                        -- upvalues: v16 (ref)
                        return v16[v23];
                    end);
                    return {
                        Id = v20.Id, 
                        TeamCreatePresence = v24
                    };
                end;
            end);
            return;
        end;
    end);
end;
v15.unload = function() --[[ Line: 92 ]]
    -- upvalues: v15 (copy), v6 (copy), v16 (ref), v17 (ref)
    v15:reset();
    if v6 then
        v16 = {};
        v15.tempUrls = v16;
    end;
    v17:Disconnect();
end;
return v15;