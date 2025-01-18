local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Data.ContextMenu);
local v2 = require(l_script_FirstAncestor_0.Components.Contexts.ContextMenuContext);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.RenameBoxContext);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Util.hasOneItem);
local v7 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
return function(v8) --[[ Line: 11 ]] --[[ Name: useContextMenu ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v6 (copy), v7 (copy), v1 (copy)
    local v9 = v3.useContext(v2.Context);
    local v10 = v3.useContext(v4.Context);
    local function _() --[[ Line: 15 ]] --[[ Name: openRenameBox ]]
        -- upvalues: v8 (copy), v6 (ref), v10 (copy)
        local v11 = v8.selectedIdsArrayObservable.get();
        assert(v6(v11), "Expected to have exactly one selected node");
        v10.setRenameBoxActiveFor(v11[1]);
    end;
    v7(v9.actionTriggeredSignal, function(v13) --[[ Line: 24 ]]
        -- upvalues: v1 (ref), v8 (copy), v6 (ref), v10 (copy)
        if v13 == v1.coreItems.rename then
            local v14 = v8.selectedIdsArrayObservable.get();
            assert(v6(v14), "Expected to have exactly one selected node");
            v10.setRenameBoxActiveFor(v14[1]);
            return;
        else
            v8.performContextMenuAction(v13);
            return;
        end;
    end, {
        v8.performContextMenuAction
    });
end;