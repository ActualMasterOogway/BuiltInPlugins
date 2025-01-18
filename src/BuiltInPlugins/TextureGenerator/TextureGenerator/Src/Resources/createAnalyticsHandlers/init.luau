local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
return function(v4) --[[ Line: 11 ]] --[[ Name: createAnalyticsHandlers ]]
    -- upvalues: v3 (copy), v2 (copy), l_StudioService_0 (copy)
    local function v17(v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 12 ]] --[[ Name: sendEvent ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (copy), l_StudioService_0 (ref)
        assert(v3(), "Telemetry is not enabled");
        local v13 = {};
        for _, v15 in v6 do
            table.insert(v13, v15.MeshId);
        end;
        local v16 = v2.join({
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            userId = l_StudioService_0:GetUserId(), 
            placeId = game.PlaceId, 
            meshIds = table.concat(v13, ","), 
            prompt = v7, 
            seed = v8, 
            rotation = v9, 
            smartUVUnwrap = v10, 
            specifyFrontView = v11, 
            timestampMilliseconds = DateTime.now().UnixTimestampMillis
        }, v12);
        v4:SendEventDeferred("studio", "TextureGenerator", v5, v16);
    end;
    return {
        GeneratedPreview = function(_, v19, v20, v21, v22, v23, v24, v25) --[[ Line: 48 ]] --[[ Name: GeneratedPreview ]]
            -- upvalues: v17 (copy)
            v17("GeneratedPreview", v19, v20, v21, v22, v23, v24, {
                localId = v25
            });
        end, 
        ReceivedPreview = function(_, v27, v28, v29, v30, v31, v32, v33, v34) --[[ Line: 51 ]] --[[ Name: ReceivedPreview ]]
            -- upvalues: v17 (copy)
            v17("ReceivedPreview", v28, v29, v30, v31, v32, v33, {
                jobId = v27, 
                localId = v34
            });
        end, 
        GeneratedTexture = function(_, v36, v37, v38, v39, v40, v41, v42, v43) --[[ Line: 54 ]] --[[ Name: GeneratedTexture ]]
            -- upvalues: v17 (copy)
            v17("GeneratedTexture", v37, v38, v39, v40, v41, v42, {
                previewJobId = v36, 
                localId = v43
            });
        end, 
        ReceivedTexture = function(_, v45, v46, v47, v48, v49, v50, v51, v52, v53) --[[ Line: 57 ]] --[[ Name: ReceivedTexture ]]
            -- upvalues: v17 (copy)
            v17("ReceivedTexture", v46, v47, v48, v49, v50, v51, {
                jobId = v45, 
                colorMapId = v52, 
                localId = v53
            });
        end, 
        CancelTextureGeneration = function(_, v55, v56, v57, v58, v59, v60, v61, v62) --[[ Line: 60 ]] --[[ Name: CancelTextureGeneration ]]
            -- upvalues: v17 (copy)
            v17("CancelTextureGeneration", v56, v57, v58, v59, v60, v61, {
                jobId = v55, 
                localId = v62
            });
        end, 
        ExportGeneratedTexture = function(_, v64, v65, v66, v67, v68, v69, v70, v71, v72) --[[ Line: 63 ]] --[[ Name: ExportGeneratedTexture ]]
            -- upvalues: v17 (copy)
            v17("ExportGeneratedTexture", v65, v66, v67, v68, v69, v70, {
                jobId = v64, 
                colorMapId = v71, 
                localId = v72
            });
        end, 
        RemoveGeneratedTexture = function(_, v74, v75, v76, v77, v78, v79, v80, v81, v82) --[[ Line: 66 ]] --[[ Name: RemoveGeneratedTexture ]]
            -- upvalues: v17 (copy)
            v17("RemoveGeneratedTexture", v75, v76, v77, v78, v79, v80, {
                jobId = v74, 
                colorMapId = v81, 
                localId = v82
            });
        end, 
        SendFeedback = function(_, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94) --[[ Line: 69 ]] --[[ Name: SendFeedback ]]
            -- upvalues: v17 (copy)
            v17("SendFeedback", v85, v86, v87, v88, v89, v90, {
                acceptance = v93, 
                feedback = v94, 
                jobId = v84, 
                colorMapId = v91, 
                localId = v92
            });
        end
    };
end;