local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.checkForProxyWrap);
local v4 = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default");
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v6, v7) --[[ Line: 13 ]] --[[ Name: validateBodyPartCollisionFidelity ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v1 (copy)
    local v8 = if v5() then v7.allowEditableInstances else false;
    local l_v6_Descendants_0 = v6:GetDescendants();
    table.insert(l_v6_Descendants_0, 1, v6);
    local l_Default_0 = Enum.CollisionFidelity.Default;
    pcall(function() --[[ Line: 24 ]]
        -- upvalues: l_Default_0 (ref), v4 (ref)
        l_Default_0 = Enum.CollisionFidelity[v4];
    end);
    local v11 = {};
    for _, v13 in l_v6_Descendants_0 do
        if (not v8 or not v3(v13)) and v13:IsA("MeshPart") and v13.CollisionFidelity ~= l_Default_0 then
            table.insert(v11, (("Expected %*.CollisionFidelity to be %*"):format(v13:GetFullName(), l_Default_0.Name)));
        end;
    end;
    if #v11 == 0 then
        return true;
    else
        v1.reportFailure(v1.ErrorType.validateBodyPartCollisionFidelity, nil, v7);
        return false, v11;
    end;
end;