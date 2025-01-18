local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Util.concatList);
local v5 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.getInstanceId);
return function(v6) --[[ Line: 13 ]] --[[ Name: createGuestHoverTracker ]]
    -- upvalues: v5 (copy), v4 (copy), l_StudioService_0 (copy)
    local function v12(v7) --[[ Line: 18 ]] --[[ Name: getAncestorIdsUpToKnown ]]
        -- upvalues: v6 (copy), v5 (ref), v4 (ref)
        if v6.watchingInstanceConnections[v7] and v7.Parent == v6.root then
            return true, {};
        else
            local v8 = {};
            local v9 = {};
            local l_Parent_0 = v7.Parent;
            while l_Parent_0 ~= nil and l_Parent_0 ~= v6.root do
                if v6.watchingInstanceConnections[l_Parent_0] then
                    table.insert(v9, v5(v6, l_Parent_0));
                    l_Parent_0 = l_Parent_0.Parent;
                else
                    v4(v8, v9);
                    table.clear(v9);
                    table.insert(v8, v5(v6, l_Parent_0));
                    l_Parent_0 = l_Parent_0.Parent;
                end;
            end;
            if #v9 == 0 then
                return false, nil;
            else
                table.insert(v8, v9[1]);
                local v11 = true;
                if #v8 > 0 then
                    return v11, v8;
                else
                    return v11, nil;
                end;
            end;
        end;
    end;
    local v17 = l_StudioService_0:GetPropertyChangedSignal("HoverInstance"):Connect(function() --[[ Line: 55 ]]
        -- upvalues: l_StudioService_0 (ref), v6 (copy), v5 (ref), v12 (copy)
        local l_HoverInstance_0 = l_StudioService_0.HoverInstance;
        if l_HoverInstance_0 == nil then
            v6.hostRpcInterface.guestUnhovered();
            return;
        else
            local v14 = v5(v6, l_HoverInstance_0);
            local v15, v16 = v12(l_HoverInstance_0);
            if v15 then
                v6.hostRpcInterface.guestHovered(v14, v16);
                return;
            else
                v6.hostRpcInterface.guestUnhovered();
                return;
            end;
        end;
    end);
    return {
        hostHovered = function(v18) --[[ Line: 75 ]] --[[ Name: hostHovered ]]
            -- upvalues: v6 (copy), l_StudioService_0 (ref)
            l_StudioService_0.HoverInstance = v18 and v6.instanceIdsToInstance[v18];
        end, 
        destroy = function() --[[ Line: 80 ]] --[[ Name: destroy ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end
    };
end;