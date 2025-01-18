local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Components.ScriptIconView);
local v6 = require(l_script_FirstAncestor_0.Src.Components.PopUpFrame);
local v7 = require(l_script_FirstAncestor_0.Src.Util.ScriptStatusUtil);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_List_0 = l_UI_0.List;
local v11 = v2.PureComponent:extend("ScriptConversionConsole");
v11.init = function(v12) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_List_0 (copy)
    v12.state = {
        arrowHovered = false, 
        hideConsole = true, 
        rows = {}
    };
    v12.onMouseEnter = function() --[[ Line: 26 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            arrowHovered = true
        });
    end;
    v12.onMouseLeave = function() --[[ Line: 32 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            arrowHovered = false
        });
    end;
    v12.closeConsole = function() --[[ Line: 38 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            hideConsole = true
        });
    end;
    v12.openConsole = function() --[[ Line: 44 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            hideConsole = false, 
            arrowHovered = false
        });
    end;
    v12.renderConsoleContent = function(v13) --[[ Line: 51 ]]
        -- upvalues: v12 (copy), v2 (ref), l_List_0 (ref)
        local l_state_0 = v12.state;
        local l_props_0 = v12.props;
        local l_rows_0 = l_state_0.rows;
        if not l_rows_0 then
            return;
        else
            local l_Stylizer_0 = l_props_0.Stylizer;
            return v2.createElement(l_List_0, {
                Rows = l_rows_0, 
                LayoutOrder = v13, 
                RowHeight = l_Stylizer_0.RowHeight
            });
        end;
    end;
end;
v11.buildRows = function(v18) --[[ Line: 70 ]] --[[ Name: buildRows ]]
    -- upvalues: v7 (copy)
    local l_props_1 = v18.props;
    local l_processResult_0 = l_props_1.processResult;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_v7_StatusMessages_0 = v7:GetStatusMessages(l_processResult_0, l_Localization_0);
    local v24 = {};
    for v25, v26 in l_v7_StatusMessages_0 do
        table.insert(v24, {
            text = v26, 
            icon = {
                Image = l_Stylizer_1.StatusIcons[v25], 
                Size = l_Stylizer_1.IconSize
            }
        });
    end;
    v18:setState({
        rows = v24
    });
end;
v11.didMount = function(v27) --[[ Line: 93 ]] --[[ Name: didMount ]]
    if v27.props.processResult then
        v27:buildRows();
    end;
end;
v11.didUpdate = function(v28, v29) --[[ Line: 99 ]] --[[ Name: didUpdate ]]
    if v28.props.processResult ~= v29.processResult then
        v28:buildRows();
    end;
end;
v11.render = function(v30) --[[ Line: 105 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), v5 (copy), v7 (copy), v6 (copy)
    local l_props_2 = v30.props;
    local l_state_1 = v30.state;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Stylizer_2 = l_props_2.Stylizer;
    local l_processResult_1 = l_props_2.processResult;
    local l_Size_0 = l_Stylizer_2.Arrow.Size;
    local l_hideConsole_0 = l_state_1.hideConsole;
    local l_arrowHovered_0 = l_state_1.arrowHovered;
    local v39 = next(l_processResult_1) ~= nil;
    return v2.createElement(l_Pane_0, {
        BackgroundColor3 = l_Stylizer_2.BackgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_2.RowHeight), 
        Padding = l_Stylizer_2.Padding
    }, {
        StatusPane = v2.createElement(v5, {
            Size = UDim2.fromScale(1, 1), 
            ShowCounts = true, 
            Statuses = v7:GetStatusCounts(l_processResult_1), 
            AllowTooltips = false
        }), 
        PopUpFrame = v39 and v2.createElement(v6, {
            Hide = l_hideConsole_0, 
            OnFocusLost = v30.closeConsole, 
            RenderContent = v30.renderConsoleContent, 
            ExpandedHeight = l_Stylizer_2.ConsoleHeight
        }), 
        ExpandButton = v39 and v2.createElement("ImageButton", {
            Position = UDim2.fromScale(1, 0.5), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
            ImageColor3 = if l_arrowHovered_0 then l_Stylizer_2.Arrow.HoverColor else l_Stylizer_2.Arrow.Color, 
            Image = l_Stylizer_2.Arrow.Image, 
            ImageRectOffset = l_Stylizer_2.Arrow.Offset, 
            ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
            [v2.Event.MouseButton1Click] = v30.openConsole, 
            [v2.Event.MouseEnter] = v30.onMouseEnter, 
            [v2.Event.MouseLeave] = v30.onMouseLeave
        })
    });
end;
v11 = l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11);
return v3.connect(function(v40, _) --[[ Line: 162 ]] --[[ Name: mapStateToProps ]]
    return {
        processResult = v40.ScriptConversion.processResult
    };
end)(v11);