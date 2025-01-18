local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ConversationalAIAcceptanceService");
local v4 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixOnlyInsertFirstVariation);
return function(v8) --[[ Line: 14 ]] --[[ Name: insertAsset ]]
    -- upvalues: v6 (copy), v7 (copy), v4 (copy), v2 (copy), v3 (copy)
    local l_arguments_0 = v8.arguments;
    local l_altDataId_0 = l_arguments_0.altDataId;
    local v11 = l_altDataId_0 and v6.altDataMap[l_altDataId_0] or nil;
    if not v11 then
        v6.StartRecordingActions(v8.requestId);
    end;
    v11 = v11 or {
        request = v8, 
        assetId = l_arguments_0.assetId, 
        altAssets = l_arguments_0.altAssets
    };
    assert(v11, "Failed to set default altData in insertAsset");
    local l_assetId_0 = v11.assetId;
    if v7() then
        local v13 = v4.getChatBulletId(v8.requestId, l_arguments_0.chatGroup or l_arguments_0.newInstanceId);
        local v14 = v6.chatBulletMap[v13];
        if v14 then
            for _, v16 in ipairs(v14) do
                local v17 = v6.altDataMap[v16];
                if v17 then
                    local l_assetId_1 = v17.assetId;
                    if l_assetId_1 then
                        l_assetId_0 = l_assetId_1;
                        break;
                    end;
                end;
            end;
        end;
    end;
    local v19 = v4.loadAssetAsync(l_assetId_0);
    if not v19 then
        error("Failed to load asset");
    end;
    assert(v19, "Luau");
    if l_arguments_0.newInstanceId then
        v6.set(l_arguments_0.newInstanceId, v19);
    end;
    l_arguments_0.direct_instance = v19;
    v2:ExecuteCommandAsync(v8.requestId, "SetProperty", v8.arguments);
    v19.Parent = v4.getRequestParent(v19, v8.requestId);
    v6.EndRecordingActions(v8.requestId);
    v3:AssetInserted(v8.requestId, l_assetId_0);
    v4.modifyChatWithInstanceLink(v8.requestId, v19, "added", l_arguments_0.chatGroup or l_arguments_0.newInstanceId, v11);
    return v19;
end;