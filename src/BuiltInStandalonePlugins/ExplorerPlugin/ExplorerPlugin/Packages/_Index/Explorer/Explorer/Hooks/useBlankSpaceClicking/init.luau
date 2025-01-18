local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.ContextMenuContext);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v4) --[[ Line: 7 ]] --[[ Name: useBlankSpaceClicking ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = v2.useContext(v1.Context);
    local v6 = v2.useCallback(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        v4.selectIds(table.freeze({}));
    end, {
        v4
    });
    local v7 = v2.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy), v6 (copy)
        if v4.instancePickerActiveObservable.get() then
            v4.instancePickerSubmitInstance(nil);
            return;
        else
            v6();
            return;
        end;
    end, {
        v4, 
        v6
    });
    local v9 = v2.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v6 (copy), v4 (copy), v5 (copy)
        v6();
        task.spawn(function() --[[ Line: 28 ]]
            -- upvalues: v4 (ref), v5 (ref)
            local v8 = v4.openContextMenuAsync();
            v5.showContextMenu(v8);
        end);
    end, {
        v6, 
        v4, 
        v5.showContextMenu
    });
    return {
        click = v7, 
        rightClick = v9
    };
end;