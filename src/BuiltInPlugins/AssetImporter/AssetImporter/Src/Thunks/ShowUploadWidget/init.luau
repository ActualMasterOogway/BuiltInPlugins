local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetShowUploadWidget);
local v3 = require(l_Actions_0.SetUploadWidgetItem);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v5 (copy), v2 (ref)
        v6:dispatch(v3(v5));
        v6:dispatch(v2(true));
    end;
end;