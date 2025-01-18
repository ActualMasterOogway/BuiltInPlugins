local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("StudioService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAddCommandSearchInsertAsset);
return function(v6) --[[ Line: 12 ]] --[[ Name: searchInsertAsset ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy)
    assert(v5(), "SearchInsertAsset is not enabled");
    local l_requestId_0 = v6.requestId;
    local l_arguments_0 = v6.arguments;
    local l_query_0 = l_arguments_0.query;
    local v10 = l_arguments_0.style or "";
    local v11 = l_arguments_0.theme or "";
    local v12 = l_arguments_0.relativePosition or Vector3.new(0, 0, 0, 0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
        -- upvalues: v2 (ref), l_query_0 (copy), v3 (ref), v10 (copy), v11 (copy)
        return v2:SearchForAssets({
            query = l_query_0, 
            assetType = "ASSET_TYPE_MODEL", 
            assetSource = "ASSET_SOURCE_MARKETPLACE", 
            userId = v3:GetUserId(), 
            isLexical = true, 
            numResults = 6, 
            style = v10, 
            theme = v11, 
            isAssistantGeneratedQuery = true, 
            textFilterThresholdOverride = 0.75, 
            sizeInclusiveThresholdMin = {
                x = 0, 
                y = 0, 
                z = 0
            }, 
            sizeInclusiveThresholdMax = {
                x = 2048, 
                y = 2048, 
                z = 2048
            }
        });
    end);
    if not l_status_0 then
        error((("Failed to search for asset: %*"):format(l_result_0)));
    end;
    local l_data_0 = l_result_0.data;
    assert(#l_data_0 > 0, (("Failed to find \"%*\" in the marketplace!"):format(l_query_0)));
    local v16 = table.create(#l_data_0);
    for _, v18 in l_data_0 do
        table.insert(v16, (tostring(v18.id)));
    end;
    return v2:ExecuteCommandAsync(l_requestId_0, "InsertAsset", {
        assetId = v16[1], 
        altAssets = v16, 
        chatGroup = l_query_0, 
        properties = {
            instanceName = l_query_0, 
            parentInstanceId = "workspace", 
            positionOrigin = "currentCamera", 
            position = {
                x = v12.X, 
                z = v12.Z
            }
        }
    });
end;