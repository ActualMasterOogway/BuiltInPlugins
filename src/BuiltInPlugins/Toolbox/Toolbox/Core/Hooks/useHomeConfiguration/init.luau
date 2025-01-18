local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v3 = require(l_script_FirstAncestor_0.Core.Networking.Requests.GetHomeConfigurationRequest);
local v4 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: useHomeConfiguration ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), v1 (copy), v3 (copy)
    local l_networkInterface_0 = v2.use().networkInterface;
    local v10 = v4();
    local v12 = v5(function(v11) --[[ Line: 17 ]]
        -- upvalues: v7 (copy)
        if v11.homeConfiguration then
            return v11.homeConfiguration[v7.Name];
        else
            return nil;
        end;
    end);
    v1.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v3 (ref), l_networkInterface_0 (copy), v7 (copy), v8 (copy)
        v10(v3(l_networkInterface_0, v7, v8));
    end, {
        v10, 
        l_networkInterface_0, 
        v7, 
        v8
    });
    return v12;
end;