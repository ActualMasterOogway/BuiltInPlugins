local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.FindReplaceAllContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.FindReplaceAllActionsContext);
local l_FindReplaceAll_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).FindReplaceAll;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v10(v8, v9) --[[ Line: 16 ]]
    -- upvalues: v2 (copy)
    if v9.type == "FindWithOptions" then
        return v2.Dictionary.join(v8, {
            findOptions = v9.payload.findOptions
        });
    elseif v9.type == "ReplaceWithOptions" then
        return v2.Dictionary.join(v8, {
            replaceOptions = v9.payload.replaceOptions
        });
    else
        return v8;
    end;
end;
local function v22(v11, _, _) --[[ Line: 35 ]]
    -- upvalues: l_FindReplaceAll_0 (copy)
    local function v17(v14) --[[ Line: 45 ]]
        -- upvalues: l_FindReplaceAll_0 (ref), v11 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 46 ]]
            -- upvalues: l_FindReplaceAll_0 (ref), v14 (copy)
            l_FindReplaceAll_0.FindAsync(v14);
        end);
        if not l_status_0 then
            warn("Error in FindWithOptions: ", l_result_0);
        end;
        v11({
            type = "FindWithOptions", 
            payload = {
                findOptions = v14
            }
        });
    end;
    local function v21(v18) --[[ Line: 59 ]]
        -- upvalues: l_FindReplaceAll_0 (ref), v11 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 60 ]]
            -- upvalues: l_FindReplaceAll_0 (ref), v18 (copy)
            l_FindReplaceAll_0.ReplaceAsync(v18);
        end);
        if not l_status_1 then
            warn("Error in ReplaceWithOptions: ", l_result_1);
        end;
        v11({
            type = "ReplaceWithOptions", 
            payload = {
                replaceOptions = v18
            }
        });
    end;
    return {
        findWithOptions = v17, 
        replaceWithOptions = v21
    };
end;
FindReplaceAllContextProvider = function(v23) --[[ Line: 78 ]] --[[ Name: FindReplaceAllContextProvider ]]
    -- upvalues: v1 (copy), v10 (copy), v6 (copy), v22 (copy), v3 (copy), v4 (copy)
    local v24, v25 = v1.useReducer(v10, v6.DEFAULT_FIND_REPLACE_STATE);
    local v26 = v1.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v22 (ref), v25 (copy), v24 (copy), v23 (copy)
        return (v22(v25, v24, v23.getLocalization));
    end, {
        v25, 
        v24, 
        v23.getLocalization
    });
    return v1.createElement(v3.Provider, {
        value = v24
    }, {
        FindReplaceAllActionsContextProvider = v1.createElement(v4.Provider, {
            value = v26
        }, v23.children)
    });
end;
return v1.memo(FindReplaceAllContextProvider);