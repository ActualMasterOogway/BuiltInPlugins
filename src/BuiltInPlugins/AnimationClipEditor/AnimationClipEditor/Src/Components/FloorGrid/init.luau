local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v6 = require(l_Util_0.Constants);
local _ = require(l_Util_0.RigUtils);
local v8 = require(l_Util_0.RigInfo);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridSpeed);
local v10 = v2.PureComponent:extend("FloorGrid");
v10.renderLine = function(_, v12, v13, v14, v15) --[[ Line: 34 ]] --[[ Name: renderLine ]]
    -- upvalues: v2 (copy)
    return v2.createElement("LineHandleAdornment", {
        Thickness = 2, 
        Color = v12.lineColor, 
        Adornee = v13, 
        Length = v15, 
        CFrame = v14
    });
end;
v10.renderLines = function(v16, v17, v18, v19) --[[ Line: 44 ]] --[[ Name: renderLines ]]
    -- upvalues: v6 (copy), v9 (copy)
    local l_props_0 = v16.props;
    local l_v18_ExtentsSize_0 = v18:GetExtentsSize();
    local v22 = math.max(l_v18_ExtentsSize_0.X, l_v18_ExtentsSize_0.Z) + 3;
    local v23 = v22 / 10;
    local v24 = Vector3.new(0, -(l_v18_ExtentsSize_0.Y * 0.5 + (v19.Position.Y - v18:GetModelCFrame().p.Y)), 0);
    local v25 = l_props_0.Speed * l_props_0.Playhead / v6.TICK_FREQUENCY;
    local v26 = {};
    for v27 = -5, 5 do
        local v28 = if v9() then v22 / 2 + v25 % v23 else v22 / 2;
        table.insert(v26, v16:renderLine(v17, v19, CFrame.new(v24 + Vector3.new(v27 * v23, 0, v28)), v22));
    end;
    for v29 = -5, 5 do
        local v30 = if v9() then v29 * v23 + v25 % v23 else v29 * v23;
        table.insert(v26, v16:renderLine(v17, v19, CFrame.new(v24 + Vector3.new(v22 / 2, 0, v30)) * CFrame.Angles(0, 1.5707963267948966, 0), v22));
    end;
    return v26;
end;
v10.render = function(v31) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: l_CoreGui_0 (copy), v8 (copy), v2 (copy)
    local l_props_1 = v31.props;
    local l_gridTheme_0 = l_props_1.Stylizer.gridTheme;
    local v34 = l_props_1.Container or l_CoreGui_0;
    local l_RootInstance_0 = l_props_1.RootInstance;
    local v36 = l_RootInstance_0 and v8.findRootPart(l_RootInstance_0);
    if v36 then
        local v37 = v31:renderLines(l_gridTheme_0, l_RootInstance_0, v36);
        return v2.createElement(v2.Portal, {
            target = v34
        }, {
            GridLines = v2.createElement("Folder", {}, v37)
        });
    else
        return;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));