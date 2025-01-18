local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.concatList);
local v4 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.createDatumFromInstance);
local v5 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v6 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.getInstanceId);
local v7 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.hasHiddenAncestry);
local v8 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.startTrackingInstance);
local v9 = v5("createGuestSearching");
local function v12() --[[ Line: 16 ]] --[[ Name: clockBasedCreateSearchThrottler ]]
    local v10 = nil;
    return function() --[[ Line: 19 ]]
        -- upvalues: v10 (ref)
        if v10 == nil then
            v10 = os.clock();
            return false;
        else
            local v11 = os.clock() - v10 >= 0.01;
            if v11 then
                v10 = nil;
            end;
            return v11;
        end;
    end;
end;
local function v19(v13, v14, v15) --[[ Line: 34 ]] --[[ Name: trackAncestry ]]
    -- upvalues: v8 (copy), v4 (copy)
    local l_v14_0 = v14;
    local v17 = {};
    while l_v14_0 ~= nil and l_v14_0 ~= v13.root and not v13.watchingInstanceConnections[l_v14_0] do
        v8(v13, l_v14_0);
        table.insert(v17, v4(v13, l_v14_0));
        l_v14_0 = l_v14_0.Parent;
    end;
    for v18 = #v17, 1, -1 do
        table.insert(v15, v17[v18]);
    end;
end;
return function(v20, v21) --[[ Line: 63 ]] --[[ Name: createGuestSearching ]]
    -- upvalues: v12 (copy), v7 (copy), v3 (copy), v6 (copy), v19 (copy), v9 (copy)
    local v22 = v21 or v12;
    local l_ExplorerFilter_0 = Instance.new("ExplorerFilter");
    l_ExplorerFilter_0.Parent = game;
    local v24 = nil;
    local function v25() --[[ Line: 83 ]]
        error("shouldThrottle called before a search was started");
    end;
    local v26 = {};
    local function v31() --[[ Line: 89 ]] --[[ Name: fetchNextResults ]]
        -- upvalues: v24 (ref), v26 (ref), v25 (ref), v20 (copy), v7 (ref), v3 (ref), l_ExplorerFilter_0 (copy), v6 (ref), v19 (ref)
        assert(v24 ~= nil, "fetchNextResults() called without a search ID");
        local v27 = {};
        local v28 = {};
        while #v26 > 0 and not v25() do
            local v29 = table.remove(v26);
            if v29:IsDescendantOf(v20.root) and not v7(v20, v29) then
                v3(v26, v29:GetChildren());
                if l_ExplorerFilter_0:InstancePassesFilter(v29) then
                    local v30 = v6(v20, v29);
                    v19(v20, v29, v28);
                    table.insert(v27, v30);
                end;
            end;
        end;
        v20.hostRpcInterface.receiveSearchResults(v24, v27, v28);
        return #v26 == 0;
    end;
    local v32 = nil;
    local function v36(v33) --[[ Line: 124 ]] --[[ Name: onGameDescendantAdded ]]
        -- upvalues: v24 (ref), v7 (ref), v20 (copy), l_ExplorerFilter_0 (copy), v6 (ref), v19 (ref)
        assert(v24 ~= nil, "game.DescendantAdded connected with no search ID");
        if v7(v20, v33) or not l_ExplorerFilter_0:InstancePassesFilter(v33) then
            return;
        else
            local v34 = {};
            local v35 = v6(v20, v33);
            v19(v20, v33, v34);
            v20.hostRpcInterface.receiveSearchResults(v24, {
                v35
            }, v34);
            return;
        end;
    end;
    local function v40(v37, v38) --[[ Line: 137 ]] --[[ Name: startSearchAsync ]]
        -- upvalues: v24 (ref), l_ExplorerFilter_0 (copy), v26 (ref), v20 (copy), v32 (ref), v36 (copy), v25 (ref), v22 (copy), v31 (copy)
        v24 = v37;
        l_ExplorerFilter_0:SetFilter(v38);
        v26 = v20.root:GetChildren();
        if v32 == nil then
            v32 = game.DescendantAdded:Connect(v36);
        end;
        v25 = v22();
        if v25() then
            return false;
        else
            local l_l_ExplorerFilter_0_Autocompleter_0 = l_ExplorerFilter_0:GetAutocompleter();
            if l_l_ExplorerFilter_0_Autocompleter_0.RequiresOutsideContext then
                v20.hostRpcInterface.receiveSearchSuggestions(v37, l_l_ExplorerFilter_0_Autocompleter_0:GetSuggestions());
            end;
            return (v31());
        end;
    end;
    local function v42(v41) --[[ Line: 159 ]] --[[ Name: continueSearchAsync ]]
        -- upvalues: v24 (ref), v9 (ref), v26 (ref), v31 (copy)
        if v41 ~= v24 then
            v9("Request ID mismatch in continueSearchAsync: %d vs. %d", v41, v24);
            return true;
        else
            assert(#v26 ~= 0, "continueSearchAsync called with nothing left in queue");
            return (v31());
        end;
    end;
    local function v44(v43) --[[ Line: 169 ]] --[[ Name: stopSearching ]]
        -- upvalues: v24 (ref), v9 (ref), v32 (ref)
        assert(v24 ~= nil, "stopSearching sent with no current search ID");
        if v43 ~= v24 then
            v9("Request ID mismatch in stopSearching: %d vs. %d", v43, v24);
            return;
        else
            assert(v32 ~= nil, "stopSearching called when search didn't result in a connection");
            v32:Disconnect();
            v32 = nil;
            return;
        end;
    end;
    local function v45() --[[ Line: 182 ]] --[[ Name: destroy ]]
        -- upvalues: l_ExplorerFilter_0 (copy), v32 (ref)
        l_ExplorerFilter_0:Destroy();
        if v32 ~= nil then
            v32:Disconnect();
        end;
    end;
    return {
        startSearchAsync = v40, 
        continueSearchAsync = v42, 
        stopSearching = v44, 
        destroy = v45
    };
end;