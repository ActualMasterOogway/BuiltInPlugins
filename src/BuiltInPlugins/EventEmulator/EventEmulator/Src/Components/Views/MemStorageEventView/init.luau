local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local v7 = require(l_Components_0.ButtonArray);
local v8 = require(l_Components_0.TextInput);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v10 = require(l_Actions_0.SetMemStoragePair);
local v11 = require(l_Actions_0.AddHistoryItem);
local v12 = require(l_Parent_0.Src.Util.Constants);
local l_MEM_STORAGE_ORDER_0 = v12.MEM_STORAGE_ORDER;
local l_INPUT_PANE_LAYOUT_0 = v12.INPUT_PANE_LAYOUT;
local l_MemStorage_0 = v12.ROUTES.MemStorage;
local l_OPERATION_SUCCESSFUL_0 = v12.OPERATION_SUCCESSFUL;
local l_MemStorage_1 = v12.VIEW_ID.MemStorage;
local l_UI_0 = v3.UI;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_Pane_0 = l_UI_0.Pane;
local l_Operations_0 = l_Parent_0.Src.Operations;
local v22 = require(l_Operations_0.MemStorageEventRequest);
local v23 = v1.PureComponent:extend("MemStorageEventView");
v23.init = function(v24) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: l_MemStorage_0 (copy), v22 (copy), l_OPERATION_SUCCESSFUL_0 (copy)
    v24.state = {
        SelectedRoute = l_MemStorage_0.GetValue
    };
    v24.createRoutes = function() --[[ Line: 52 ]]
        -- upvalues: l_MemStorage_0 (ref)
        local v25 = {};
        for _, v27 in pairs(l_MemStorage_0) do
            table.insert(v25, {
                Key = v27, 
                Text = v27
            });
        end;
        return v25;
    end;
    v24.Router = function(v28) --[[ Line: 65 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            SelectedRoute = v28
        });
    end;
    v24.OnChange = function(v29, v30) --[[ Line: 71 ]]
        -- upvalues: v24 (copy)
        v24.props.SetMemStoragePair({
            [v29] = v30
        });
    end;
    local v31 = {
        Key = "", 
        Value = ""
    };
    v24.onClearClicked = function() --[[ Line: 82 ]]
        -- upvalues: v24 (copy), v31 (copy)
        v24.props.SetMemStoragePair(v31);
    end;
    v24.onSaveClicked = function() --[[ Line: 86 ]]
        -- upvalues: v24 (copy)
        v24.props.AddHistoryItem(v24.props.CurrentEventName, v24.props.KeyValuePair);
    end;
    v24.onSendClicked = function() --[[ Line: 90 ]]
        -- upvalues: v24 (copy), l_MemStorage_0 (ref), v22 (ref), l_OPERATION_SUCCESSFUL_0 (ref)
        local l_Key_0 = v24.props.KeyValuePair.Key;
        local l_Value_0 = v24.props.KeyValuePair.Value;
        local v34 = v24.state.SelectedRoute or "";
        if v34 == l_MemStorage_0.GetValue then
            v22.GetValue(l_Key_0);
        end;
        if v34 == l_MemStorage_0.SetValue and v22.SetValue(l_Key_0, l_Value_0) then
            print(l_OPERATION_SUCCESSFUL_0);
        end;
        if v34 == l_MemStorage_0.NewEntry and v22.SetValue(l_Key_0, l_Value_0) then
            print(l_OPERATION_SUCCESSFUL_0);
        end;
    end;
end;
v23.render = function(v35) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_INPUT_PANE_LAYOUT_0 (copy), l_RadioButtonList_0 (copy), l_MemStorage_0 (copy), l_MEM_STORAGE_ORDER_0 (copy), v8 (copy), v7 (copy)
    local l_props_0 = v35.props;
    local l_KeyValuePair_0 = l_props_0.KeyValuePair;
    local l_Layout_0 = l_props_0.Stylizer.Layout;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.View
    }, {
        Layout = v1.createElement("UIListLayout", l_Layout_0.Vertical), 
        Switch = v1.createElement(l_RadioButtonList_0, {
            Buttons = v35.createRoutes(), 
            OnClick = v35.Router, 
            SelectedKey = l_MemStorage_0.GetValue, 
            LayoutOrder = l_MEM_STORAGE_ORDER_0.Switch
        }), 
        Key = v1.createElement(v8, {
            LayoutOrder = l_MEM_STORAGE_ORDER_0.Key, 
            Label = "Key", 
            Text = l_KeyValuePair_0.Key, 
            OnChange = function(...) --[[ Line: 135 ]] --[[ Name: OnChange ]]
                -- upvalues: v35 (copy)
                v35.OnChange("Key", ...);
            end
        }), 
        Value = v1.createElement(v8, {
            LayoutOrder = l_MEM_STORAGE_ORDER_0.Value, 
            Label = "Value", 
            Text = l_KeyValuePair_0.Value, 
            OnChange = function(...) --[[ Line: 143 ]] --[[ Name: OnChange ]]
                -- upvalues: v35 (copy)
                v35.OnChange("Value", ...);
            end
        }), 
        Activators = v1.createElement(v7, {
            OnClearClicked = v35.onClearClicked, 
            OnSaveClicked = v35.onSaveClicked, 
            OnSendClicked = v35.onSendClicked
        })
    });
end;
v23 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v23);
return v2.connect(function(v39, _) --[[ Line: 159 ]]
    return {
        KeyValuePair = v39.Status.MemStoragePair, 
        CurrentEventName = v39.Status.CurrentEventName
    };
end, function(v41) --[[ Line: 164 ]]
    -- upvalues: v10 (copy), v11 (copy), l_MemStorage_1 (copy)
    return {
        SetMemStoragePair = function(v42) --[[ Line: 166 ]] --[[ Name: SetMemStoragePair ]]
            -- upvalues: v41 (copy), v10 (ref)
            v41(v10(v42));
        end, 
        AddHistoryItem = function(v43, v44) --[[ Line: 169 ]] --[[ Name: AddHistoryItem ]]
            -- upvalues: v41 (copy), v11 (ref), l_MemStorage_1 (ref)
            v41(v11(l_MemStorage_1, v43, v44));
        end
    };
end)(v23);