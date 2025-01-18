local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_HeightmapImporterService_0 = game:GetService("HeightmapImporterService");
local l_StudioService_0 = game:GetService("StudioService");
local l_ImageType_0 = require(l_script_FirstAncestor_0.Src.Types).ImageType;
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: getImage ]]
    -- upvalues: l_StudioService_0 (copy), l_ImageType_0 (copy), l_HeightmapImporterService_0 (copy)
    local v6 = {
        "png", 
        "jpg", 
        "jpeg"
    };
    local v7 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
        -- upvalues: v7 (ref), l_StudioService_0 (ref), v6 (copy)
        v7 = l_StudioService_0:PromptImportFile(v6);
    end);
    if not l_status_0 then
        v4(l_result_0);
        return;
    elseif not v7 then
        return;
    else
        local l_v7_TemporaryId_0 = v7:GetTemporaryId();
        local v11 = nil;
        local v12 = nil;
        local v13 = nil;
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        if v5 == l_ImageType_0.Heightmap then
            local v17, v18, v19, v20, v21, v22 = l_HeightmapImporterService_0:IsValidHeightmap(l_v7_TemporaryId_0);
            v11 = v17;
            v12 = v18;
            v13 = v19;
            v14 = v20;
            v15 = v21;
            v16 = v22;
        elseif v5 == l_ImageType_0.Colormap then
            local v23, v24, v25, v26, v27 = l_HeightmapImporterService_0:IsValidColormap(l_v7_TemporaryId_0);
            v11 = v23;
            v12 = v24;
            v13 = v25;
            v14 = v26;
            v15 = v27;
        end;
        if not v11 then
            v4(v12);
            return;
        else
            task.spawn(function() --[[ Line: 40 ]]
                -- upvalues: l_HeightmapImporterService_0 (ref), l_v7_TemporaryId_0 (copy), v7 (ref), v13 (ref), v14 (ref), v16 (ref), v15 (ref), v4 (copy)
                local v28 = nil;
                local v29 = nil;
                local _, l_result_1 = pcall(function() --[[ Line: 43 ]]
                    -- upvalues: v28 (ref), v29 (ref), l_HeightmapImporterService_0 (ref), l_v7_TemporaryId_0 (ref)
                    local l_l_HeightmapImporterService_0_HeightmapPreviewAsync_0, v31 = l_HeightmapImporterService_0:GetHeightmapPreviewAsync(l_v7_TemporaryId_0);
                    v28 = l_l_HeightmapImporterService_0_HeightmapPreviewAsync_0;
                    v29 = v31;
                end);
                local v34 = {
                    Preview = {
                        Id = v28, 
                        Error = l_result_1
                    }, 
                    File = v7, 
                    Width = v13, 
                    Height = v14, 
                    ChannelInfo = {
                        BytesPerChannel = v16, 
                        Channels = v15, 
                        DiscardedChannels = v29
                    }
                };
                v4("", v34);
            end);
            return;
        end;
    end;
end;