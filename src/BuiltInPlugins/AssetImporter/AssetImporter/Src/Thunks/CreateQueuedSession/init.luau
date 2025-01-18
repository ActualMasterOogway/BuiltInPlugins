local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.DEPRECATED_RemoveQueueItem);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.AddQueueItem);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.RemoveQueueItem);
local v5 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v6 = require(l_script_FirstAncestor_0.Src.Utility.trimFilename);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
return function(v8, v9) --[[ Line: 22 ]]
    -- upvalues: v7 (copy), v4 (copy), v1 (copy), v5 (copy), v6 (copy), v3 (copy), v2 (copy)
    return function(v10) --[[ Line: 23 ]]
        -- upvalues: v8 (copy), v7 (ref), v4 (ref), v1 (ref), v9 (copy), v5 (ref), v6 (ref), v3 (ref), v2 (ref)
        if v10:getState().Sessions.sessionQueue[v8] then
            if v7() then
                v10:dispatch(v4(v8));
            else
                v10:dispatch(v1(v8));
            end;
        end;
        local v11 = if v9 ~= nil then v9:GetImportTree() else nil;
        local v12 = v5.new({
            assetName = if v11 then v11.ImportName else v6(v8), 
            enabled = v11 ~= nil, 
            filepath = v8, 
            session = v9, 
            timestamp = DateTime.now(), 
            validSession = v11 ~= nil
        });
        if v7() then
            v10:dispatch(v3(v12));
        end;
        v10:dispatch((v2(v12)));
    end;
end;