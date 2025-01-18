local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local v2 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.createDatumFromInstance);
local v3 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.startTrackingInstance);
return function(v4, v5, v6) --[[ Line: 13 ]] --[[ Name: createGuestServiceVisibility ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v7 = {};
    local function v14() --[[ Line: 23 ]] --[[ Name: updateServiceVisibility ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (ref), v7 (copy), v2 (ref)
        if not v4.root:IsA("DataModel") then
            return;
        else
            for _, v9 in v4.root:GetChildren() do
                if v5(v9) then
                    if v4.watchingInstanceConnections[v9] == nil then
                        v3(v4, v9);
                        if v7[v9] then
                            v4.hostRpcInterface.instanceReplaced(v2(v4, v9));
                        else
                            v4.hostRpcInterface.instanceAdded(v2(v4, v9));
                        end;
                    end;
                else
                    local v10 = v4.watchingInstanceConnections[v9];
                    if v10 ~= nil then
                        local v11 = v2(v4, v9);
                        v11.parentId = nil;
                        v4.hostRpcInterface.instanceReplaced(v11);
                        for _, v13 in v10 do
                            v13:Disconnect();
                        end;
                        v4.watchingInstanceConnections[v9] = nil;
                        v7[v9] = true;
                    end;
                end;
            end;
            return;
        end;
    end;
    local v15 = v6 and v6(v14);
    return {
        destroy = function() --[[ Line: 68 ]] --[[ Name: destroy ]]
            -- upvalues: v15 (copy)
            if v15 then
                v15();
            end;
        end
    };
end;