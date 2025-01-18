local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChangeHistoryService");
local v3 = v1.GetService("StreamingService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local v5 = {
    assetCacheMap = {}, 
    g2g = {}, 
    guid2instance = {}, 
    guidToInfo = {}, 
    chatBulletMap = {}, 
    altDataMap = {}, 
    requestRegionAdornments = {}, 
    requestMetadata = {}, 
    activeDraftGuids = nil, 
    draftModeModels = {}, 
    cachedAssetAttributionInfo = {}, 
    recordingActionNumber = 1, 
    requestToRecordName = {}
};
local v6 = {};
local v7 = {};
v5.get = function(v8, v9) --[[ Line: 36 ]] --[[ Name: get ]]
    -- upvalues: v3 (copy), v6 (copy)
    if not v8 or #v8 == 0 then
        return;
    else
        local v10 = nil;
        if v9 then
            v10 = v3:GetInstance(v9, v8);
        end;
        return v10 or v6[v8];
    end;
end;
v5.set = function(v11, v12) --[[ Line: 46 ]] --[[ Name: set ]]
    -- upvalues: v6 (copy)
    v6[v11] = v12;
end;
local v13 = nil;
local v14 = nil;
v5.StartRecordingActions = function(v15, v16) --[[ Line: 52 ]] --[[ Name: StartRecordingActions ]]
    -- upvalues: v14 (ref), v2 (copy), v5 (copy)
    if v14 then
        if not v2:IsRecordingInProgress(v14) then
            warn("StartRecordingActions failed: currentRecording is set but not running");
        end;
        return false;
    else
        local v17 = v16 or v5.requestToRecordName[v15];
        if not v17 then
            v17 = ("%* %*"):format("Assistant Actions", v5.recordingActionNumber);
            local l_v5_0 = v5;
            l_v5_0.recordingActionNumber = l_v5_0.recordingActionNumber + 1;
            v5.requestToRecordName[v15] = v17;
        end;
        local v19 = v2:TryBeginRecording(v17);
        if not v19 then
            warn("StartRecordingActions failed: TryBeginRecording returned nil");
            return false;
        else
            v14 = v19;
            return true, v19;
        end;
    end;
end;
v5.EndRecordingActions = function(v20, v21) --[[ Line: 76 ]] --[[ Name: EndRecordingActions ]]
    -- upvalues: v14 (ref), v2 (copy), v5 (copy), v13 (ref), v4 (copy)
    if not v14 then
        return false;
    else
        assert(v14, "Luau");
        local _, v23 = v2:GetCanUndo();
        local l_Append_0 = Enum.FinishRecordingOperation.Append;
        local v25 = v21 or v5.requestToRecordName[v20];
        if not v25 then
            return false;
        else
            if v13 ~= v20 or v23 ~= v25 then
                l_Append_0 = Enum.FinishRecordingOperation.Commit;
            end;
            v2:FinishRecording(v14, l_Append_0);
            if not v21 then
                v4:RecordingActionEnded(v20, v25);
            end;
            v13 = v20;
            v14 = nil;
            return true;
        end;
    end;
end;
local function _(v26) --[[ Line: 101 ]] --[[ Name: AddMetadata ]]
    -- upvalues: v5 (copy)
    local v27 = v5.requestMetadata[v26];
    if v27 then
        return v27;
    else
        v27 = {
            RequestId = v26, 
            Time_Start = os.clock()
        };
        v5.requestMetadata[v26] = v27;
        return v27;
    end;
end;
v5.GetRequestFolder = function(v29) --[[ Line: 115 ]] --[[ Name: GetRequestFolder ]]
    -- upvalues: v7 (copy), v5 (copy)
    if not v29 or #v29 == 0 then
        return;
    else
        local v30 = v7[v29];
        if not v30 then
            v30 = Instance.new("Folder");
            v30.Parent = workspace;
            v7[v29] = v30;
            local function _(v31, v32) --[[ Line: 126 ]] --[[ Name: onChanged ]]
                -- upvalues: v30 (ref)
                if typeof(v32) == "Instance" then
                    return;
                else
                    v30:SetAttribute(v31, v32);
                    if v31 == "Query" then
                        v30.Name = "PROMPT: " .. v32:gsub("^(" .. ("."):rep(30) .. ".-)( .*)$", "%1...");
                    end;
                    return;
                end;
            end;
            local v34 = v5.requestMetadata[v29];
            local v35;
            if v34 then
                v35 = v34;
            else
                v34 = {
                    RequestId = v29, 
                    Time_Start = os.clock()
                };
                v5.requestMetadata[v29] = v34;
                v35 = v34;
            end;
            for v36, v37 in v35 do
                if typeof(v37) ~= "Instance" then
                    v30:SetAttribute(v36, v37);
                    if v36 == "Query" then
                        v30.Name = "PROMPT: " .. v37:gsub("^(" .. ("."):rep(30) .. ".-)( .*)$", "%1...");
                    end;
                end;
            end;
            setmetatable(v35, {
                __newindex = function(_, v39, v40) --[[ Line: 141 ]] --[[ Name: __newindex ]]
                    -- upvalues: v30 (ref)
                    if typeof(v40) == "Instance" then
                        return;
                    else
                        v30:SetAttribute(v39, v40);
                        if v39 == "Query" then
                            v30.Name = "PROMPT: " .. v40:gsub("^(" .. ("."):rep(30) .. ".-)( .*)$", "%1...");
                        end;
                        return;
                    end;
                end
            });
        end;
        return v30;
    end;
end;
v5.GetRequestMetadata = function(v41, v42) --[[ Line: 150 ]] --[[ Name: GetRequestMetadata ]]
    -- upvalues: v5 (copy)
    local v43 = v5.requestMetadata[v41];
    local v44;
    if v43 then
        v44 = v43;
    else
        v43 = {
            RequestId = v41, 
            Time_Start = os.clock()
        };
        v5.requestMetadata[v41] = v43;
        v44 = v43;
    end;
    return v44[v42];
end;
v5.SetRequestMetadata = function(v45, v46, v47) --[[ Line: 155 ]] --[[ Name: SetRequestMetadata ]]
    -- upvalues: v5 (copy)
    local v48 = v5.requestMetadata[v45];
    local v49;
    if v48 then
        v49 = v48;
    else
        v48 = {
            RequestId = v45, 
            Time_Start = os.clock()
        };
        v5.requestMetadata[v45] = v48;
        v49 = v48;
    end;
    v49[v46] = v47;
end;
v5.clear = function() --[[ Line: 160 ]] --[[ Name: clear ]]
    -- upvalues: v5 (copy)
    for _, v51 in v5 do
        if typeof(v51) == "table" then
            v51 = {};
        end;
    end;
end;
v5.destroy = function() --[[ Line: 168 ]] --[[ Name: destroy ]]

end;
return v5;