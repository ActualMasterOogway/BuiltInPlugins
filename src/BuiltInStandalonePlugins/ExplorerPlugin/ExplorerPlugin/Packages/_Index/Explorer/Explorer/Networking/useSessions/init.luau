local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Components.Contexts.SearchThrottlingContext);
local v6 = require(l_script_FirstAncestor_0.Components.Contexts.SettingsContext);
local v7 = require(l_script_FirstAncestor_0.Networking.createSession);
local v8 = require(l_script_FirstAncestor_0.Util.diffArray);
local v9 = require(l_script_FirstAncestor_0.Util.keys);
local _ = require(l_script_FirstAncestor_0.Networking.useServe);
return function(v11) --[[ Line: 14 ]] --[[ Name: useSessions ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v5 (copy), v6 (copy), v8 (copy), v9 (copy), v7 (copy)
    local v12 = v2.useContext(v1.AnalyticsContext);
    local v13, v14 = v2.useState({});
    local v15 = v3.useRefToState(v13);
    local v16 = v2.useRef({});
    local v17 = v2.useContext(v5.Context);
    local v18 = v2.useContext(v6.Context);
    v2.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v8 (ref), v9 (ref), v11 (copy), v16 (copy), v7 (ref), v17 (copy), v18 (copy), v12 (copy), v14 (copy)
        local v19, v20 = v8(v9(v11), v9(v16.current));
        v16.current = v11;
        if #v19 == 0 and #v20 == 0 then
            return;
        else
            local v21 = {};
            for _, v23 in v19 do
                v21[v23] = v7(v11[v23], {
                    waitForNextSearchAsync = v17.waitForNextSearchAsync, 
                    getExpandHierarchySetting = v18.getExpandHierarchy, 
                    analyticsInterface = v12
                });
            end;
            v14(function(v24) --[[ Line: 43 ]]
                -- upvalues: v19 (copy), v21 (copy), v20 (copy)
                v24 = table.clone(v24);
                for _, v26 in v19 do
                    v24[v26] = v21[v26];
                end;
                for _, v28 in v20 do
                    v24[v28] = nil;
                end;
                return v24;
            end);
            return;
        end;
    end, {
        v11
    });
    v2.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v15 (copy)
        return function() --[[ Line: 59 ]]
            -- upvalues: v15 (ref)
            for _, v30 in v15.current do
                v30.destroy();
            end;
        end;
    end, {});
    return v13;
end;