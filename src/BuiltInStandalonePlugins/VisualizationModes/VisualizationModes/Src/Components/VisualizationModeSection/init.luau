local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginSetting);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Pane_0 = v1.UI.Pane;
local function _(v9) --[[ Line: 36 ]] --[[ Name: getExpandedSettingKey ]]
    return string.format("Category_%s_IsExpanded", v9);
end;
return function(v11) --[[ Line: 40 ]] --[[ Name: VisualizationModeSection ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v6 (copy), v3 (copy), v2 (copy), l_Pane_0 (copy), v5 (copy)
    local v12 = l_LayoutOrderIterator_0.new();
    local l_v6_0 = v6;
    local l_SettingKey_0 = v11.SettingKey;
    local v15;
    l_v6_0, v15 = l_v6_0(string.format("Category_%s_IsExpanded", l_SettingKey_0), v11.DefaultIsExpanded);
    l_SettingKey_0 = v3.useToggleState(l_v6_0);
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v15 (copy), l_SettingKey_0 (copy)
        v15(l_SettingKey_0.enabled);
    end, {
        l_SettingKey_0.enabled
    });
    local v16 = l_SettingKey_0.enabled or v11.ForceExpansion;
    return v2.createElement("ImageButton", {
        Visible = v11.Visible, 
        LayoutOrder = v11.LayoutOrder, 
        [v2.Tag] = "VisualizationModes-Group", 
        [v2.Event.Activated] = l_SettingKey_0.toggle
    }, {
        Contents = v2.createElement(l_Pane_0, {
            [v2.Tag] = "X-Column X-Top X-FitY X-Left", 
            Size = UDim2.fromScale(1, 0)
        }, {
            Main = v2.createElement(l_Pane_0, {
                [v2.Tag] = "X-Column X-Top X-Fit", 
                Size = UDim2.fromScale(1, 0)
            }, {
                Title = v2.createElement(v5, {
                    LayoutOrder = v12:getNextOrder(), 
                    Enabled = v11.Enabled, 
                    BadgeText = if not v16 and v11.EnabledEntryCount > 0 then tostring(v11.EnabledEntryCount) else nil, 
                    MatchIndexes = v11.MatchIndexes, 
                    CanExpand = true, 
                    IsExpanded = v16, 
                    OnToggle = v11.OnToggle, 
                    CanToggle = v11.CanToggle, 
                    IsEditingEnabled = v11.IsEditingEnabled, 
                    OnExpansionToggled = l_SettingKey_0.toggle, 
                    Text = v11.Text
                }), 
                Content = v2.createElement(l_Pane_0, {
                    [v2.Tag] = "X-Column X-Top X-FitY", 
                    Size = UDim2.fromScale(1, 0), 
                    LayoutOrder = v12:getNextOrder(), 
                    Visible = v16
                }, v11.SectionEntries)
            })
        })
    });
end;