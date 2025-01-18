local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local l_Utility_0 = l_Parent_0.Utility;
local v5 = require(l_Utility_0.canDragInsertAsset);
local v6 = require(l_Utility_0.constructAssetGameAssetIdUrl);
local v7 = require(l_Utility_0.isRibbonDraggerTool);
local v8 = require(l_Utility_0.sanitizeMeshAsset);
local _ = function(v9, v10) --[[ Line: 13 ]] --[[ Name: setSourceAssetIdOnInstances ]]
    for _, v12 in ipairs(v10) do
        v12.SourceAssetId = v9;
    end;
end;
local v14 = {};
v14.__index = v14;
v14.new = function(v15) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    assert(v15, "InsertAssetController.new expects a Plugin instance.");
    local v16 = setmetatable({
        _plugin = v15, 
        _dragState = nil
    }, v14);
    v16:registerAssetInsertionHandlers();
    return v16;
end;
v14.beginDragInsert = function(v17, v18, v19, v20, v21) --[[ Line: 35 ]] --[[ Name: beginDragInsert ]]
    -- upvalues: v5 (copy), v3 (copy), v7 (copy), l_ChangeHistoryService_0 (copy), v6 (copy)
    if not v5(v20) then
        return v3.reject("Cannot drag asset type");
    else
        if v17._dragState then
            if v17._dragState.promise then
                v17._dragState.promise:cancel();
            end;
            v17._dragState = nil;
        end;
        if not v7(v17._plugin:GetSelectedRibbonTool()) then
            v17._plugin:SelectRibbonTool(Enum.RibbonTool.Select, UDim2.new());
        end;
        l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %d"):format(v18));
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: v17 (copy), v18 (copy), v19 (copy), v20 (copy), v6 (ref), v21 (copy)
            v17._plugin.UsesAssetInsertionDrag = true;
            v17._dragState = {
                assetId = v18, 
                assetName = v19, 
                assetTypeId = v20.Value
            };
            local v22 = v6(v18, v19, v20, v21);
            v17._plugin:StartDrag({
                Sender = "InsertAssetController", 
                MimeType = "text/plain", 
                Data = v22
            });
        end);
        if l_status_0 then
            v17._dragState.promise = v3.new(function(v25, v26) --[[ Line: 74 ]]
                -- upvalues: v17 (copy)
                v17._dragState.resolve = v25;
                v17._dragState.reject = v26;
            end);
            return v17._dragState.promise;
        else
            return v3.reject(("Drag insert failed for asset %d %s: %s"):format(v18, v19, l_result_0 or ""));
        end;
    end;
end;
v14.registerAssetInsertionHandlers = function(v27) --[[ Line: 84 ]] --[[ Name: registerAssetInsertionHandlers ]]
    -- upvalues: v8 (copy)
    v27._plugin.ProcessAssetInsertionDrag = function(v28, v29, v30) --[[ Line: 86 ]]
        -- upvalues: v8 (ref), v27 (copy)
        for _, v32 in ipairs(v30) do
            v32.SourceAssetId = v28;
        end;
        if v29 == Enum.AssetType.MeshPart.Value then
            return v8(v28, v30);
        else
            v27._dragState.instances = v30;
            return v30;
        end;
    end;
    v27._plugin.ProcessAssetInsertionDrop = function() --[[ Line: 98 ]]
        -- upvalues: v27 (copy)
        spawn(function() --[[ Line: 100 ]]
            -- upvalues: v27 (ref)
            if not v27._dragState then
                return;
            else
                local l__dragState_0 = v27._dragState;
                v27._dragState = nil;
                l__dragState_0.resolve(l__dragState_0.assetId, l__dragState_0.instances);
                return;
            end;
        end);
    end;
end;
return v14;