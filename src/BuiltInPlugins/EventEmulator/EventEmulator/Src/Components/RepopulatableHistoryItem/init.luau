local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Box_0 = l_UI_0.Box;
local l_Button_0 = l_UI_0.Button;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.RemoveHistoryItem);
local v12 = require(l_Actions_0.SetMemStoragePair);
local v13 = require(l_Actions_0.SetRBXParameters);
local v14 = require(l_Actions_0.SetView);
local l_VIEW_ID_0 = require(l_Parent_0.Src.Util.Constants).VIEW_ID;
local v16 = v1.PureComponent:extend("RepopulatableHistoryItem");
v16.init = function(v17) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: l_VIEW_ID_0 (copy)
    v17.repopulateHistoryItem = function() --[[ Line: 26 ]]
        -- upvalues: v17 (copy), l_VIEW_ID_0 (ref)
        local l_props_0 = v17.props;
        local l_CurrentView_0 = l_props_0.CurrentView;
        local l_View_0 = l_props_0.View;
        local l_Data_0 = l_props_0.Data;
        if l_CurrentView_0 ~= l_View_0 then
            v17.props.SetView(l_View_0);
        end;
        if l_View_0 == l_VIEW_ID_0.RBXEvent then
            v17.props.SetRBXParameters(l_Data_0);
        end;
        if l_View_0 == l_VIEW_ID_0.MemStorage then
            v17.props.SetMemStoragePair(l_Data_0);
        end;
    end;
    v17.deleteHistoryItem = function() --[[ Line: 44 ]]
        -- upvalues: v17 (copy)
        v17.props.RemoveHistoryItem(v17.props.Name);
    end;
end;
v16.render = function(v22) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Container_0 (copy), l_Box_0 (copy), l_Button_0 (copy)
    local l_props_1 = v22.props;
    local l_Name_0 = l_props_1.Name;
    local l_View_1 = l_props_1.View;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Sizes_0 = l_Stylizer_0.Sizes;
    local l_Layout_0 = l_Stylizer_0.Layout;
    local l_Text_0 = l_Stylizer_0.Text;
    return v1.createElement(l_Container_0, {
        Background = l_Box_0, 
        Size = UDim2.new(1, 0, 0, l_Sizes_0.HistoryButtonMinor)
    }, {
        Layout = v1.createElement("UIListLayout", l_Layout_0.HistoryItem), 
        View = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_Sizes_0.HistoryButtonMajor, 0, l_Sizes_0.HistoryButtonMinor), 
            Text = l_View_1, 
            LayoutOrder = 2, 
            TextColor3 = l_Text_0.BrightText.Color, 
            BackgroundTransparency = 1, 
            TextSize = 18, 
            Font = Enum.Font.SourceSans
        }), 
        Name = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.HistoryButtonMajor, 0, l_Sizes_0.HistoryButtonMinor), 
            Text = l_Name_0, 
            LayoutOrder = 3, 
            OnClick = v22.repopulateHistoryItem
        }), 
        DeleteButton = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.HistoryButtonMinor, 0, l_Sizes_0.HistoryButtonMinor), 
            Text = " \240\159\151\145", 
            LayoutOrder = 4, 
            OnClick = v22.deleteHistoryItem
        })
    });
end;
v16 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16);
return v2.connect(function(v30, _) --[[ Line: 92 ]]
    return {
        CurrentView = v30.Status.CurrentView
    };
end, function(v32) --[[ Line: 96 ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy), v14 (copy)
    return {
        RemoveHistoryItem = function(v33) --[[ Line: 98 ]] --[[ Name: RemoveHistoryItem ]]
            -- upvalues: v32 (copy), v11 (ref)
            v32(v11(v33));
        end, 
        SetMemStoragePair = function(v34) --[[ Line: 101 ]] --[[ Name: SetMemStoragePair ]]
            -- upvalues: v32 (copy), v12 (ref)
            v32(v12(v34));
        end, 
        SetRBXParameters = function(v35) --[[ Line: 104 ]] --[[ Name: SetRBXParameters ]]
            -- upvalues: v32 (copy), v13 (ref)
            v32(v13(v35));
        end, 
        SetView = function(v36) --[[ Line: 107 ]] --[[ Name: SetView ]]
            -- upvalues: v32 (copy), v14 (ref)
            v32(v14(v36));
        end
    };
end)(v16);