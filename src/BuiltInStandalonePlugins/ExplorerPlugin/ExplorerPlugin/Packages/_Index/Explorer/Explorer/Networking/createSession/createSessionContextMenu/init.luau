local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Data.ContextMenu);
local v2 = require(l_script_FirstAncestor_0.Networking.createSession.Expanding);
local _ = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
return function(v6, v7) --[[ Line: 9 ]] --[[ Name: createSessionContextMenu ]]
    -- upvalues: v1 (copy), v2 (copy)
    local function v8() --[[ Line: 16 ]] --[[ Name: openContextMenuAsync ]]
        -- upvalues: v6 (copy), v7 (copy)
        return v6.guestRpcInterface.openContextMenuAsync(v7.get());
    end;
    local function v10(v9) --[[ Line: 20 ]] --[[ Name: performContextMenuAction ]]
        -- upvalues: v1 (ref), v2 (ref), v6 (copy), v7 (copy)
        if v9 == v1.coreItems.collapseAll then
            v2.collapseAll(v6, v7.get());
            return;
        elseif v9 == v1.coreItems.expandAll then
            v2.expandAll(v6, v7.get());
            return;
        else
            v6.guestRpcInterface.performContextMenuAction(v9);
            return;
        end;
    end;
    return {
        openContextMenuAsync = v8, 
        performContextMenuAction = v10
    };
end;