local l_Selection_0 = game:GetService("Selection");
local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Src.Actions.SetAlignEnabled);
local v4 = require(l_Parent_0.Src.Utility.AlignToolError);
local v5 = require(l_Parent_0.Src.Utility.RelativeTo);
local function _(v6) --[[ Line: 15 ]] --[[ Name: hasEnabledAxis ]]
    return v6.X or v6.Y or v6.Z;
end;
return function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), v5 (copy), l_Selection_0 (copy), v4 (copy), v3 (copy)
    local l_Terrain_0 = l_Workspace_0.Terrain;
    local function _(v9) --[[ Line: 22 ]] --[[ Name: isAlignable ]]
        -- upvalues: l_Terrain_0 (copy)
        if v9:IsA("BasePart") and v9 ~= l_Terrain_0 then
            return true;
        elseif v9:IsA("Model") then
            return true;
        else
            return false;
        end;
    end;
    return function(v11) --[[ Line: 32 ]]
        -- upvalues: v5 (ref), l_Selection_0 (ref), l_Terrain_0 (copy), v4 (ref), v3 (ref)
        local v12 = v11:getState();
        local l_alignableObjects_0 = v12.alignableObjects;
        local l_enabledAxes_0 = v12.enabledAxes;
        local v15 = false;
        if #l_alignableObjects_0 > 1 then
            v15 = l_enabledAxes_0.X or l_enabledAxes_0.Y or l_enabledAxes_0.Z;
        end;
        local v16 = nil;
        if v15 and v12.relativeTo == v5.Active then
            local l_ActiveInstance_0 = l_Selection_0.ActiveInstance;
            if not (l_ActiveInstance_0:IsA("BasePart") and l_ActiveInstance_0 ~= l_Terrain_0 or l_ActiveInstance_0:IsA("Model") and true or false) then
                v15 = false;
                v16 = {
                    errorCode = v4.InvalidActiveObject, 
                    formatParameters = {
                        name = l_ActiveInstance_0.Name
                    }
                };
            end;
        end;
        v11:dispatch(v3(v15, v16));
    end;
end;