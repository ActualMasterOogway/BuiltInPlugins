local l_AssetImportService_0 = game:GetService("AssetImportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.UpdateQueueItem);
local v4 = require(l_Actions_0.RemoveQueueItem);
local v5 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v7 = require(l_Thunks_0.CreateQueuedSession);
local v8 = require(l_Thunks_0.DEPRECATED_RemoveQueueItem);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
local function _(v10, v11) --[[ Line: 21 ]] --[[ Name: getQueueItem ]]
    return v10:getState().Sessions.sessionQueue[v11];
end;
return function(v13, v14) --[[ Line: 26 ]]
    -- upvalues: l_AssetImportService_0 (copy), v9 (copy), v4 (copy), v8 (copy), v7 (copy), v5 (copy), v3 (copy)
    return function(v15) --[[ Line: 27 ]]
        -- upvalues: l_AssetImportService_0 (ref), v13 (copy), v9 (ref), v4 (ref), v8 (ref), v7 (ref), v5 (ref), v3 (ref), v14 (copy)
        local v16 = l_AssetImportService_0:PickMultipleFilesWithPrompt()[1];
        if v16 == nil or v16 == "" then
            return;
        else
            local l_v13_0 = v13;
            local v18 = v15:getState().Sessions.sessionQueue[l_v13_0];
            if not v18 then
                pcall(function() --[[ Line: 39 ]]
                    -- upvalues: v13 (ref), v16 (copy)
                    error((("Unable to swap %* with %*"):format(v13, v16)));
                end);
            end;
            l_v13_0 = v15:getState().Sessions.sessionQueue;
            if v9() then
                v15:dispatch(v4(v13));
            else
                v15:dispatch(v8(v13));
                if l_v13_0[v16] then
                    v15:dispatch(v8(v16));
                end;
            end;
            local v19 = l_AssetImportService_0:StartSessionWithPath(v16);
            v15:dispatch(v7(v16, v19));
            local v20 = v5.update(v15:getState().Sessions.sessionQueue[v16], {
                timestamp = v18.timestamp
            });
            v15:dispatch(v3(v20));
            v14(v16, v18);
            return;
        end;
    end;
end;