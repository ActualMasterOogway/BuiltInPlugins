local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local l_jest_0 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
local function v6() --[[ Line: 7 ]] --[[ Name: createMockSignal ]]
    -- upvalues: l_jest_0 (copy)
    local v2 = nil;
    local v3 = l_jest_0.fn(function() --[[ Line: 10 ]]
        -- upvalues: v2 (ref)
        v2 = nil;
    end);
    return {
        Connect = l_jest_0.fn(function(_, v5) --[[ Line: 13 ]]
            -- upvalues: v2 (ref), v3 (copy)
            v2 = v5;
            return {
                Disconnect = v3
            };
        end), 
        MockDisconnect = v3, 
        MockFire = function(...) --[[ Line: 22 ]] --[[ Name: MockFire ]]
            -- upvalues: v2 (ref)
            if v2 then
                v2(...);
            end;
        end
    };
end;
return function() --[[ Line: 30 ]] --[[ Name: createMockAssetAccessController ]]
    -- upvalues: v6 (copy), l_jest_0 (copy)
    return {
        ShowShareDialog = v6(), 
        NewInaccessibleAsset = v6(), 
        GetAssetMetadataAsync = l_jest_0.fn(), 
        ShareAccessToInaccessibleAssetsAsync = l_jest_0.fn()
    };
end;