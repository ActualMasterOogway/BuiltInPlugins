local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v3 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v4 = v1.Component:extend("Path2DWrapper");
v4.init = function(v5) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy)
    v5.pathContainerRef = v1.createRef();
    v5.setControlPoints = function() --[[ Line: 23 ]]
        -- upvalues: v3 (ref), v5 (copy)
        local v6 = v3.getFIntPath2DMaxControlPointLimit() - 1;
        local v7 = v5.pathContainerRef:getValue();
        if not v7 then
            return;
        else
            local v8 = 1;
            for _, v10 in v7:GetChildren() do
                local v11 = {};
                local v12 = #v5.props.ControlPoints;
                for v13 = v8, v8 + v6 - 1 do
                    if v12 >= v13 then
                        table.insert(v11, v5.props.ControlPoints[v13]);
                    else
                        break;
                    end;
                end;
                v10:SetControlPoints(v11);
                v8 = v8 + (v6 - 1);
            end;
            return;
        end;
    end;
end;
v4.render = function(v14) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), l_Pane_0 (copy)
    local v15 = v3.getFIntPath2DMaxControlPointLimit() - 1;
    local v16 = "";
    if v14.props.Tag then
        v16 = v14.props.Tag;
    end;
    local v17 = {};
    for _ = 2, #v14.props.ControlPoints, v15 - 1 do
        table.insert(v17, v1.createElement("Path2D", {
            [v1.Tag] = v16
        }));
    end;
    return v1.createElement(l_Pane_0, {
        ref = v14.pathContainerRef, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = v14.props.ZIndex
    }, v17);
end;
v4.didMount = function(v19) --[[ Line: 79 ]] --[[ Name: didMount ]]
    v19.setControlPoints();
end;
v4.didUpdate = function(v20) --[[ Line: 83 ]] --[[ Name: didUpdate ]]
    v20.setControlPoints();
end;
return v4;