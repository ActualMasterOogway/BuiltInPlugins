local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = {};
v2.__index = v2;
local function v3(v4) --[[ Line: 7 ]] --[[ Name: deepFreeze ]]
    -- upvalues: v3 (copy)
    if typeof(v4) == "table" then
        if not table.isfrozen(v4) then
            table.freeze(v4);
        end;
        for _, v6 in v4 do
            v3(v6);
        end;
    end;
    return v4;
end;
v2.new = function(v7) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v8 = {};
    setmetatable(v8, v2);
    v8._alive = true;
    v8._model = table.freeze({
        state = "Inactive"
    });
    v8._plugin = v7;
    v8._threads = {};
    local l_v7_PluginComponent_0 = v7:GetPluginComponent("AssetAccessController");
    v8._assetAccessController = l_v7_PluginComponent_0;
    v8._showShareDialogConnection = l_v7_PluginComponent_0.ShowShareDialog:Connect(function(v10) --[[ Line: 33 ]]
        -- upvalues: v8 (copy)
        v8:_ShowShareDialog(v10);
    end);
    v8._newInaccessibleAssetConnection = l_v7_PluginComponent_0.NewInaccessibleAsset:Connect(function(v11) --[[ Line: 36 ]]
        -- upvalues: v8 (copy)
        v8:_NewInaccessibleAsset(v11);
    end);
    v8._shareAccessConnection = v7:OnInvoke("ShareAccess", function() --[[ Line: 39 ]]
        -- upvalues: v8 (copy)
        v8:_ShareAccess();
    end);
    v8._shareDialogDismissedConnection = v7:OnInvoke("ShareDialogDismissed", function() --[[ Line: 42 ]]
        -- upvalues: v8 (copy)
        v8:_ShareDialogDismissed();
    end);
    v8._onGetAssetMetadataFinished = function() --[[ Line: 47 ]]

    end;
    v8._onShareAccessFinished = function() --[[ Line: 48 ]]

    end;
    v8._plugin:SetItem("ShareDialogModel", v8._model);
    return v8;
end;
v2._GetModel = function(v12) --[[ Line: 55 ]] --[[ Name: _GetModel ]]
    assert(v12._alive, "ShareDialogController has been destroyed");
    return v12._model;
end;
v2._SetModel = function(v13, v14) --[[ Line: 60 ]] --[[ Name: _SetModel ]]
    -- upvalues: v3 (copy)
    assert(v13._alive, "ShareDialogController has been destroyed");
    v13._model = v3(table.clone(v14));
    v13._plugin:SetItem("ShareDialogModel", v13._model);
end;
v2._Defer = function(v15, v16) --[[ Line: 66 ]] --[[ Name: _Defer ]]
    assert(v15._alive, "ShareDialogController has been destroyed");
    local v17 = nil;
    v17 = task.defer(function() --[[ Line: 70 ]]
        -- upvalues: v16 (copy), v15 (copy), v17 (ref)
        v16();
        v15._threads[v17] = nil;
    end);
    v15._threads[v17] = true;
    return v17;
end;
v2._GetAndHydrateAssetMetadata = function(v18, v19) --[[ Line: 79 ]] --[[ Name: _GetAndHydrateAssetMetadata ]]
    assert(v18._alive, "ShareDialogController has been destroyed");
    assert(v18:_GetModel().state == "Prompt", "Can only load asset metadata in the Prompt state");
    v18:_Defer(function() --[[ Line: 83 ]]
        -- upvalues: v18 (copy), v19 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 84 ]]
            -- upvalues: v18 (ref), v19 (ref)
            return v18._assetAccessController:GetAssetMetadataAsync(v19);
        end);
        local v22 = v18:_GetModel();
        if v22.state ~= "Prompt" then
            v18._onGetAssetMetadataFinished();
            return;
        else
            assert(v22.state == "Prompt", "Luau");
            local v23 = table.clone(v22.assetModels);
            if l_status_0 then
                for _, v25 in l_result_0 do
                    if v23[v25.id] and v23[v25.id].state == "Loading" then
                        v23[v25.id] = {
                            state = "Loaded", 
                            metadata = v25
                        };
                    end;
                end;
            else
                for _, v27 in v19 do
                    if v23[v27] and v23[v27].state == "Loading" then
                        v23[v27] = {
                            state = "Failed"
                        };
                    end;
                end;
            end;
            v18:_SetModel({
                state = "Prompt", 
                assetModels = v23
            });
            v18._onGetAssetMetadataFinished();
            return;
        end;
    end);
end;
v2._ShowShareDialog = function(v28, v29) --[[ Line: 126 ]] --[[ Name: _ShowShareDialog ]]
    assert(v28._alive, "ShareDialogController has been destroyed");
    local v30 = {};
    for _, v32 in v29 do
        v30[v32] = {
            state = "Loading"
        };
    end;
    v28:_SetModel({
        assetModels = v30, 
        state = "Prompt"
    });
    v28:_GetAndHydrateAssetMetadata(v29);
end;
v2._NewInaccessibleAsset = function(v33, v34) --[[ Line: 144 ]] --[[ Name: _NewInaccessibleAsset ]]
    assert(v33._alive, "ShareDialogController has been destroyed");
    local v35 = v33:_GetModel();
    if v35.state ~= "Prompt" then
        return;
    else
        assert(v35.state == "Prompt", "Luau");
        local v36 = table.clone(v35.assetModels);
        v36[v34] = {
            state = "Loading"
        };
        v33:_SetModel({
            assetModels = v36, 
            state = "Prompt"
        });
        v33:_GetAndHydrateAssetMetadata({
            v34
        });
        return;
    end;
end;
v2._ShareAccess = function(v37) --[[ Line: 166 ]] --[[ Name: _ShareAccess ]]
    assert(v37._alive, "ShareDialogController has been destroyed");
    local v38 = v37:_GetModel();
    if v38.state ~= "Prompt" then
        v37._onShareAccessFinished();
        return;
    else
        assert(v38.state == "Prompt", "Luau");
        v37:_SetModel({
            state = "Sharing", 
            assetModels = v38.assetModels
        });
        local v39 = {};
        for v40, _ in v38.assetModels do
            table.insert(v39, v40);
        end;
        v37:_Defer(function() --[[ Line: 185 ]]
            -- upvalues: v37 (copy), v39 (copy)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 186 ]]
                -- upvalues: v37 (ref), v39 (ref)
                return v37._assetAccessController:ShareAccessToInaccessibleAssetsAsync(v39);
            end);
            local v44 = v37:_GetModel();
            if v44.state ~= "Sharing" then
                v37._onShareAccessFinished();
                return;
            else
                assert(v44.state == "Sharing", "Luau");
                if not l_status_1 then
                    v37:_SetModel({
                        state = "UnexpectedError"
                    });
                    v37._onShareAccessFinished();
                    return;
                elseif #l_result_1 == 0 then
                    v37:_SetModel({
                        state = "Inactive"
                    });
                    v37._onShareAccessFinished();
                    return;
                else
                    local v45 = {};
                    for _, v47 in l_result_1 do
                        v45[v47] = table.clone(v44.assetModels[v47]);
                    end;
                    v37:_SetModel({
                        state = "CantShare", 
                        assetModels = v45
                    });
                    v37._onShareAccessFinished();
                    return;
                end;
            end;
        end);
        return;
    end;
end;
v2._ShareDialogDismissed = function(v48) --[[ Line: 226 ]] --[[ Name: _ShareDialogDismissed ]]
    assert(v48._alive, "ShareDialogController has been destroyed");
    v48:_SetModel({
        state = "Inactive"
    });
end;
v2.Destroy = function(v49) --[[ Line: 233 ]] --[[ Name: Destroy ]]
    assert(v49._alive, "ShareDialogController already destroyed");
    for v50, _ in v49._threads do
        task.cancel(v50);
    end;
    v49._threads = {};
    v49._showShareDialogConnection:Disconnect();
    v49._newInaccessibleAssetConnection:Disconnect();
    v49._shareAccessConnection:Disconnect();
    v49._shareDialogDismissedConnection:Disconnect();
    v49._plugin:SetItem("ShareDialogModel", nil);
    v49._alive = false;
end;
return table.freeze(v2);