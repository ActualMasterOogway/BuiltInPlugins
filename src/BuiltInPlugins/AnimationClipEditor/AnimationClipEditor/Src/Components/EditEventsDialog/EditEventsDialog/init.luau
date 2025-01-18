local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = v1.PROMPT_BUTTON_SIZE.Y + 30;
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.LayoutOrderIterator);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v8 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyledDialog_0 = v8.UI.StyledDialog;
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v13 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.EventNameEntry);
local v14 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.AddEventEntry);
local v15 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.FocusedPrompt);
local v16 = v3.PureComponent:extend("EditEventsDialog");
v16.init = function(v17, v18) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v6 (copy), v3 (copy), v4 (copy)
    v17.state = {
        CurrentEvents = v7(v18.Events), 
        deleteAllName = nil, 
        renameAllNames = nil
    };
    v17.onButtonClicked = function(v19) --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        if v19 then
            v17.props.OnSaved(v17.state.CurrentEvents);
        end;
        v17.props.OnClose();
    end;
    v17.onAddEvent = function() --[[ Line: 68 ]]
        -- upvalues: v17 (copy), v6 (ref)
        local l_CurrentEvents_0 = v17.state.CurrentEvents;
        local l_Tick_0 = v17.props.Tick;
        v6.addEvent(l_CurrentEvents_0, l_Tick_0, "", "");
        v17:setState({
            CurrentEvents = l_CurrentEvents_0
        });
    end;
    v17.onRenameEvent = function(v22, v23) --[[ Line: 79 ]]
        -- upvalues: v17 (copy), v6 (ref)
        local l_CurrentEvents_1 = v17.state.CurrentEvents;
        local l_Tick_1 = v17.props.Tick;
        if l_CurrentEvents_1.Data[l_Tick_1] and l_CurrentEvents_1.Data[l_Tick_1][v22] then
            local v26 = l_CurrentEvents_1.Data[l_Tick_1][v22];
            v6.removeEvent(l_CurrentEvents_1, l_Tick_1, v22);
            v6.addEvent(l_CurrentEvents_1, l_Tick_1, v23, v26);
        end;
        v17:setState({
            CurrentEvents = l_CurrentEvents_1
        });
    end;
    v17.onSetEventValue = function(v27, v28) --[[ Line: 92 ]]
        -- upvalues: v17 (copy), v6 (ref)
        local l_CurrentEvents_2 = v17.state.CurrentEvents;
        local l_Tick_2 = v17.props.Tick;
        v6.setEventValue(l_CurrentEvents_2, l_Tick_2, v27, v28);
        v17:setState({
            CurrentEvents = l_CurrentEvents_2
        });
    end;
    v17.onDeleteEvent = function(v31) --[[ Line: 101 ]]
        -- upvalues: v17 (copy), v6 (ref)
        local l_CurrentEvents_3 = v17.state.CurrentEvents;
        local l_Tick_3 = v17.props.Tick;
        v6.removeEvent(l_CurrentEvents_3, l_Tick_3, v31);
        v17:setState({
            CurrentEvents = l_CurrentEvents_3
        });
    end;
    v17.onDeleteAllEvents = function(v34) --[[ Line: 110 ]]
        -- upvalues: v17 (copy), v6 (ref)
        local l_CurrentEvents_4 = v17.state.CurrentEvents;
        for v36, v37 in pairs(l_CurrentEvents_4.Data) do
            if v37[v34] then
                v6.removeEvent(l_CurrentEvents_4, v36, v34);
            end;
        end;
        v17:setState({
            CurrentEvents = l_CurrentEvents_4
        });
    end;
    v17.onRenameAllEvents = function(v38, v39) --[[ Line: 122 ]]
        -- upvalues: v17 (copy), v6 (ref)
        local l_CurrentEvents_5 = v17.state.CurrentEvents;
        for v41, v42 in pairs(l_CurrentEvents_5.Data) do
            if v42[v38] then
                local v43 = v42[v38];
                v6.removeEvent(l_CurrentEvents_5, v41, v38);
                v6.addEvent(l_CurrentEvents_5, v41, v39, v43);
            end;
        end;
        v17:setState({
            CurrentEvents = l_CurrentEvents_5
        });
    end;
    v17.showDeleteAllPrompt = function(v44) --[[ Line: 136 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            deleteAllName = v44
        });
    end;
    v17.hideDeleteAllPrompt = function() --[[ Line: 142 ]]
        -- upvalues: v17 (copy), v3 (ref)
        v17:setState({
            deleteAllName = v3.None
        });
    end;
    v17.showRenameAllPrompt = function(v45, v46) --[[ Line: 148 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            renameAllNames = {
                Name = v45, 
                NewName = v46
            }
        });
    end;
    v17.hideRenameAllPrompt = function() --[[ Line: 157 ]]
        -- upvalues: v17 (copy), v3 (ref)
        v17:setState({
            renameAllNames = v3.None
        });
    end;
    v17.getUnusedEvents = function(v47) --[[ Line: 163 ]]
        -- upvalues: v17 (copy), v4 (ref)
        local v48 = {};
        local l_CurrentEvents_6 = v17.state.CurrentEvents;
        for _, v51 in pairs(l_CurrentEvents_6.Data) do
            for v52, _ in pairs(v51) do
                v48[v52] = true;
            end;
        end;
        if l_CurrentEvents_6.Data[v47] then
            for v54, _ in pairs(l_CurrentEvents_6.Data[v47]) do
                v48[v54] = nil;
            end;
        end;
        local v56 = v4.Dictionary.keys(v48);
        table.sort(v56);
        return v56;
    end;
end;
v16.didMount = function(v57) --[[ Line: 182 ]] --[[ Name: didMount ]]
    v57.props.Mouse:__resetCursor();
end;
v16.makeText = function(_, v59, v60, v61, v62) --[[ Line: 187 ]] --[[ Name: makeText ]]
    -- upvalues: v3 (copy)
    return v3.createElement("TextLabel", {
        LayoutOrder = 0, 
        Size = UDim2.new(0, 220, 0, 22), 
        Text = v60, 
        TextColor3 = v61 or v59.dialogTheme.textColor, 
        Font = v59.font, 
        TextSize = v59.dialogTheme.textSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        BackgroundTransparency = 1
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v62 and 8 or 20), 
            PaddingRight = UDim.new(0, v62 and 20 or 8)
        })
    });
end;
v16.addTitleRow = function(v63, v64, v65) --[[ Line: 205 ]] --[[ Name: addTitleRow ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 440, 0, 22), 
        BackgroundTransparency = 1, 
        LayoutOrder = v63.layout:getNextOrder()
    }, {
        [1] = v63:makeText(v64, v65:getText("Title", "EventName")), 
        [2] = v63:makeText(v64, v65:getText("Title", "Parameter"), nil, true)
    });
end;
v16.addEventRow = function(v66, v67, v68, v69, v70) --[[ Line: 221 ]] --[[ Name: addEventRow ]]
    -- upvalues: v3 (copy), v13 (copy), v12 (copy)
    local v71 = v66.layout:getNextOrder();
    local l_shadedBackgroundColor_0 = v67.trackTheme.shadedBackgroundColor;
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 440, 0, 22), 
        BackgroundTransparency = 1, 
        LayoutOrder = v71
    }, {
        [1] = v3.createElement(v13, {
            Size = UDim2.new(0, 220, 0, 22), 
            Name = v68, 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 8), 
            OnDeleteEvent = v66.onDeleteEvent, 
            OnDeleteAllEvents = v66.showDeleteAllPrompt, 
            UnusedEvents = v70, 
            OnRenameEvent = function(v73, v74) --[[ Line: 240 ]] --[[ Name: OnRenameEvent ]]
                -- upvalues: v66 (copy)
                if v73 == "" then
                    v66.onRenameEvent(v73, v74);
                    return;
                else
                    if v73 ~= v74 then
                        v66.showRenameAllPrompt(v73, v74);
                    end;
                    return;
                end;
            end
        }), 
        [2] = v3.createElement("Frame", {
            Size = UDim2.new(0, 220, 0, 22), 
            BackgroundColor3 = l_shadedBackgroundColor_0, 
            BorderColor3 = v67.borderColor
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 20), 
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            TextBox = v3.createElement(v12, {
                Size = UDim2.new(1, 0, 1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v69, 
                ClearTextOnFocus = false, 
                FocusChanged = function(v75, v76) --[[ Line: 267 ]] --[[ Name: FocusChanged ]]
                    -- upvalues: v66 (copy), v68 (copy)
                    if not v76 then
                        v66.onSetEventValue(v68, v75.Text);
                    end;
                end
            })
        })
    });
end;
v16.addNewEventRow = function(v77, v78, _) --[[ Line: 277 ]] --[[ Name: addNewEventRow ]]
    -- upvalues: v3 (copy), v14 (copy)
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 440, 0, 22), 
        BorderColor3 = v78.borderColor, 
        BackgroundColor3 = v78.backgroundColor, 
        LayoutOrder = v77.layout:getNextOrder()
    }, {
        AddEventEntry = v3.createElement(v14, {
            Size = UDim2.new(0, 220, 0, 22), 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 8), 
            OnAddEvent = v77.onAddEvent
        })
    });
end;
v16.renderEvents = function(v80, v81, v82) --[[ Line: 293 ]] --[[ Name: renderEvents ]]
    -- upvalues: v4 (copy)
    local l_props_0 = v80.props;
    local l_state_0 = v80.state;
    local l_Tick_4 = l_props_0.Tick;
    local l_CurrentEvents_7 = l_state_0.CurrentEvents;
    local v87 = 66;
    if l_CurrentEvents_7 and l_CurrentEvents_7.Data and l_CurrentEvents_7.Data[l_Tick_4] then
        local v88 = v80.getUnusedEvents(l_Tick_4);
        local v89 = v4.Dictionary.keys(l_CurrentEvents_7.Data[l_Tick_4]);
        table.sort(v89, function(v90, v91) --[[ Line: 305 ]]
            if v90 == "" then
                return false;
            elseif v91 == "" then
                return true;
            else
                return v90 < v91;
            end;
        end);
        for _, v93 in ipairs(v89) do
            local v94 = l_CurrentEvents_7.Data[l_Tick_4][v93];
            v82["Event_" .. v93] = v80:addEventRow(v81, v93, v94, v88);
            v87 = v87 + 22;
        end;
    end;
    return v87;
end;
v16.renderDeleteAllPrompt = function(v95, v96, v97) --[[ Line: 324 ]] --[[ Name: renderDeleteAllPrompt ]]
    -- upvalues: v3 (copy), v15 (copy)
    local l_deleteAllName_0 = v95.state.deleteAllName;
    local _ = v96.button;
    return v3.createElement(v15, {
        Buttons = {
            {
                Key = false, 
                Text = v97:getText("Dialog", "No"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = v97:getText("Dialog", "Yes"), 
                Style = "RoundPrimary"
            }
        }, 
        PromptText = v97:getText("Dialog", "DeleteAllPrompt_Migrated", {
            name = l_deleteAllName_0
        }), 
        OnButtonClicked = function(v100) --[[ Line: 335 ]] --[[ Name: OnButtonClicked ]]
            -- upvalues: v95 (copy), l_deleteAllName_0 (copy)
            if v100 then
                v95.onDeleteAllEvents(l_deleteAllName_0);
            end;
            v95.hideDeleteAllPrompt();
        end, 
        OnClose = v95.hideDeleteAllPrompt
    });
end;
v16.renderRenameAllPrompt = function(v101, _, v103) --[[ Line: 345 ]] --[[ Name: renderRenameAllPrompt ]]
    -- upvalues: v3 (copy), v15 (copy)
    local l_state_1 = v101.state;
    local l_Name_0 = l_state_1.renameAllNames.Name;
    local l_NewName_0 = l_state_1.renameAllNames.NewName;
    return v3.createElement(v15, {
        Buttons = {
            {
                Key = false, 
                Text = v103:getText("Dialog", "ChangeThis"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = v103:getText("Dialog", "ChangeAll"), 
                Style = "Round"
            }
        }, 
        PromptText = v103:getText("Dialog", "RenameAllPrompt_Migrated", {
            name = l_Name_0, 
            newName = l_NewName_0
        }), 
        OnButtonClicked = function(v107) --[[ Line: 356 ]] --[[ Name: OnButtonClicked ]]
            -- upvalues: v101 (copy), l_Name_0 (copy), l_NewName_0 (copy)
            if v107 then
                v101.onRenameAllEvents(l_Name_0, l_NewName_0);
            else
                v101.onRenameEvent(l_Name_0, l_NewName_0);
            end;
            v101.hideRenameAllPrompt();
        end, 
        OnClose = v101.hideRenameAllPrompt
    });
end;
v16.render = function(v108) --[[ Line: 368 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy), l_StyledDialog_0 (copy), v1 (copy)
    local l_Stylizer_0 = v108.props.Stylizer;
    local l_Localization_0 = v108.props.Localization;
    v108.layout = v5.new();
    local l_props_1 = v108.props;
    local l_state_2 = v108.state;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local _ = l_Stylizer_0.button;
    local v115 = l_state_2.deleteAllName ~= nil;
    local v116 = l_state_2.renameAllNames ~= nil;
    local v117 = {
        {
            Key = false, 
            Text = l_Localization_0:getText("Dialog", "Cancel"), 
            Style = "Round"
        }, 
        {
            Key = true, 
            Text = l_Localization_0:getText("Dialog", "Save"), 
            Style = "RoundPrimary"
        }
    };
    local v118 = {
        Layout = v3.createElement("UITableLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillEmptySpaceColumns = true
        }), 
        TitleRow = v108:addTitleRow(l_Stylizer_0, l_Localization_0)
    };
    local v119 = v108:renderEvents(l_Stylizer_0, v118);
    v118.AddNew = v108:addNewEventRow(l_Stylizer_0, l_Localization_0);
    if v115 then
        v118.DeleteAllPrompt = v108:renderDeleteAllPrompt(l_Stylizer_0, l_Localization_0);
    elseif v116 then
        v118.RenameAllPrompt = v108:renderRenameAllPrompt(l_Stylizer_0, l_Localization_0);
    end;
    local v120 = Vector2.new(460, math.max(v119, 110) + v2);
    return v3.createElement(l_StyledDialog_0, {
        Size = v120, 
        MinContentSize = v120, 
        TextSize = l_dialogTheme_0.textSize, 
        Resizable = true, 
        Buttons = v117, 
        OnButtonPressed = v108.onButtonClicked, 
        OnClose = l_props_1.OnClose, 
        BorderPadding = 10, 
        ButtonPadding = v1.PROMPT_BUTTON_PADDING, 
        ButtonHeight = v1.PROMPT_BUTTON_SIZE.Y, 
        ButtonWidth = v1.PROMPT_BUTTON_SIZE.X, 
        Title = l_Localization_0:getText("Title", "EditEvents")
    }, {
        Container = v3.createElement("ScrollingFrame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            Size = UDim2.new(1, 0, 1, -10), 
            ScrollBarThickness = 8, 
            CanvasSize = UDim2.new(0, 0, 0, v119)
        }, v118)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v16));