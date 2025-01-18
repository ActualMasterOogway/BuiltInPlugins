local l_RunService_0 = game:GetService("RunService");
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Parent.Signal);
local v6 = require(l_script_FirstAncestor_0.Util.concatList);
local v7 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v8 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Methods.expandAsync);
local v9 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.getInstanceId);
local v10 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.hasHiddenAncestry);
local v11 = require(l_script_FirstAncestor_0.Util.mapValues);
local v12 = require(l_script_FirstAncestor_0.Util.profile);
local v13 = v7("createGuestSelectionService");
local function v19(v14, v15) --[[ Line: 20 ]] --[[ Name: sameInstancesMutating ]]
    if #v14 ~= #v15 then
        return false;
    else
        for _, v17 in v14 do
            local v18 = table.find(v15, v17);
            if v18 == nil then
                return false;
            else
                table.remove(v15, v18);
            end;
        end;
        return true;
    end;
end;
return function(v20, v21) --[[ Line: 37 ]] --[[ Name: createGuestSelectionService ]]
    -- upvalues: v11 (copy), l_Selection_0 (copy), v10 (copy), v9 (copy), v8 (copy), v6 (copy), v19 (copy), v13 (copy), l_RunService_0 (copy), v12 (copy)
    local v22 = {};
    local function v27(v23) --[[ Line: 47 ]] --[[ Name: setSelection ]]
        -- upvalues: v11 (ref), v20 (copy), v22 (copy), l_Selection_0 (ref)
        local v26 = v11(v23, function(v24) --[[ Line: 48 ]]
            -- upvalues: v20 (ref)
            local v25 = v20.instanceIdsToInstance[v24];
            assert(v25 ~= nil, "Selecting instance that doesn't exist");
            return v25;
        end);
        table.insert(v22, v26);
        l_Selection_0:Set(v26);
    end;
    local function v34() --[[ Line: 58 ]] --[[ Name: sendCurrentSelection ]]
        -- upvalues: l_Selection_0 (ref), v10 (ref), v20 (copy), v9 (ref), v8 (ref), v6 (ref)
        local v28 = {};
        local v29 = {};
        for _, v31 in l_Selection_0:Get() do
            if not v10(v20, v31) then
                table.insert(v28, (v9(v20, v31)));
                local l_Parent_0 = v31.Parent;
                if l_Parent_0 ~= nil then
                    local v33 = v8(v20, v9(v20, l_Parent_0));
                    v6(v29, v33);
                end;
            end;
        end;
        v20.hostRpcInterface.selectionChanged(v28, v29);
    end;
    local v35 = nil;
    local function v38() --[[ Line: 84 ]] --[[ Name: flush ]]
        -- upvalues: v35 (ref), v22 (copy), l_Selection_0 (ref), v19 (ref), v13 (ref), v34 (copy)
        if v35 == nil then
            return;
        else
            v35:Disconnect();
            v35 = nil;
            local v36 = table.remove(v22, 1);
            if v36 ~= nil then
                local v37 = l_Selection_0:Get();
                if v19(v36, v37) then
                    v13("Selection predicted");
                    return;
                else
                    v13("Selection changed while one was queued up, mispredict");
                    table.clear(v22);
                end;
            end;
            v34();
            return;
        end;
    end;
    local v39 = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 107 ]]
        -- upvalues: v35 (ref), l_RunService_0 (ref), v38 (copy)
        if v35 ~= nil then
            return;
        else
            v35 = l_RunService_0.Heartbeat:Once(v38);
            return;
        end;
    end);
    local v40 = nil;
    if v21 ~= nil then
        v40 = v21:Connect(v38);
    end;
    return {
        sendCurrentSelection = v12(v34), 
        setSelection = v12(v27), 
        destroy = function() --[[ Line: 124 ]] --[[ Name: destroy ]]
            -- upvalues: v39 (copy), v40 (ref)
            v39:Disconnect();
            if v40 ~= nil then
                v40:Disconnect();
            end;
        end
    };
end;