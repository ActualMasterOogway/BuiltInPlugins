local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StudioAssetService");
local v3 = v1.GetService("PublishService");
local v4 = v1.GetService("StudioService");
local v5 = v1.GetService("RunService");
local v6 = v1.GetService("Selection");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCLI88299);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagRunCommandsInCodeAssist);
return function(_) --[[ Line: 16 ]] --[[ Name: debugBulkPublishToInventory ]]
    -- upvalues: v5 (copy), v8 (copy), v4 (copy), v9 (copy), v6 (copy), v2 (copy), v3 (copy)
    if not v5:IsStudio() then
        return;
    else
        if not v8() then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
                -- upvalues: v4 (ref)
                return v4:HasInternalPermission();
            end);
            if not (l_status_0 and l_result_0) then
                return;
            end;
        end;
        if not v9() then
            return;
        else
            for _, v14 in v6:Get() do
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 36 ]]
                    -- upvalues: v2 (ref), v14 (copy)
                    return v2:SerializeInstances({
                        v14
                    });
                end);
                if l_status_1 and l_result_1 then
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 40 ]]
                        -- upvalues: v14 (copy), v4 (ref), v3 (ref), l_result_1 (copy)
                        local v17 = {
                            AdditionalParameters = {
                                PublishAsPackage = false
                            }, 
                            AssetType = Enum.AssetType.Model.Name, 
                            AssetName = v14.Name, 
                            AssetId = 0, 
                            ContentType = "model/x-rbxm", 
                            CreatorId = v4:GetUserId(), 
                            CreatorType = Enum.AssetCreatorType.User, 
                            Description = "", 
                            Token = ""
                        };
                        return v3:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsyncWithAddParam(l_result_1, v17);
                    end);
                    if not l_status_2 then
                        warn(l_result_2);
                    end;
                else
                    warn(l_status_1, l_result_1);
                end;
            end;
            return;
        end;
    end;
end;