local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Asset.Util.handleInvokeOnInsertItems);
local v2 = require(l_script_FirstAncestor_0.Src.Asset.Util.handleInvokeOnOpenBulkImport);
return function(v3) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v3:SetItem("GameId", game.GameId);
    v3:OnInvoke("OnInsertItems", v1);
    v3:OnInvoke("OnOpenBulkImport", v2);
end;