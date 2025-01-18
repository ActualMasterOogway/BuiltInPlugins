local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v7 = require(l_Actions_0.NetworkError);
local v8 = require(l_Actions_0.ResolveAssetPermissionsRollingRequest);
local v9 = require(l_Actions_0.StartInProgressAssetPermissionsRollingRequest);
local v10 = require(l_Actions_0.QueueAssetPermissionsRollingRequest);
local v11 = require(l_Actions_0.SetDescendantPermissions);
local l_Promise_0 = v4.Util.Promise;
local v13 = require(l_Parent_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
local v14 = game:DefineFastInt("ToolboxRollingAssetPermissionRequestsLimit", 10);
return function(v15, v16) --[[ Line: 26 ]]
    -- upvalues: v13 (copy), l_Promise_0 (copy), l_HttpService_0 (copy), v14 (copy), v10 (copy), v8 (copy), v9 (copy), v3 (copy), v11 (copy), v5 (copy), v7 (copy)
    return function(v17) --[[ Line: 27 ]]
        -- upvalues: v13 (ref), l_Promise_0 (ref), l_HttpService_0 (ref), v14 (ref), v10 (ref), v8 (ref), v9 (ref), v15 (copy), v16 (copy), v3 (ref), v11 (ref), v5 (ref), v7 (ref)
        if v13() then
            return l_Promise_0.new(function(v18) --[[ Line: 29 ]]
                -- upvalues: l_HttpService_0 (ref), v17 (copy), v14 (ref), v10 (ref), v8 (ref), v9 (ref), v15 (ref), v16 (ref), v3 (ref), v11 (ref), v5 (ref), v7 (ref)
                local v19 = l_HttpService_0:GenerateGUID();
                task.spawn(function() --[[ Line: 32 ]]
                    -- upvalues: v17 (ref), v14 (ref), v10 (ref), v19 (copy), v8 (ref), v18 (copy), v9 (ref), v15 (ref), v16 (ref), v3 (ref), v11 (ref), v5 (ref), v7 (ref)
                    local v20 = v17:getState();
                    if #v20.rollingAssetPermissionRequests.inProgress >= v14 then
                        v17:dispatch(v10(v19));
                        local v21 = coroutine.running();
                        local l_v21_0 = v21 --[[ copy: 1 -> 3 ]];
                        local v24 = v17.changed:connect(function(v23) --[[ Line: 44 ]]
                            -- upvalues: v19 (ref), l_v21_0 (copy)
                            if v23.rollingAssetPermissionRequests.queued[1] == v19 then
                                task.spawn(l_v21_0);
                            end;
                        end);
                        coroutine.yield();
                        v24:disconnect();
                        v20 = v17:getState();
                    end;
                    local l_descendantPermissions_0 = v20.descendantPermissions;
                    local function _() --[[ Line: 58 ]] --[[ Name: finish ]]
                        -- upvalues: v17 (ref), v8 (ref), v19 (ref), v18 (ref)
                        v17:dispatch(v8(v19));
                        v18();
                    end;
                    v17:dispatch(v9(v19));
                    return v15:getAssetPermissions(v16):andThen(function(v27) --[[ Line: 65 ]]
                        -- upvalues: l_descendantPermissions_0 (ref), v3 (ref), v16 (ref), v17 (ref), v11 (ref), v8 (ref), v19 (ref), v18 (ref)
                        local l_responseBody_0 = v27.responseBody;
                        if l_responseBody_0 and l_responseBody_0.results then
                            l_descendantPermissions_0 = v3.Dictionary.join(l_descendantPermissions_0, {
                                [v16] = l_responseBody_0.results[1]
                            });
                            v17:dispatch(v11(l_descendantPermissions_0));
                        else
                            warn("Fetching asset permissions response body empty");
                        end;
                        v17:dispatch(v8(v19));
                        v18();
                    end, function(v29) --[[ Line: 77 ]]
                        -- upvalues: v5 (ref), v17 (ref), v7 (ref), v8 (ref), v19 (ref), v18 (ref)
                        if v5.shouldDebugWarnings() then
                            warn("Fetching asset permissions unsuccessful");
                        end;
                        v17:dispatch(v7(v29));
                        v17:dispatch(v8(v19));
                        v18();
                    end);
                end);
            end);
        else
            local l_descendantPermissions_1 = v17:getState().descendantPermissions;
            return v15:getAssetPermissions(v16):andThen(function(v31) --[[ Line: 90 ]]
                -- upvalues: l_descendantPermissions_1 (ref), v3 (ref), v16 (ref), v17 (copy), v11 (ref)
                local l_responseBody_1 = v31.responseBody;
                if l_responseBody_1 and l_responseBody_1.results then
                    l_descendantPermissions_1 = v3.Dictionary.join(l_descendantPermissions_1, {
                        [v16] = l_responseBody_1.results[1]
                    });
                    v17:dispatch(v11(l_descendantPermissions_1));
                    return;
                else
                    warn("Fetching asset permissions response body empty");
                    return;
                end;
            end, function(v33) --[[ Line: 100 ]]
                -- upvalues: v5 (ref), v17 (copy), v7 (ref)
                if v5.shouldDebugWarnings() then
                    warn("Fetching asset permissions unsuccessful");
                end;
                v17:dispatch(v7(v33));
            end);
        end;
    end;
end;