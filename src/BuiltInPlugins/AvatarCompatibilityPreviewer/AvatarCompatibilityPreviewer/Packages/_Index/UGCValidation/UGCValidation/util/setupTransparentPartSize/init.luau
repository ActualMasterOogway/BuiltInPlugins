local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.AssetTraversalUtils);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationRemoveRotationCheck);
return function(v5, v6, v7) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v8 = {};
    if Enum.AssetType.DynamicHead == v7 then
        v2.calculateBounds(v7, v6, CFrame.new(), v8);
        if v4() then
            v5.CFrame = CFrame.new();
            v6.CFrame = CFrame.new();
        else
            v5.Position = v6.Position;
        end;
        v5.Size = v6.Size;
    else
        local v9 = v2.assetHierarchy[v7];
        v2.traverseHierarchy(nil, v6, v7, nil, CFrame.new(), v9.root, v9, v8);
        local function v10(v11, v12, v13, v14, v15) --[[ Line: 36 ]] --[[ Name: moveParts ]]
            -- upvalues: v3 (ref), v7 (copy), v10 (copy)
            local l_v11_FirstChild_0 = v11:FindFirstChild(v14);
            local l_v13_0 = v13;
            if v12 then
                local l_v11_FirstChild_1 = v11:FindFirstChild(v12);
                local v19 = v3.getRigAttachmentToParent(v7, v14);
                local l_l_v11_FirstChild_1_FirstChild_0 = l_v11_FirstChild_1:FindFirstChild(v19);
                local l_l_v11_FirstChild_0_FirstChild_0 = l_v11_FirstChild_0:FindFirstChild(v19);
                l_v13_0 = l_v13_0 * l_l_v11_FirstChild_1_FirstChild_0.CFrame * l_l_v11_FirstChild_0_FirstChild_0.CFrame:Inverse();
            end;
            l_v11_FirstChild_0.CFrame = l_v13_0;
            if v15.children then
                for v22, v23 in v15.children do
                    v10(v11, v14, l_v13_0, v22, v23);
                end;
            end;
        end;
        v10(v6, nil, CFrame.new(), v9.root, v9);
        local v24 = Vector3.new();
        local v25 = Vector3.new();
        v24 = if v8.maxOverall then v8.maxOverall else Vector3.new();
        v25 = if v8.minOverall then v8.minOverall else Vector3.new();
        if v8.minOverall == nil or v8.maxOverall == nil then
            return false;
        else
            v5.Size = Vector3.new(v24.X - v25.X, v24.Y - v25.Y, v24.Z - v25.Z);
            v5.Position = Vector3.new(v25.X + v5.Size.X / 2, v25.Y + v5.Size.Y / 2, v25.Z + v5.Size.Z / 2);
        end;
    end;
    return true;
end;