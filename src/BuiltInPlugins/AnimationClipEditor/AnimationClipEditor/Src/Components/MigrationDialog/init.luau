local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetReadOnly);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetLegacyAnimationInstances);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.LoadLatestAnimation);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local _ = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v20 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeReduction.VisvalingamWhyatt);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Dash_0 = v3.Dash;
local l_assign_0 = l_Dash_0.assign;
local l_join_0 = l_Dash_0.join;
local _ = l_Dash_0.map;
local l_UI_0 = v3.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local _ = l_UI_0.Slider;
local l_Table_0 = l_UI_0.Table;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v38 = game:DefineFastString("ACELearnMoreAnimSavesMigration", "https://create.roblox.com/docs/animation/editor#saving-an-animation");
local v39 = v4.PureComponent:extend("MigrationDialog");
v39.init = function(v40) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), l_join_0 (copy), l_GuiService_0 (copy), v38 (copy)
    v40.state = {
        choices = {}
    };
    v40.columns = {
        {
            Name = "Animation", 
            Width = UDim.new(0.5, 0)
        }, 
        {
            Name = "Action", 
            Width = UDim.new(0.5, 0)
        }
    };
    v40.onMigrate = function() --[[ Line: 75 ]]
        -- upvalues: v40 (copy), v20 (ref)
        local v41 = nil;
        for v42, v43 in v40.state.choices do
            if v43 == "Migrate" then
                if v41 == nil then
                    v41 = v20.getAnimSavesFolder(v40.props.RootInstance, true);
                end;
                v42.Parent = v41;
            elseif v43 == "Delete" then
                v42:Destroy();
            end;
        end;
        v40.onClose();
    end;
    v40.onClose = function() --[[ Line: 91 ]]
        -- upvalues: v40 (copy)
        v40.props.ClearLegacyAnimationInstances();
        v40.props.LoadLatestAnimation(v40.props.RootInstance, v40.props.Analytics);
    end;
    v40.onSizesChange = function(v44) --[[ Line: 96 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            sizes = v44
        });
    end;
    v40.onActionClicked = function(v45, v46) --[[ Line: 102 ]]
        -- upvalues: v40 (copy), l_join_0 (ref)
        if v46 then
            v40:setState({
                choices = l_join_0(v40.state.choices, {
                    [v46] = v45
                })
            });
            return;
        else
            local v47 = {};
            for _, v49 in v40.props.LegacyAnimationInstances do
                v47[v49.animation] = v45;
            end;
            v40:setState({
                choices = v47
            });
            return;
        end;
    end;
    v40.onLearnMore = function(_, _) --[[ Line: 116 ]]
        -- upvalues: l_GuiService_0 (ref), v38 (ref)
        l_GuiService_0:OpenBrowserWindow(v38);
    end;
end;
v39.makeHeader = function(v52, v53) --[[ Line: 121 ]] --[[ Name: makeHeader ]]
    -- upvalues: v4 (copy), l_TextLabel_0 (copy), l_RadioButtonList_0 (copy), l_Pane_0 (copy), l_assign_0 (copy)
    local l_Localization_0 = v52.props.Localization;
    return function(v55) --[[ Line: 124 ]]
        -- upvalues: v4 (ref), l_TextLabel_0 (ref), l_Localization_0 (copy), l_RadioButtonList_0 (ref), v53 (copy), v52 (copy), l_Pane_0 (ref), l_assign_0 (ref)
        local _ = v55.Name;
        local l_Width_0 = v55.Width;
        local l_ColumnIndex_0 = v55.ColumnIndex;
        local l_Style_0 = v55.Style;
        local v60 = nil;
        v60 = if l_ColumnIndex_0 == 1 then v4.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("Migration", "AnimationClip"), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left
        }) else v4.createElement(l_RadioButtonList_0, {
            Buttons = {
                {
                    Key = "Delete", 
                    Text = l_Localization_0:getText("Migration", "Delete")
                }, 
                {
                    Key = "Migrate", 
                    Text = l_Localization_0:getText("Migration", "Migrate")
                }, 
                {
                    Key = "Ignore", 
                    Text = l_Localization_0:getText("Migration", "Ignore")
                }
            }, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SelectedKey = v53, 
            OnClick = v52.onActionClicked
        });
        return v4.createElement(l_Pane_0, l_assign_0({
            LayoutOrder = l_ColumnIndex_0, 
            BorderColor3 = l_Style_0.Border, 
            BorderSizePixel = 1, 
            Padding = l_Style_0.HeaderCellPadding, 
            Style = "SubtleBox", 
            Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0)
        }, v55.WrapperProps), {
            Content = v60
        });
    end;
end;
v39.makeCell = function(v61) --[[ Line: 168 ]] --[[ Name: makeCell ]]
    -- upvalues: v4 (copy), l_TextLabel_0 (copy), l_RadioButtonList_0 (copy), l_Pane_0 (copy)
    local l_Localization_1 = v61.props.Localization;
    return function(v63) --[[ Line: 171 ]]
        -- upvalues: v4 (ref), l_TextLabel_0 (ref), l_RadioButtonList_0 (ref), l_Localization_1 (copy), l_Pane_0 (ref)
        local l_ColumnIndex_1 = v63.ColumnIndex;
        local _ = v63.RowIndex;
        local l_Value_0 = v63.Value;
        local l_Style_1 = v63.Style;
        local v68 = v63.Width or UDim.new(1 / #v63.Columns, 0);
        local v69 = nil;
        v69 = if l_ColumnIndex_1 == 1 then v4.createElement(l_TextLabel_0, {
            Text = l_Value_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left
        }) else v4.createElement(l_RadioButtonList_0, {
            Buttons = {
                {
                    Key = "Delete", 
                    Text = l_Localization_1:getText("Migration", "Delete")
                }, 
                {
                    Key = "Migrate", 
                    Text = l_Localization_1:getText("Migration", "Migrate")
                }, 
                {
                    Key = "Ignore", 
                    Text = l_Localization_1:getText("Migration", "Ignore")
                }
            }, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SelectedKey = l_Value_0.SelectedKey, 
            OnClick = l_Value_0.OnClick
        });
        return v4.createElement(l_Pane_0, {
            LayoutOrder = v63.ColumnIndex, 
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 5, 
                Right = 5
            }, 
            Style = "Box", 
            BackgroundColor3 = l_Style_1.BackgroundEven, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Style_1.Border, 
            Size = UDim2.new(v68.Scale, v68.Offset, 1, 0), 
            ClipsDescendants = true
        }, {
            Content = v69
        });
    end;
end;
v39.findCommonAction = function(v70) --[[ Line: 219 ]] --[[ Name: findCommonAction ]]
    local v71 = nil;
    for _, v73 in v70.state.choices do
        if v71 ~= nil and v73 ~= v71 then
            return nil;
        else
            v71 = v73;
        end;
    end;
    return v71 or "Ignore";
end;
v39.makeRows = function(v74) --[[ Line: 230 ]] --[[ Name: makeRows ]]
    local _ = v74.props.Localization;
    local v76 = {};
    for _, v78 in v74.props.LegacyAnimationInstances do
        table.insert(v76, {
            Animation = v78.animation.Name, 
            Action = {
                SelectedKey = v74.state.choices[v78.animation] or "Ignore", 
                OnClick = function(v79) --[[ Line: 239 ]] --[[ Name: OnClick ]]
                    -- upvalues: v74 (copy), v78 (copy)
                    v74.onActionClicked(v79, v78.animation);
                end
            }
        });
    end;
    table.sort(v76, function(v80, v81) --[[ Line: 245 ]]
        return v80.Animation < v81.Animation;
    end);
    return v76;
end;
v39.didMount = function(v82) --[[ Line: 251 ]] --[[ Name: didMount ]]
    local v83 = {};
    local v84 = v82.props.LegacyAnimationInstances or {};
    for _, v86 in v84 do
        v83[v86.animation] = "Ignore";
    end;
    v82:setState({
        choices = v83
    });
end;
v39.render = function(v87) --[[ Line: 259 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_StyledDialog_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_Table_0 (copy)
    local l_Stylizer_0 = v87.props.Stylizer;
    local l_Localization_3 = v87.props.Localization;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local _ = v87.state.keyframes;
    local _ = v87.state.ticks;
    local v93 = {
        {
            Key = false, 
            Text = l_Localization_3:getText("Dialog", "Skip"), 
            Style = "Round"
        }, 
        {
            Key = true, 
            Text = l_Localization_3:getText("Dialog", "Ok"), 
            Style = "RoundPrimary"
        }
    };
    local v94 = v87:makeRows();
    local v95 = v87:findCommonAction();
    return v4.createElement(l_StyledDialog_0, {
        MinContentSize = Vector2.new(600, 250), 
        Size = Vector2.new(600, 250), 
        TextSize = l_dialogTheme_0.textSize, 
        Resizable = false, 
        Buttons = v93, 
        OnButtonPressed = function(v96) --[[ Line: 281 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: v87 (copy)
            if v96 then
                v87.onMigrate();
                return;
            else
                v87.onClose();
                return;
            end;
        end, 
        OnClose = v87.onClose, 
        Title = l_Localization_3:getText("Title", "MigrateAnimations")
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Text = v4.createElement(l_TextLabel_0, {
            Size = UDim2.new(1, 0, 0, 75), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = l_Localization_3:getText("Migration", "MigrateAnimations"), 
            TextColor3 = l_Stylizer_0.TextColor, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            LayoutOrder = 1
        }), 
        Link = v4.createElement(l_LinkText_0, {
            Size = UDim2.new(1, 0, 0, 30), 
            Text = l_Localization_3:getText("Migration", "LearnMore"), 
            TextYAlignment = Enum.TextYAlignment.Top, 
            OnClick = v87.onLearnMore, 
            LayoutOrder = 2
        }), 
        Table = v4.createElement(l_Table_0, {
            Size = UDim2.new(1, 0, 1, -105), 
            Scroll = true, 
            UseScale = true, 
            ClampSize = true, 
            Columns = v87.columns, 
            Rows = v94, 
            CellComponent = v87:makeCell(), 
            HeaderCellComponent = v87:makeHeader(v95), 
            ShowHeader = true, 
            LayoutOrder = 3
        })
    });
end;
local function v99(v97) --[[ Line: 329 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v97.Status;
    return {
        LegacyAnimationInstances = l_Status_0.LegacyAnimationInstances, 
        RootInstance = l_Status_0.RootInstance
    };
end;
local function v103(v100) --[[ Line: 337 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        ClearLegacyAnimationInstances = function() --[[ Line: 339 ]] --[[ Name: ClearLegacyAnimationInstances ]]
            -- upvalues: v100 (copy), v12 (ref)
            v100(v12({}));
        end, 
        LoadLatestAnimation = function(v101, v102) --[[ Line: 343 ]] --[[ Name: LoadLatestAnimation ]]
            -- upvalues: v100 (copy), v13 (ref)
            v100(v13(v101, v102));
        end
    };
end;
v39 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v39);
return v5.connect(v99, v103)(v39);