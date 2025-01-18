local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local l_InsertService_0 = game:GetService("InsertService");
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAddMockSearchForAssets);
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Signal_0 (copy)
    local v5 = {};
    setmetatable(v5, v4);
    v5.RequestEnded = l_Signal_0.new();
    v5.ConversationCleared = l_Signal_0.new();
    v5.SequentialCommandsFinished = l_Signal_0.new();
    v5.RequestError = l_Signal_0.new();
    v5.RequestStarted = l_Signal_0.new();
    v5.Stream = l_Signal_0.new();
    v5._requestId = "123";
    v5._instanceStore = {};
    v5._variableStore = {};
    v5._commandStore = {};
    v5._collectorStore = {};
    v5._boundCodeGuids = {};
    v5._pluginInfoCallback = nil;
    return v5;
end;
v4.UnregisterCommand = function(v6, v7) --[[ Line: 36 ]] --[[ Name: UnregisterCommand ]]
    v6._commandStore[v7] = nil;
end;
v4.UnregisterContextCollector = function(v8, v9) --[[ Line: 40 ]] --[[ Name: UnregisterContextCollector ]]
    v8._collectorStore[v9] = nil;
end;
v4.GetInstance = function(v10, v11, v12) --[[ Line: 44 ]] --[[ Name: GetInstance ]]
    return v10._instanceStore[v11 .. v12];
end;
v4.RegisterCommandInternal = function(v13, v14, v15, _, _) --[[ Line: 48 ]] --[[ Name: RegisterCommandInternal ]]
    v13._commandStore[v14] = v15;
end;
v4.DEPRECATED_RegisterCommand = function(v18, v19, v20) --[[ Line: 52 ]] --[[ Name: DEPRECATED_RegisterCommand ]]
    v18._commandStore[v19] = v20;
end;
v4.DEPRECATED_RegisterSequentialCommand = function(v21, v22, v23) --[[ Line: 56 ]] --[[ Name: DEPRECATED_RegisterSequentialCommand ]]
    v21._commandStore[v22] = v23;
end;
v4.RegisterContextCollector = function(v24, v25, v26) --[[ Line: 60 ]] --[[ Name: RegisterContextCollector ]]
    v24._collectorStore[v25] = v26;
end;
v4.SetEphemeralVariable = function(v27, v28, v29, _) --[[ Line: 64 ]] --[[ Name: SetEphemeralVariable ]]
    v27._variableStore[v28] = v29;
end;
v4.GetEphemeralVariable = function(v31, v32) --[[ Line: 68 ]] --[[ Name: GetEphemeralVariable ]]
    return v31._variableStore[v32];
end;
v4.InvokeCommand = function(v33, v34, v35, v36) --[[ Line: 72 ]] --[[ Name: InvokeCommand ]]
    local v37 = v36 or {};
    v37.requestId = v34;
    local v38 = {
        requestId = v34, 
        arguments = v37
    };
    v33._commandStore[v35](v38);
end;
v4.ExecuteCommandAsync = function(v39, v40, v41, v42) --[[ Line: 82 ]] --[[ Name: ExecuteCommandAsync ]]
    local v43 = v42 or {};
    v43.requestId = v40;
    local v44 = {
        requestId = v40, 
        arguments = v43
    };
    return v39._commandStore[v41](v44);
end;
v4.SetPluginInfoCallback = function(v45, v46) --[[ Line: 92 ]] --[[ Name: SetPluginInfoCallback ]]
    v45._pluginInfoCallback = v46;
end;
v4.BindCodeToGuid = function(v47, v48, v49) --[[ Line: 96 ]] --[[ Name: BindCodeToGuid ]]
    v47._boundCodeGuids[v48] = v49;
end;
v4.RunSandboxedCode = function(v50, v51, _) --[[ Line: 100 ]] --[[ Name: RunSandboxedCode ]]
    local v53 = v50._boundCodeGuids[v51];
    if not v53 then
        warn("Code was not bound to a guid!");
        return false, "Code was not bound to a guid!";
    else
        local v54, v55 = loadstring(v53);
        if not v54 then
            warn("COMPILATION ERROR", v55);
            return false, v55;
        else
            getfenv(v54).print = print;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 112 ]]
                -- upvalues: v54 (copy)
                assert(v54, "Loaded code is nil!");
                v54();
            end);
            if not l_status_0 then
                warn("RUNTIME ERROR", l_result_0);
                return false, l_result_0;
            else
                return true, nil;
            end;
        end;
    end;
end;
v4._replaceInstances = function(v58, v59, v60) --[[ Line: 123 ]] --[[ Name: _replaceInstances ]]
    if type(v59) == "table" then
        for v61, v62 in v59 do
            v59[v61] = v58:_replaceInstances(v62, v60);
        end;
        return v59;
    elseif typeof(v59) == "Instance" then
        local v63 = "Instance_" .. v59:GetDebugId();
        v58._instanceStore[v60 .. v63] = v59;
        return v63;
    else
        return v59;
    end;
end;
v4.CollectContexts = function(v64, v65, v66) --[[ Line: 137 ]] --[[ Name: CollectContexts ]]
    v64:RegisterContextCollector("native_injector", function() --[[ Line: 138 ]]
        -- upvalues: v65 (copy)
        return {
            ClientVersionContext = "1.0.0", 
            use_inventory_assets = false, 
            ClientFlagContext = {
                FFlagCAPFixMissingHREndTag = {
                    boolean = "true"
                }, 
                FFlagCAPAddStreamIdToRichTextContent = {
                    boolean = "true"
                }, 
                FFlagConvAICodeRunnerClientMarker = {
                    boolean = "true"
                }
            }, 
            MessageIdentifier = v65
        };
    end);
    for _, v68 in v64._collectorStore do
        for v69, v70 in (v68(v65)) do
            if not v66[v69] then
                v66[v69] = v70;
            end;
        end;
    end;
    v64:_replaceInstances(v66, v65);
end;
v4.GetPluginInfo = function(v71, v72, v73) --[[ Line: 162 ]] --[[ Name: GetPluginInfo ]]
    if v71._pluginInfoCallback then
        return v71._pluginInfoCallback(v72, v73);
    else
        return;
    end;
end;
v4.SearchForAssets = function(_, v75) --[[ Line: 168 ]] --[[ Name: SearchForAssets ]]
    -- upvalues: v3 (copy), l_InsertService_0 (copy)
    if v3() then
        local l_l_InsertService_0_FreeModels_0 = l_InsertService_0:GetFreeModels(v75.query, 0);
        local v77 = {};
        for _, v79 in l_l_InsertService_0_FreeModels_0 do
            table.insert(v77, {
                id = v79.AssetId, 
                matchScore = 0.8, 
                properties = {
                    name = v79.Name, 
                    size = {
                        x = 5, 
                        y = 10, 
                        z = 15
                    }
                }
            });
        end;
        return {
            data = v77
        };
    else
        return;
    end;
end;
v4.AttemptSaveAndSendPlaceTelemetry = function(_) --[[ Line: 196 ]] --[[ Name: AttemptSaveAndSendPlaceTelemetry ]]

end;
return v4;