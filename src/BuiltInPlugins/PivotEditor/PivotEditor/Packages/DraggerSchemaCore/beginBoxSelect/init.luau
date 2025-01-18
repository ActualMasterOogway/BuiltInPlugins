local l_Workspace_0 = game:GetService("Workspace");
local v1 = require(script.Parent.getSelectableWithCache);
local v2 = require(script.Parent.shouldSelectSubPart);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_Workspace_0 (copy), v1 (copy)
    local v4 = {};
    local v5 = v3:areConstraintDetailsShown();
    local v6 = v2(v3);
    local v7 = {};
    local v8 = {};
    local l_l_Workspace_0_Descendants_0 = l_Workspace_0:GetDescendants();
    for _, v11 in ipairs(l_l_Workspace_0_Descendants_0) do
        if v11:IsA("BasePart") then
            if not v11.Locked then
                local v12 = v1(v11, v6, v7);
                if v12 and not v8[v12] then
                    local v13 = nil;
                    v13 = if v12:IsA("Tool") then v11.Position else if v12:IsA("Model") then v12:GetBoundingBox().Position else v12.ExtentsCFrame.Position;
                    v8[v12] = true;
                    table.insert(v4, {
                        Center = v13, 
                        Selectable = v12
                    });
                end;
            end;
        elseif v11:IsA("Attachment") and (v11.Visible or v5) then
            table.insert(v4, {
                Center = v11.WorldPosition, 
                Selectable = v11
            });
        end;
    end;
    return v4;
end;