local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Images);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(script.Parent.MockData);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFIntDebugAmrMockCount);
local v5 = {
    ResumeAsync = {}
};
v5.fetchUsername = function(v6) --[[ Line: 22 ]]
    -- upvalues: v5 (copy)
    v5.ResumeAsync.FetchUsername = function(v7) --[[ Line: 23 ]]
        -- upvalues: v6 (copy)
        if v7 then
            v6("", true);
            return;
        else
            v6("TestUser", false);
            return;
        end;
    end;
end;
v5.fetchGameName = function() --[[ Line: 33 ]]
    return true, "TestGame";
end;
v5.fetchGroupsAsync = function(v8, v9) --[[ Line: 37 ]]
    -- upvalues: v5 (copy)
    v5.ResumeAsync.FetchGroups = function(v10) --[[ Line: 41 ]]
        -- upvalues: v9 (copy), v8 (copy)
        if v10 then
            v9("Test fetchGroupsAsync error");
            return;
        else
            v8({
                data = {
                    {
                        id = 1, 
                        name = "TestGroup1"
                    }, 
                    {
                        id = 2, 
                        name = "TestGroup2"
                    }
                }
            });
            return;
        end;
    end;
end;
v5.fetchAssetsAsync = function(v11, v12, v13) --[[ Line: 62 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    v5.ResumeAsync.FetchAssets = function(v14, v15, v16) --[[ Line: 67 ]]
        -- upvalues: v13 (copy), v3 (ref), v4 (ref), v11 (copy), v12 (copy)
        if v14 then
            v13("Test fetchAssetsAsync error");
            return;
        else
            local v17 = nil;
            v17 = if v16 then v3.generate(v15 or v4()) else v3.Assets[v3.UserId];
            local v18 = {};
            for _, v20 in v17 do
                v18[v20.Creator.Name] = v20.Creator;
            end;
            v11.OnFetchProgressChanged:Fire(1);
            v11.OnFetchFinished:Fire();
            v12(v17, v18);
            return;
        end;
    end;
end;
v5.searchAssetsAsync = function(v21, v22, v23) --[[ Line: 88 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    v5.ResumeAsync.SearchAssets = function(v24, v25) --[[ Line: 89 ]]
        -- upvalues: v23 (copy), v3 (ref), v4 (ref), v21 (copy), v22 (copy)
        if v24 then
            v23("Test searchAssetsAsync error");
            return;
        else
            local v26 = v3.generate(v25 or v4());
            local v27 = {};
            for _, v29 in v26 do
                v27[v29.Creator.Name] = v29.Creator;
            end;
            v21.OnFetchProgressChanged:Fire(1);
            v21.OnFetchFinished:Fire();
            v22(v26, v27);
            return;
        end;
    end;
end;
v5.grantUniverseUseAssetsPermissions = function(_) --[[ Line: 105 ]]
    return true, {};
end;
v5.getThumbnailUriForScope = function() --[[ Line: 109 ]]
    -- upvalues: v1 (copy)
    return v1.getImageHelper(v1.AvailableImages.Placeholder);
end;
v5.getThumbnailForScopeAsync = function(_, v32) --[[ Line: 113 ]]
    -- upvalues: v1 (copy)
    v32(v1.getImageHelper(v1.AvailableImages.Placeholder));
end;
v5.getThumbnailForItem = function() --[[ Line: 118 ]]
    -- upvalues: v1 (copy)
    return v1.getImageHelper(v1.AvailableImages.Placeholder);
end;
v5.getThumbnailForItemAsync = function(_, v34) --[[ Line: 122 ]]
    v34(Enum.AssetFetchStatus.Success);
end;
v5.incrementFetchSessionId = function() --[[ Line: 127 ]]

end;
return v5;