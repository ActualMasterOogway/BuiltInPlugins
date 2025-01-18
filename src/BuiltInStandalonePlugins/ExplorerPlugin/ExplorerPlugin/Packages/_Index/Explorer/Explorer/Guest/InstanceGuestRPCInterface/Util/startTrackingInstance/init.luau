local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local v2 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.createDatumFromInstance);
local v3 = require(l_script_FirstAncestor_0.Util.createDebugLogger)("startTrackingInstance");
local function v4(v5, v6) --[[ Line: 9 ]] --[[ Name: startTrackingInstance ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    if v5.watchingInstanceConnections[v6] ~= nil then
        return;
    else
        local v7 = #v6:GetChildren() > 0;
        local function v12(v8) --[[ Line: 20 ]] --[[ Name: onChildAdded ]]
            -- upvalues: v7 (ref), v6 (copy), v5 (copy), v2 (ref), v3 (ref), v4 (ref)
            local l_v7_0 = v7;
            v7 = true;
            if v6:IsA("DataModel") then
                local l_isServiceVisible_0 = v5.isServiceVisible;
                if l_isServiceVisible_0 and not l_isServiceVisible_0(v8) then
                    return;
                end;
            end;
            if not v5.expandedInstances[v6] then
                if not l_v7_0 then
                    v5.hostRpcInterface.instanceReplaced(v2(v5, v6));
                end;
                return;
            elseif v5.watchingInstanceConnections[v8] then
                return;
            else
                v3("Child added to %*: %*", v6, v8);
                v4(v5, v8);
                local v11 = v2(v5, v8);
                v5.hostRpcInterface.instanceAdded(v11);
                return;
            end;
        end;
        local function v13() --[[ Line: 53 ]] --[[ Name: onChildRemoved ]]
            -- upvalues: v7 (ref), v6 (copy), v5 (copy), v2 (ref)
            v7 = #v6:GetChildren() > 0;
            if v5.expandedInstances[v6] then
                return;
            else
                if not v7 then
                    v5.hostRpcInterface.instanceReplaced(v2(v5, v6));
                end;
                return;
            end;
        end;
        local function v14() --[[ Line: 68 ]] --[[ Name: onChildRenamed ]]
            -- upvalues: v5 (copy), v2 (ref), v6 (copy)
            v5.hostRpcInterface.instanceReplaced(v2(v5, v6));
        end;
        local v15 = {};
        table.insert(v15, v6.ChildAdded:Connect(v12));
        table.insert(v15, v6.ChildRemoved:Connect(v13));
        table.insert(v15, v6:GetPropertyChangedSignal("Name"):Connect(v14));
        table.insert(v15, v6:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 82 ]]
            -- upvalues: v3 (ref), v6 (copy), v5 (copy), v2 (ref)
            v3(function() --[[ Line: 83 ]]
                -- upvalues: v6 (ref)
                return (("Parent changed to be at %*"):format((v6:GetFullName())));
            end);
            v5.hostRpcInterface.instanceReplaced(v2(v5, v6));
        end));
        v5.watchingInstanceConnections[v6] = v15;
        return;
    end;
end;
return v4;