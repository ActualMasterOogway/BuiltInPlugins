local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_GetTextSize_0 = v4.Util.GetTextSize;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(script.Parent.DevSubListItem);
local v12 = require(script.Parent.DevSubListHeaderText);
local v13 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v14 = require(l_Parent_0.Src.Util.DeepMergeTables);
local v15 = require(l_Parent_0.Src.Actions.AddChange);
local v16 = v1.Component:extend("DeveloperSubscriptionList");
v16.render = function(v17) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), v1 (copy), v2 (copy), v13 (copy), l_Button_0 (copy), v12 (copy), v11 (copy), l_Pane_0 (copy)
    local l_DeveloperSubscriptions_0 = v17.props.DeveloperSubscriptions;
    local l_OnDeveloperSubscriptionEdited_0 = v17.props.OnDeveloperSubscriptionEdited;
    local l_OnDeveloperSubscriptionCreated_0 = v17.props.OnDeveloperSubscriptionCreated;
    local v21 = v17.props.ListItemHeight or 32;
    local l_Stylizer_0 = v17.props.Stylizer;
    local l_Localization_0 = v17.props.Localization;
    local l_LayoutOrder_0 = v17.props.LayoutOrder;
    local v25 = l_Localization_0:getText("General", "DevSubsCreateAction");
    local v26 = l_GetTextSize_0(v25, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    local v27 = {
        Header = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
            Size = UDim2.new(1, 0, 0, v13.HEADER_HEIGHT), 
            Text = l_Localization_0:getText("General", "DevSubsListHeader"), 
            TextColor3 = Color3.fromRGB(170, 170, 170), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 0
        }), {
            Padding = v1.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12)
            }), 
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            CreateButton = v1.createElement(l_Button_0, {
                Style = "GameSettingsPrimaryButton", 
                Text = l_Localization_0:getText("General", "DevSubsCreateAction"), 
                Size = UDim2.new(0, v26.X + l_Stylizer_0.createButton.PaddingX, 0, v26.Y + l_Stylizer_0.createButton.PaddingY), 
                OnClick = l_OnDeveloperSubscriptionCreated_0
            })
        }), 
        ListHeader = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v21), 
            LayoutOrder = 1
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 24)
            }), 
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            IdText = v1.createElement(v12, {
                Size = UDim2.new(0.25, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsPlanID"), 
                LayoutOrder = 1, 
                Alignment = Enum.TextXAlignment.Left
            }), 
            NameText = v1.createElement(v12, {
                Size = UDim2.new(0.25, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsName"), 
                LayoutOrder = 2, 
                Alignment = Enum.TextXAlignment.Left
            }), 
            SubscribersText = v1.createElement(v12, {
                Size = UDim2.new(0.2, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsSubscribers"), 
                LayoutOrder = 3, 
                Alignment = Enum.TextXAlignment.Left
            }), 
            CreationDateText = v1.createElement(v12, {
                Size = UDim2.new(0.2, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsCreationDate"), 
                LayoutOrder = 4, 
                Alignment = Enum.TextXAlignment.Left
            })
        })
    };
    local v28 = {};
    for _, v30 in pairs(l_DeveloperSubscriptions_0) do
        table.insert(v28, v30);
    end;
    table.sort(v28, function(v31, v32) --[[ Line: 136 ]]
        if v31.Active ~= v32.Active then
            if v31.Active then
                return true;
            elseif v32.Active then
                return false;
            end;
        end;
        return v31.Key:upper() < v32.Key:upper();
    end);
    local v33 = 1;
    for _, v35 in ipairs(v28) do
        v27[v35.Key] = v1.createElement(v11, {
            Name = v35.Name or "", 
            Id = v35.Id, 
            Subscribers = v35.Subscribers, 
            Active = v35.Active, 
            LayoutOrder = v33 + 1, 
            OnEditButtonActivated = function() --[[ Line: 152 ]] --[[ Name: onEditButtonActivated ]]
                -- upvalues: l_OnDeveloperSubscriptionEdited_0 (copy), v35 (copy)
                l_OnDeveloperSubscriptionEdited_0(v35);
            end, 
            Height = v21, 
            HasError = v17.props.DevSubsErrors[v35.Key] ~= nil, 
            CreationDate = v35.CreationDate or ""
        });
        v33 = v33 + 1;
    end;
    v27.Space = v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v33 + 1
    });
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Spacing = UDim.new(0, 10)
    }, v27);
end;
v16 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v16);
return v3.connect(function(v36, _) --[[ Line: 191 ]]
    -- upvalues: v14 (copy)
    local l_Errors_0 = v36.Settings.Errors;
    local v39 = (v36.Settings.Current or {}).DeveloperSubscriptions or {};
    local v40 = (v36.Settings.Changed or {}).DeveloperSubscriptions or {};
    return {
        DeveloperSubscriptions = v14.Merge(v39, v40) or {}, 
        ModeratedDevSubs = v36.DevSubModeration or {}, 
        DevSubsErrors = l_Errors_0.DeveloperSubscriptions or {}
    };
end, function(v41) --[[ Line: 205 ]]
    -- upvalues: v15 (copy)
    return {
        OnDeveloperSubscriptionEdited = function(v42) --[[ Line: 207 ]] --[[ Name: OnDeveloperSubscriptionEdited ]]
            -- upvalues: v41 (copy), v15 (ref)
            v41(v15("isEditingSubscription", true));
            v41(v15("editedSubscriptionKey", v42.Key));
        end
    };
end)(v16);