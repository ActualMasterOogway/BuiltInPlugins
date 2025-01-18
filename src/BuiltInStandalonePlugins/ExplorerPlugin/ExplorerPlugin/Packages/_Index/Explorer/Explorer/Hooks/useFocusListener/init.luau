local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.WindowInputContext);
return function(v5) --[[ Line: 8 ]] --[[ Name: useFocusListener ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy)
    local v6 = v2.useContext(v4.Context);
    v1.useEffect(v6.windowHoveredObservable, function(v7) --[[ Line: 11 ]]
        -- upvalues: v5 (copy)
        v5.setListenForFocus(v7);
    end, {});
end;