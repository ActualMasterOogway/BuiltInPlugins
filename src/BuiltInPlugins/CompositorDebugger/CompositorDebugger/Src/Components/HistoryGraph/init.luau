local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_joinTags_0 = v2.Styling.joinTags;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v13 = require(l_Components_0.Line);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v15 = require(l_Util_0.Constants);
local v16 = require(l_Util_0.findInterval);
local v17 = v1.PureComponent:extend("HistoryGraph");
local function v24(v18) --[[ Line: 40 ]] --[[ Name: concatenatePath ]]
    local v19 = "";
    local l_ipairs_0 = ipairs;
    local v21 = v18 or {};
    for v22, v23 in l_ipairs_0(v21) do
        if type(v23) == "number" then
            v19 = v19 .. "[" .. tostring(v23) .. "]";
        else
            if v22 > 1 then
                v19 = v19 .. ".";
            end;
            v19 = v19 .. tostring(v23);
        end;
    end;
    return v19;
end;
v17.init = function(v25) --[[ Line: 57 ]] --[[ Name: init ]]
    v25.state = {
        min = 1e999, 
        max = -1e999, 
        size = nil, 
        frameBufferSize = 0, 
        timespan = 0
    };
    v25.onCanvasAbsoluteSizeChanged = function(v26) --[[ Line: 66 ]]
        -- upvalues: v25 (copy)
        local l_AbsoluteSize_0 = v26.AbsoluteSize;
        if not v25.state.size or l_AbsoluteSize_0 ~= v25.state.size then
            v25:setState({
                size = l_AbsoluteSize_0
            });
        end;
    end;
end;
local _ = function(v28, v29) --[[ Line: 74 ]] --[[ Name: getValue ]]
    local l_v28_0 = v28;
    for _, v32 in v29 do
        if l_v28_0 then
            l_v28_0 = l_v28_0[v32];
        else
            l_v28_0 = nil;
        end;
    end;
    return l_v28_0;
end;
v17.getFrameInfo = function(v34, v35) --[[ Line: 82 ]] --[[ Name: getFrameInfo ]]
    local l_props_0 = v34.props;
    local l_HistoryField_0 = l_props_0.HistoryField;
    local v38 = l_props_0.FrameBuffer and l_props_0.FrameBuffer[v35];
    local v39 = v38 and v38.layerMap and v38.layerMap[l_HistoryField_0.id];
    local v40 = v39 and v39[l_HistoryField_0.section];
    local l_v40_0 = v40;
    if l_v40_0 then
        local l_field_0 = l_HistoryField_0.field;
        local l_v40_1 = v40;
        for _, v45 in l_field_0 do
            if l_v40_1 then
                l_v40_1 = l_v40_1[v45];
            else
                l_v40_1 = nil;
            end;
        end;
        l_v40_0 = l_v40_1;
    end;
    if not l_v40_0 then
        return nil, {}, 0, nil;
    else
        local v46 = typeof(l_v40_0);
        local v47 = {};
        local v48 = {};
        if v46 == "number" then
            v47 = {
                l_v40_0
            };
        elseif v46 == "Vector2" then
            v47 = {
                l_v40_0.X, 
                l_v40_0.Y
            };
            v48 = {
                "X", 
                "Y"
            };
        elseif v46 == "Vector3" then
            v47 = {
                l_v40_0.X, 
                l_v40_0.Y, 
                l_v40_0.Z
            };
            v48 = {
                "X", 
                "Y", 
                "Z"
            };
        end;
        return v47, v48, v38.timestamp;
    end;
end;
v17.calculateExtents = function(v49, v50) --[[ Line: 109 ]] --[[ Name: calculateExtents ]]
    local l_state_0 = v49.state;
    local v52 = nil;
    local v53 = nil;
    if v50 then
        v52 = 1e999;
        v53 = -1e999;
    else
        v52 = l_state_0.min;
        v53 = l_state_0.max;
    end;
    for v54 = 1, l_state_0.frameBufferSize do
        local v55 = v49:getFrameInfo(v54);
        if v55 ~= nil then
            for _, v57 in v55 do
                v52 = math.min(v52, v57);
                v53 = math.max(v53, v57);
            end;
        end;
    end;
    if v52 == v53 then
        v52 = v52 - 0.5;
        v53 = v53 + 0.5;
    end;
    if v52 ~= l_state_0.min or v53 ~= l_state_0.max then
        v49:setState({
            min = v52, 
            max = v53
        });
    end;
end;
v17.didMount = function(v58) --[[ Line: 144 ]] --[[ Name: didMount ]]
    v58:calculateExtents(true);
end;
v17.didUpdate = function(v59, v60, _) --[[ Line: 148 ]] --[[ Name: didUpdate ]]
    if v59.props.HistoryField ~= v60.HistoryField then
        v59:calculateExtents(true);
        return;
    else
        if v59.props.FrameBuffer ~= v60.FrameBuffer then
            v59:calculateExtents(false);
        end;
        return;
    end;
end;
v17.getDerivedStateFromProps = function(v62, v63) --[[ Line: 156 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v15 (copy)
    local v64 = v62.FrameBuffer:getSize();
    if v64 ~= v63.frameBufferSize then
        return {
            frameBufferSize = v64, 
            timespan = v64 / v15.FRAMERATE
        };
    else
        return;
    end;
end;
v17.getLastTimestamp = function(v65) --[[ Line: 166 ]] --[[ Name: getLastTimestamp ]]
    local l_FrameBuffer_0 = v65.props.FrameBuffer;
    return l_FrameBuffer_0 and l_FrameBuffer_0.last and l_FrameBuffer_0.last.timestamp or 0;
end;
local function _(v67, v68) --[[ Line: 174 ]] --[[ Name: round ]]
    if v67 == 0 then
        return 0;
    else
        local v69 = 10 ^ (-math.floor((math.log10((math.abs(v67))))) + v68 - 1);
        return math.floor(v67 * v69 + 0.5) / v69;
    end;
end;
v17.getRulers = function(v71) --[[ Line: 183 ]] --[[ Name: getRulers ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v16 (copy), l_joinTags_0 (copy), l_TextLabel_0 (copy)
    local l_state_1 = v71.state;
    local l_timespan_0 = l_state_1.timespan;
    local v74 = {};
    local v75 = {};
    for v76 = 1, l_timespan_0 - 1 do
        local v77 = v76 / l_timespan_0;
        v74["time" .. tostring(v76)] = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, 1, 1, 0), 
            Position = UDim2.fromScale(v77, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            ZIndex = 2, 
            [v1.Tag] = "Ruler"
        });
    end;
    if l_state_1.min ~= 1e999 then
        local v78 = l_state_1.max - l_state_1.min;
        local v79 = l_state_1.min - 0.05 * v78;
        local v80 = l_state_1.max + 0.05 * v78;
        local v81 = v16(v78);
        local v82 = math.floor(v79 / v81) * v81;
        local v83 = math.ceil(v80 / v81) * v81;
        local v84 = 1;
        for v85 = v82, v83, v81 do
            local v86 = 0.95 - 0.9 * (v85 - l_state_1.min) / v78;
            if v86 >= 0 and v86 <= 1 then
                v74["ruler" .. tostring(v84)] = v1.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.fromScale(0, v86), 
                    ZIndex = 2, 
                    [v1.Tag] = l_joinTags_0("Ruler", v85 == 0 and "Axis" or nil)
                });
                local v87 = "label" .. tostring(v84);
                local l_createElement_0 = v1.createElement;
                local l_l_TextLabel_0_0 = l_TextLabel_0;
                local v90 = {
                    AnchorPoint = Vector2.new(0, 0.5)
                };
                local v91;
                if v85 == 0 then
                    v91 = 0;
                else
                    local v92 = 10 ^ (-math.floor((math.log10((math.abs(v85))))) + 3 - 1);
                    v91 = math.floor(v85 * v92 + 0.5) / v92;
                end;
                v90.Text = tostring(v91);
                v90.TextXAlignment = Enum.TextXAlignment.Left;
                v90.TextYAlignment = Enum.TextYAlignment.Center;
                v90.Position = UDim2.new(0, 3, v86, 0);
                v90.Size = UDim2.fromScale(1, 1);
                v90.ZIndex = 2;
                v75[v87] = l_createElement_0(l_l_TextLabel_0_0, v90);
                v84 = v84 + 1;
            end;
        end;
    end;
    return v74, v75;
end;
v17.makePos = function(v93, v94, v95) --[[ Line: 240 ]] --[[ Name: makePos ]]
    local l_state_2 = v93.state;
    local l_min_0 = l_state_2.min;
    local l_max_0 = l_state_2.max;
    local l_size_0 = l_state_2.size;
    return Vector2.new(l_size_0.X * (v94 / l_state_2.frameBufferSize), l_size_0.Y * (0.95 - 0.9 * (v95 - l_min_0) / (l_max_0 - l_min_0)));
end;
v17.getHistoryGraph = function(v100) --[[ Line: 250 ]] --[[ Name: getHistoryGraph ]]
    -- upvalues: v1 (copy), v13 (copy)
    local l_state_3 = v100.state;
    local v102 = {};
    local l_min_1 = l_state_3.min;
    local l_max_1 = l_state_3.max;
    local l_size_1 = l_state_3.size;
    if l_size_1 and l_min_1 ~= 1e999 then
        local l_timespan_1 = l_state_3.timespan;
        local v107 = v100:getLastTimestamp();
        local v108 = {};
        local v109 = 0;
        local v110 = v107 - l_timespan_1;
        local function _(v111, v112) --[[ Line: 265 ]] --[[ Name: makeVector2 ]]
            -- upvalues: l_size_1 (copy), v107 (copy), l_timespan_1 (copy), l_min_1 (copy), l_max_1 (copy)
            return Vector2.new(l_size_1.X * (1 + (v111 - v107) / l_timespan_1), l_size_1.Y * (0.95 - 0.9 * (v112 - l_min_1) / (l_max_1 - l_min_1)));
        end;
        for v114 = 1, l_state_3.frameBufferSize do
            local v115, _, v117 = v100:getFrameInfo(v114);
            if v117 and v110 < v117 and v115 and v108 then
                for v118, v119 in v115 do
                    local v120 = v108[v118];
                    if v120 then
                        local v121 = Vector2.new(l_size_1.X * (1 + (v117 - v107) / l_timespan_1), l_size_1.Y * (0.95 - 0.9 * (v119 - l_min_1) / (l_max_1 - l_min_1)));
                        local v122 = Vector2.new(l_size_1.X * (1 + (v109 - v107) / l_timespan_1), l_size_1.Y * (0.95 - 0.9 * (v120 - l_min_1) / (l_max_1 - l_min_1)));
                        v102["line" .. tostring(v114) .. "-" .. tostring(v118)] = v1.createElement(v13, {
                            From = v122, 
                            To = v121, 
                            Width = 2, 
                            ZIndex = 3 + v118, 
                            [v1.Tag] = "GraphColor" .. if #v115 > 1 then tostring(v118) else ""
                        });
                    end;
                end;
            end;
            v108 = v115;
            v109 = v117;
        end;
    end;
    if next(v102) then
        return v102;
    else
        return nil;
    end;
end;
v17.getLegendBar = function(v123) --[[ Line: 300 ]] --[[ Name: getLegendBar ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local _, v125, _ = v123:getFrameInfo(1);
    if #v125 <= 1 then
        return nil;
    else
        local v127 = {};
        for v128, v129 in v125 do
            v127[v129] = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1 / #v125, 1), 
                LayoutOrder = v128
            }, {
                Label = v1.createElement(l_TextLabel_0, {
                    Text = v129, 
                    [v1.Tag] = "LegendColor" .. v128
                })
            });
        end;
        return v127;
    end;
end;
v17.render = function(v130) --[[ Line: 322 ]] --[[ Name: render ]]
    -- upvalues: v24 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_1 = v130.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_HistoryField_1 = l_props_1.HistoryField;
    local v134 = v24(l_HistoryField_1.field);
    local v135 = v130:getHistoryGraph();
    local v136, v137 = v130:getRulers();
    local v138 = v130:getLegendBar();
    return v1.createElement(l_Pane_0, {
        Size = l_props_1.Size, 
        Position = l_props_1.Position, 
        [v1.Tag] = "History X-Fill"
    }, {
        Title = v1.createElement(l_Pane_0, nil, {
            FieldName = v1.createElement(l_TextLabel_0, {
                Text = v134
            })
        }), 
        Graph = v1.createElement(l_Pane_0, nil, {
            Border = v1.createElement(l_Pane_0, {
                ZIndex = 1
            }), 
            Rulers = if v135 ~= nil then v1.createElement(l_Pane_0, {
                ZIndex = 2
            }, v136) else nil, 
            Scale = if v135 ~= nil then v1.createElement(l_Pane_0, {
                ZIndex = 3
            }, v137) else nil, 
            Canvas = v1.createElement(l_Pane_0, {
                ZIndex = 4, 
                [v1.Change.AbsoluteSize] = v130.onCanvasAbsoluteSizeChanged
            }, v135 or {
                NoHistoryData = v1.createElement(l_TextLabel_0, {
                    Text = l_Localization_1:getText("History", "NoHistoryData")
                })
            })
        }), 
        LegendBar = if v138 then v1.createElement(l_Pane_0, {
            [v1.Tag] = "X-Row"
        }, v138) else nil
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v17));