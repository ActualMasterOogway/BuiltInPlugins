local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.GetErrorChecked);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.GetCheckedCount);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetCheckedCount);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetTreeChecked);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetErrorNodeChecked);
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v5 (copy), v3 (copy)
    return function(v7) --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (ref), v1 (ref), v5 (ref), v3 (ref)
        v7:dispatch(v4(v6));
        local l_importTree_0 = v7:getState().Preview.importTree;
        local v9 = v2(l_importTree_0);
        local v10 = v1(l_importTree_0);
        v7:dispatch(v5(v10));
        v7:dispatch(v3(v9));
    end;
end;