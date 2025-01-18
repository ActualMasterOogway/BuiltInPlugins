local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.WireframeHandleAdornment);
local v4 = v2.PureComponent:extend("Grid3D");
v4.defaultProps = {
    Dim = 0.85
};
v4.render = function(v5) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_props_0 = v5.props;
    local v7 = {};
    local l_Position_0 = l_props_0.Position;
    local l_UnitA_0 = l_props_0.UnitA;
    local l_UnitB_0 = l_props_0.UnitB;
    local l_MinA_0 = l_props_0.MinA;
    local l_MaxA_0 = l_props_0.MaxA;
    local l_MinB_0 = l_props_0.MinB;
    local l_MaxB_0 = l_props_0.MaxB;
    local l_Radius_0 = l_props_0.Radius;
    if l_Radius_0 then
        for v16 = math.ceil(l_MinA_0 - 0.001), math.floor(l_MaxA_0 + 0.001) do
            local v17 = math.sqrt(l_Radius_0 * l_Radius_0 - v16 * v16);
            if v16 ~= l_props_0.ExcludeA then
                local v18 = l_Position_0 + l_UnitA_0 * v16;
                local v19 = math.max(l_MinB_0, -v17);
                local v20 = math.min(l_MaxB_0, v17);
                if v19 < v20 then
                    table.insert(v7, v18 + l_UnitB_0 * v19);
                    table.insert(v7, v18 + l_UnitB_0 * v20);
                end;
            end;
        end;
        for v21 = math.ceil(l_MinB_0 - 0.001), math.floor(l_MaxB_0 + 0.001) do
            local v22 = math.sqrt(l_Radius_0 * l_Radius_0 - v21 * v21);
            if v21 ~= l_props_0.ExcludeB then
                local v23 = l_Position_0 + l_UnitB_0 * v21;
                local v24 = math.max(l_MinA_0, -v22);
                local v25 = math.min(l_MaxA_0, v22);
                if v24 < v25 then
                    table.insert(v7, v23 + l_UnitA_0 * v24);
                    table.insert(v7, v23 + l_UnitA_0 * v25);
                end;
            end;
        end;
    else
        local v26 = math.ceil(l_MinA_0 - 0.001);
        local v27 = math.floor(l_MaxA_0 + 0.001);
        local v28 = math.ceil(l_MinB_0 - 0.001);
        local v29 = math.floor(l_MaxB_0 + 0.001);
        local v30 = 1;
        if v27 - v26 > 1024 or v29 - v28 > 1024 then
            v30 = 2 ^ math.floor((math.log(math.max(v27 - v26, v29 - v28) / 1024, 2)));
        end;
        for v31 = v26, v27, v30 do
            if v31 ~= l_props_0.ExcludeA then
                local v32 = l_Position_0 + l_UnitA_0 * v31;
                table.insert(v7, v32 + l_UnitB_0 * l_MinB_0);
                table.insert(v7, v32 + l_UnitB_0 * l_MaxB_0);
            end;
        end;
        for v33 = v28, v29, v30 do
            if v33 ~= l_props_0.ExcludeB then
                local v34 = l_Position_0 + l_UnitB_0 * v33;
                table.insert(v7, v34 + l_UnitA_0 * l_MinA_0);
                table.insert(v7, v34 + l_UnitA_0 * l_MaxA_0);
            end;
        end;
    end;
    local function v36(v35) --[[ Line: 110 ]] --[[ Name: render ]]
        -- upvalues: v7 (copy)
        v35:AddLines(v7);
    end;
    return v2.createFragment({
        OnTop = v2.createElement(v3, {
            Color3 = l_props_0.Color3, 
            AlwaysOnTop = true, 
            Transparency = l_props_0.Dim, 
            Render = v36
        }), 
        NotOnTop = v2.createElement(v3, {
            Color3 = l_props_0.Color3, 
            AlwaysOnTop = false, 
            Transparency = 0.4, 
            Render = v36
        })
    });
end;
return v4;