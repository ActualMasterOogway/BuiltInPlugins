local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
return function(v5) --[[ Line: 8 ]] --[[ Name: useSessionCanvasHeight ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    local v7 = v2.useCallback(function() --[[ Line: 9 ]]
        -- upvalues: v5 (copy), v1 (ref)
        local l_children_0 = v5.focusedRootObservable.get().children;
        if l_children_0 then
            return l_children_0.treeDescendantCount * v1.explorerRowHeight;
        else
            return 0;
        end;
    end, {
        v5.focusedRootObservable
    });
    local v8, v9 = v2.useBinding(v7());
    local v10 = v2.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v9 (copy), v7 (copy)
        v9(v7());
    end, {
        v7
    });
    v4(v5.focusedRootObservable.changedSignal, v10, {
        v10
    });
    return v8;
end;