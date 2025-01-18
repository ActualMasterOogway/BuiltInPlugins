local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Data.ContextMenu);
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v5 = require(l_script_FirstAncestor_0.Util.mapValuesAsync);
local v6 = v4("createGuestFields");
return function(v7) --[[ Line: 11 ]] --[[ Name: createGuestContextMenu ]]
    -- upvalues: v5 (copy), v6 (copy), v1 (copy)
    return {
        openContextMenuAsync = function() --[[ Line: 16 ]] --[[ Name: openContextMenuAsync ]]
            -- upvalues: v5 (ref), v7 (copy)
            return (v5(v7, function(v8) --[[ Line: 17 ]]
                local v9 = v8.getActionStateAsync();
                if not v9.visible then
                    return nil;
                else
                    return {
                        enabled = v9.enabled
                    };
                end;
            end));
        end, 
        performContextMenuAction = function(v10) --[[ Line: 31 ]] --[[ Name: performContextMenuAction ]]
            -- upvalues: v6 (ref), v7 (copy), v1 (ref)
            v6("Performing action %s", v10);
            if v7[v10] ~= nil then
                v7[v10].trigger();
                return;
            else
                for _, v12 in v1.coreItems do
                    if v12 == v10 then
                        error((("Sending key that was expected to be handled by the host: %*"):format(v10)));
                        return;
                    end;
                end;
                error((("Unknown action: %*"):format(v10)));
                return;
            end;
        end
    };
end;