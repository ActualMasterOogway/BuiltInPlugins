local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v8.collectArray;
local l_copy_0 = v8.copy;
local l_includes_0 = v8.includes;
local l_mapOne_0 = v8.mapOne;
local l_startsWith_0 = v8.startsWith;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v20 = require(l_Parent_0.Src.Util.DesignHelpers);
local v21 = require(l_Parent_0.Src.Components.TokenTable);
local v22 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v23 = v2.PureComponent:extend("ThemesView");
v23.init = function(v24) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_collectArray_0 (copy), l_mapOne_0 (copy), l_startsWith_0 (copy), l_includes_0 (copy), l_copy_0 (copy), v22 (copy), v20 (copy)
    v24.state = {
        Themes = nil, 
        SelectedTheme = nil
    };
    v24.updateThemes = function() --[[ Line: 49 ]]
        -- upvalues: v24 (copy), l_collectArray_0 (ref), l_mapOne_0 (ref), l_startsWith_0 (ref), l_includes_0 (ref)
        local l_props_0 = v24.props;
        local l_DesignSheet_0 = l_props_0.DesignSheet;
        local v29 = l_collectArray_0(l_props_0.RootItem.Children, function(_, v28) --[[ Line: 53 ]]
            return v28.Instance;
        end);
        local v32 = l_mapOne_0(l_DesignSheet_0:GetDerives(), function(v30) --[[ Line: 57 ]]
            -- upvalues: l_startsWith_0 (ref), l_includes_0 (ref), v29 (copy)
            local l_v30_Attribute_0 = v30:GetAttribute("StyleCategory");
            if l_v30_Attribute_0 and l_startsWith_0(l_v30_Attribute_0, "Themes") and l_includes_0(v29, v30) then
                return v30;
            else
                return nil;
            end;
        end);
        v24:setState({
            Themes = v29, 
            SelectedTheme = v32
        });
    end;
    v24.toggleThemes = function(v33) --[[ Line: 72 ]]
        -- upvalues: v24 (copy), l_copy_0 (ref), v22 (ref), v20 (ref)
        v24:setState(function(v34) --[[ Line: 74 ]]
            -- upvalues: l_copy_0 (ref), v33 (copy), v22 (ref), v20 (ref), v24 (ref)
            local v35 = l_copy_0(v34.Themes);
            local v36 = nil;
            for _, v38 in v35 do
                if v38 == v33 then
                    v36 = v38;
                end;
            end;
            v22({
                Name = "StyleEditor.SetDerives", 
                DisplayName = "Style Editor - Set Derives", 
                DoChange = function() --[[ Line: 86 ]] --[[ Name: DoChange ]]
                    -- upvalues: v20 (ref), v24 (ref), v36 (ref), v34 (copy)
                    v20.replaceDerive(v24.props.DesignSheet, v36, v34.SelectedTheme);
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return {
                Themes = v35, 
                SelectedTheme = v36
            };
        end);
    end;
    v24.updateThemes();
end;
v23.didUpdate = function(v39, v40, _) --[[ Line: 102 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v39.props;
    if v40.IsDirty and not l_props_1.IsDirty or v40.DesignSheet ~= l_props_1.DesignSheet or v40.RootItem ~= l_props_1.RootItem then
        v39.updateThemes();
    end;
end;
v23.render = function(v43) --[[ Line: 111 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v21 (copy), l_ScrollingFrame_0 (copy), l_SimpleExpandablePane_0 (copy), l_Pane_0 (copy)
    local l_props_2 = v43.props;
    local l_state_0 = v43.state;
    local v46 = {};
    for v47, v48 in ipairs(l_state_0.Themes) do
        local v49 = v48 == l_state_0.SelectedTheme;
        v46["Theme " .. v47] = v2.createElement(v21, {
            RootInstance = v48, 
            ThemeSelected = v49, 
            OnClick = v43.toggleThemes
        });
    end;
    return v2.createElement(l_ScrollingFrame_0, {
        [v2.Tag] = "ScrollingAutomaticSize"
    }, {
        Themes = v2.createElement(l_SimpleExpandablePane_0, {
            AlwaysExpanded = true, 
            Text = l_props_2.RootItem.Name.Value .. " Themes", 
            [v2.Tag] = "X-ColumnM X-FitY X-PadS"
        }, {
            Column = v2.createElement(l_Pane_0, {
                [v2.Tag] = "X-ColumnM X-FitY"
            }, v46)
        })
    });
end;
v23 = l_withContext_0({
    Localization = l_Localization_0
})(v23);
return v3.connect(function(v50) --[[ Line: 144 ]]
    return {
        DesignSheet = v50.Window.DesignSheet, 
        IsDirty = v50.Window.IsDirty
    };
end)(v23);