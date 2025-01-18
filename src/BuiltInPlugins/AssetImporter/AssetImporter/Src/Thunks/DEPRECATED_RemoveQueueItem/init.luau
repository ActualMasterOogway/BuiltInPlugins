local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.DEPRECATED_SetSessionQueue);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.DEPRECATED_UpdateSessionCount);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
return function(v5) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: v4 (ref), v5 (copy), v3 (ref), v2 (ref)
        assert(not v4(), "Do not call with FFlagImportQueueFixFileMiscount=true");
        local v7 = table.clone(v6:getState().Sessions.sessionQueue);
        local v8 = v7[v5];
        v7[v5] = nil;
        v6:dispatch(v3(v8, nil));
        v6:dispatch(v2(v7));
    end;
end;