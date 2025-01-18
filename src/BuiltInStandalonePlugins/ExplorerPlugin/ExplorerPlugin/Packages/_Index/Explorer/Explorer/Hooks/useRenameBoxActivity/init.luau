local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Components.Contexts.RenameBoxContext);
local v4 = require(l_script_FirstAncestor_0.Util.profile);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
return v4(function(v6) --[[ Line: 9 ]] --[[ Name: useRenameBoxActivity ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    local v7 = v2.useContext(v3.Context);
    local v8 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v7 (copy), v6 (copy)
        v7.setRenameBoxActiveFor(v6.get().datum.id);
    end, {
        v7.setRenameBoxActiveFor, 
        v6
    });
    local v9 = v2.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy)
        v7.setRenameBoxActiveFor(nil);
    end, {
        v7.setRenameBoxActiveFor
    });
    local v10, v11 = v2.useState(false);
    v1.useEffect(v6, function(v12) --[[ Line: 30 ]]
        -- upvalues: v11 (copy), v7 (copy)
        v11(v7.renameBoxActiveFor == v12.datum.id);
    end, {
        v6, 
        v7.renameBoxActiveFor
    });
    return {
        enable = v8, 
        disable = v9, 
        enabled = v10
    };
end);