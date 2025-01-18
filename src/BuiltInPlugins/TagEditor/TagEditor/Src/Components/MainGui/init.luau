local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SplitPane_0 = l_UI_0.SplitPane;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v15 = require(l_Parent_0.Src.Actions);
local v16 = require(script.Parent.ColorPicker);
local v17 = require(script.Parent.IconPicker);
local v18 = require(script.Parent.TagTopPane);
local v19 = require(script.Parent.TagSettingsPane);
local v20 = require(script.Parent.TagSettingsToggleButton);
local v21 = v2.PureComponent:extend("MainGui");
v21.init = function(v22) --[[ Line: 59 ]] --[[ Name: init ]]
    v22.onSizesChange = function(v23) --[[ Line: 60 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            sizes = v23
        });
    end;
end;
v21.render = function(v24) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_KeyboardListener_0 (copy), v17 (copy), v16 (copy), l_SplitPane_0 (copy), v18 (copy), v19 (copy), v20 (copy)
    local l_props_0 = v24.props;
    local l_MainGui_0 = l_props_0.Stylizer.MainGui;
    local v27 = l_LayoutOrderIterator_0.new();
    local v28 = false;
    local v29 = false;
    local v30 = false;
    local v31 = false;
    if l_props_0.iconPicker and l_props_0.iconPicker ~= "" then
        v28 = true;
    elseif l_props_0.colorPicker and l_props_0.colorPicker ~= "" then
        v29 = true;
    elseif not l_props_0.minimizedSettingsPane and l_props_0.tagMenu then
        v30 = true;
    else
        v31 = true;
    end;
    return v2.createElement(l_Pane_0, {
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        KeyboardListener = v2.createElement(l_KeyboardListener_0, {
            OnKeyPressed = function(_, v33) --[[ Line: 93 ]] --[[ Name: OnKeyPressed ]]
                -- upvalues: l_props_0 (copy)
                local v34 = v33[Enum.KeyCode.Down];
                local v35 = v33[Enum.KeyCode.Up];
                local v36 = v33[Enum.KeyCode.Return];
                local v37 = v33[Enum.KeyCode.Escape];
                if v35 or v34 then
                    l_props_0.moveTagSelectionUpOrDown(v34);
                    return;
                elseif v36 then
                    if l_props_0.tagMenu and l_props_0.tagMenu ~= "" then
                        l_props_0.setRenaming(l_props_0.tagMenu, true);
                        return;
                    else
                        l_props_0.setRenamingGroup(l_props_0.groupMenu, true);
                        return;
                    end;
                else
                    if v37 then
                        l_props_0.setAssigningGroup("");
                    end;
                    return;
                end;
            end
        }), 
        IconPicker = v28 and v2.createElement(v17), 
        ColorPicker = v29 and v2.createElement(v16), 
        SplitPane = v30 and v2.createElement(l_SplitPane_0, {
            LayoutOrder = v27:getNextOrder(), 
            ClampSize = true, 
            UseScale = true, 
            Layout = Enum.FillDirection.Vertical, 
            Sizes = v24.state.sizes, 
            MinSizes = l_MainGui_0.SplitPaneMinsizes, 
            OnSizesChange = v24.onSizesChange, 
            BarStyle = "WStyle"
        }, {
            v2.createElement(v18), 
            v2.createElement(v19)
        }), 
        SoloTopPane = v31 and v2.createElement(l_Pane_0, {
            LayoutOrder = v27:getNextOrder(), 
            Size = l_MainGui_0.SoloTopPaneSize
        }, {
            TopPane = v2.createElement(v18)
        }), 
        ShowTagSettingsButton = v31 and v2.createElement(v20, {
            LayoutOrder = v27:getNextOrder()
        })
    });
end;
v21.didMount = function(v38) --[[ Line: 141 ]] --[[ Name: didMount ]]
    v38:setState({
        sizes = v38.props.Stylizer.MainGui.SplitPaneInitialSizes
    });
end;
v21 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v21);
return v3.connect(function(v39, _) --[[ Line: 153 ]] --[[ Name: mapStateToProps ]]
    return {
        colorPicker = v39.ColorPicker, 
        iconPicker = v39.IconPicker, 
        minimizedSettingsPane = v39.MinimizedSettingsPane, 
        tagMenu = v39.TagMenu, 
        groupMenu = v39.GroupMenu
    };
end, function(v41) --[[ Line: 163 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy)
    return {
        moveTagSelectionUpOrDown = function(v42) --[[ Line: 165 ]] --[[ Name: moveTagSelectionUpOrDown ]]
            -- upvalues: v41 (copy), v15 (ref)
            v41(v15.MoveTagSelectionUpOrDown(v42));
        end, 
        setRenaming = function(v43, v44) --[[ Line: 168 ]] --[[ Name: setRenaming ]]
            -- upvalues: v41 (copy), v15 (ref)
            v41(v15.SetRenaming(v43, v44));
        end, 
        setRenamingGroup = function(v45, v46) --[[ Line: 171 ]] --[[ Name: setRenamingGroup ]]
            -- upvalues: v41 (copy), v15 (ref)
            v41(v15.SetRenamingGroup(v45, v46));
        end, 
        setAssigningGroup = function(v47) --[[ Line: 174 ]] --[[ Name: setAssigningGroup ]]
            -- upvalues: v41 (copy), v15 (ref)
            v41(v15.SetAssigningGroup(v47));
        end
    };
end)(v21);