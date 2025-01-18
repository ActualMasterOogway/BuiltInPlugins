local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Components.WireframeHandleAdornment);
local function v19(v4, v5) --[[ Line: 28 ]] --[[ Name: renderRuler ]]
    local l_Size_0 = v5.Size;
    local l_X_0 = l_Size_0.X;
    local l_Z_0 = l_Size_0.Z;
    v4.Color3 = v5.Color3;
    v4:AddLine(Vector3.new(l_X_0, 0, 0), (Vector3.new(l_X_0, 0, l_Z_0)));
    v4:AddLine(Vector3.new(0, 0, l_Z_0), (Vector3.new(l_X_0, 0, l_Z_0)));
    if v5.ExtraSize then
        v4:AddLine(Vector3.new(l_X_0, 0, l_Z_0), (Vector3.new(l_X_0, 0, l_Z_0 + v5.ExtraSize.Z)));
        v4:AddLine(Vector3.new(l_X_0, 0, l_Z_0), (Vector3.new(l_X_0 + v5.ExtraSize.X, 0, l_Z_0)));
    end;
    local l_GridSize_0 = v5.GridSize;
    local v10 = v5.MajorStep or 5;
    if l_GridSize_0 then
        local v11 = 0.15 * l_GridSize_0;
        local v12 = 0.65 * l_GridSize_0;
        local v13 = math.floor(l_X_0 / l_GridSize_0 + 0.001) + 1;
        if v13 < 48 then
            for v14 = 1, v13 do
                local v15 = nil;
                v15 = if (v14 - 1) % v10 == 0 then v12 else v11;
                v4:AddLine(Vector3.new((v14 - 1) * l_GridSize_0, 0, l_Z_0 - v15), (Vector3.new((v14 - 1) * l_GridSize_0, 0, l_Z_0 + v15)));
            end;
        else
            v4:AddLine(Vector3.new(0, 0, 0, 0), (Vector3.new(l_X_0, 0, 0)));
        end;
        local v16 = math.floor(l_Z_0 / l_GridSize_0 + 0.001) + 1;
        if v16 < 48 then
            for v17 = 1, v16 do
                local v18 = nil;
                v18 = if (v17 - 1) % v10 == 0 then v12 else v11;
                v4:AddLine(Vector3.new(l_X_0 - v18, 0, (v17 - 1) * l_GridSize_0), (Vector3.new(l_X_0 + v18, 0, (v17 - 1) * l_GridSize_0)));
            end;
            return;
        else
            v4:AddLine(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, l_Z_0)));
            return;
        end;
    else
        v4:AddLine(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, l_Z_0)));
        v4:AddLine(Vector3.new(0, 0, 0, 0), (Vector3.new(l_X_0, 0, 0)));
        return;
    end;
end;
local v20 = v2.PureComponent:extend("RulerView");
v20.render = function(v21) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v19 (copy)
    local l_props_0 = v21.props;
    return v2.createFragment({
        OnTop = v2.createElement(v3, {
            CFrame = l_props_0.CFrame, 
            Color3 = l_props_0.Color3, 
            AlwaysOnTop = true, 
            Transparency = l_props_0.DimTransparency, 
            Render = function(v23) --[[ Line: 99 ]] --[[ Name: Render ]]
                -- upvalues: v19 (ref), l_props_0 (copy)
                v19(v23, l_props_0);
            end
        }), 
        Underneath = v2.createElement(v3, {
            CFrame = l_props_0.CFrame, 
            Color3 = l_props_0.Color3, 
            AlwaysOnTop = false, 
            Transparency = l_props_0.MainTransparency, 
            Render = function(v24) --[[ Line: 108 ]] --[[ Name: Render ]]
                -- upvalues: v19 (ref), l_props_0 (copy)
                v19(v24, l_props_0);
            end
        })
    });
end;
return v20;