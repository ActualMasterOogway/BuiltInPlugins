local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Packages._Index.LuaMeshEditingModule.LuaMeshEditingModule.Types);
local v2 = require(l_script_FirstAncestor_0.RhodiumTests.RhodiumTestHelpers);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.createSymmetryMapAsync);
return {
    cloneLizardAndSymmetryMapAsync = function() --[[ Line: 12 ]] --[[ Name: cloneLizardAndSymmetryMapAsync ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v5 = v2.cloneLizard("SymmetryMapLizard");
        for _, v7 in v5:GetDescendants() do
            if v7:IsA("WrapTarget") then
                while not pcall(function() --[[ Line: 23 ]]
                    -- upvalues: v7 (copy)
                    v7:GetVertices(Enum.CageType.Outer);
                end) do
                    task.wait();
                end;
            end;
        end;
        return v5, v4(v5, error);
    end
};