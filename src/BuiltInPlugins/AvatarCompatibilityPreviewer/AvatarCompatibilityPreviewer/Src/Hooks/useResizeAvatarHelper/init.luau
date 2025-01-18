local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
return function(v6) --[[ Line: 12 ]] --[[ Name: useResizeAvatarHelper ]]
    -- upvalues: v5 (copy), v3 (copy), l_HttpService_0 (copy), l_ChangeHistoryService_0 (copy)
    local v8 = v5.useCallback(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (ref)
        local l_Attribute_0 = v6.WorldModel:GetAttribute(v3.ATTRIBUTE_ORIGINAL_SETUP_SCALE);
        if type(l_Attribute_0) == "number" then
            return l_Attribute_0;
        else
            return nil;
        end;
    end, {
        v6.WorldModel
    });
    local v13 = v5.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v3 (ref), l_HttpService_0 (ref)
        local l_Attribute_1 = v6.WorldModel:GetAttribute(v3.ATTRIBUTE_SCALE_ERROR_LIST);
        if type(l_Attribute_1) ~= "string" then
            return nil;
        else
            local v10 = nil;
            if not pcall(function() --[[ Line: 29 ]]
                -- upvalues: v10 (ref), l_HttpService_0 (ref), l_Attribute_1 (copy)
                v10 = l_HttpService_0:JSONDecode(l_Attribute_1);
            end) then
                return nil;
            elseif type(v10) ~= "table" then
                return nil;
            else
                for v11, v12 in v10 do
                    if type(v11) ~= "number" or type(v12) ~= "string" then
                        return nil;
                    end;
                end;
                if #v10 <= 0 then
                    return nil;
                else
                    return v10;
                end;
            end;
        end;
    end, {
        v6.WorldModel
    });
    local v14, v15 = v5.useState(v8);
    local v16, v17 = v5.useState(v13);
    v5.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v17 (copy), v13 (copy), v6 (copy), v3 (ref)
        v17(v13());
        local v18 = v6.WorldModel:GetAttributeChangedSignal(v3.ATTRIBUTE_ORIGINAL_SETUP_SCALE):Connect(function() --[[ Line: 61 ]]
            -- upvalues: v17 (ref), v13 (ref)
            v17(v13());
        end);
        return function() --[[ Line: 65 ]]
            -- upvalues: v18 (copy)
            v18:Disconnect();
        end;
    end, {
        v6.WorldModel, 
        v13
    });
    v5.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v15 (copy), v8 (copy), v6 (copy), v3 (ref)
        v15(v8());
        local v19 = v6.WorldModel:GetAttributeChangedSignal(v3.ATTRIBUTE_ORIGINAL_SETUP_SCALE):Connect(function() --[[ Line: 75 ]]
            -- upvalues: v15 (ref), v8 (ref)
            v15(v8());
        end);
        return function() --[[ Line: 79 ]]
            -- upvalues: v19 (copy)
            v19:Disconnect();
        end;
    end, {
        v6.WorldModel, 
        v8
    });
    local v21 = v5.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v14 (copy), l_ChangeHistoryService_0 (ref), v6 (copy)
        if v14 == nil then
            return;
        else
            local v20 = l_ChangeHistoryService_0:TryBeginRecording("AvatarAutoSetupRevertSize");
            v6.WorldModel:ScaleTo(v14);
            if v20 then
                l_ChangeHistoryService_0:FinishRecording(v20, Enum.FinishRecordingOperation.Commit);
            end;
            return;
        end;
    end, {
        v14, 
        v6.WorldModel
    });
    local v23 = v5.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v6 (copy)
        local v22 = l_ChangeHistoryService_0:TryBeginRecording("AvatarAutoSetupScaleToRequirements");
        v6.WorldModel:ScaleTo(1);
        if v22 then
            l_ChangeHistoryService_0:FinishRecording(v22, Enum.FinishRecordingOperation.Commit);
        end;
    end, {
        v6.WorldModel
    });
    return {
        revertScale = v21, 
        autoSetupScaleErrorList = v16, 
        setScaleToAvatarRequirements = v23, 
        autoSetupOriginalScale = v14, 
        autoSetupResizeProportion = if v14 then v6.WorldModelScale / v14 else nil
    };
end;