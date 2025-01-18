local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.SetRBXParameters);
local v12 = require(l_Actions_0.ClearRBXParameters);
local v13 = require(l_Actions_0.AddHistoryItem);
local v14 = require(l_Parent_0.Src.Util.Constants);
local l_INPUT_PANE_LAYOUT_0 = v14.INPUT_PANE_LAYOUT;
local l_RBXEVENT_ORDER_0 = v14.RBXEVENT_ORDER;
local l_RBXEvent_0 = v14.VIEW_ID.RBXEvent;
local l_Components_0 = l_Parent_0.Src.Components;
local v19 = require(l_Components_0.ButtonArray);
local v20 = require(l_Components_0.TextInput);
local l_Operations_0 = l_Parent_0.Src.Operations;
local v22 = require(l_Operations_0.RBXEventRequest);
local l_HttpService_0 = game:GetService("HttpService");
local v24 = v1.PureComponent:extend("RBXEventView");
v24.init = function(v25) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v22 (copy), v3 (copy), v1 (copy), l_TextLabel_0 (copy), l_RBXEVENT_ORDER_0 (copy), v19 (copy), v20 (copy)
    v25.state = {
        ValidJson = true
    };
    v25.IsCurrentJSONValid = function() --[[ Line: 55 ]]
        -- upvalues: l_HttpService_0 (ref), v25 (copy)
        local v26 = nil;
        if not pcall(function() --[[ Line: 57 ]]
            -- upvalues: v26 (ref), l_HttpService_0 (ref), v25 (ref)
            v26 = l_HttpService_0:JSONDecode(v25.props.Parameters.Detail);
        end) or not v26 then
            return false;
        else
            return true;
        end;
    end;
    v25.onClearClicked = function() --[[ Line: 68 ]]
        -- upvalues: v25 (copy)
        v25.props.ClearRBXParameters();
    end;
    v25.onSaveClicked = function() --[[ Line: 72 ]]
        -- upvalues: v25 (copy)
        v25.props.AddHistoryItem(v25.props.CurrentEventName, v25.props.Parameters);
    end;
    v25.onSendClicked = function() --[[ Line: 76 ]]
        -- upvalues: v25 (copy), v22 (ref)
        v25:setState({
            ValidJson = v25.IsCurrentJSONValid()
        });
        v22(v25.props.Parameters);
    end;
    v25.focusLost = function(v27, v28) --[[ Line: 85 ]]
        -- upvalues: v25 (copy), v3 (ref)
        v25.props.SetRBXParameters(v3.Dictionary.join(v25.props.Parameters, {
            [v27] = v28
        }));
    end;
    v25.createChildren = function() --[[ Line: 91 ]]
        -- upvalues: v25 (copy), v1 (ref), l_TextLabel_0 (ref), l_RBXEVENT_ORDER_0 (ref), v19 (ref), v20 (ref)
        local l_Parameters_0 = v25.props.Parameters;
        local v30 = {
            Warning = not v25.state.ValidJson and v1.createElement(l_TextLabel_0, {
                LayoutOrder = l_RBXEVENT_ORDER_0.Warning, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Style = "Warning"
            }), 
            Activators = v1.createElement(v19, {
                OnClearClicked = v25.onClearClicked, 
                OnSaveClicked = v25.onSaveClicked, 
                OnSendClicked = v25.onSendClicked
            })
        };
        for v31, v32 in pairs(l_Parameters_0) do
            v30[v31] = v1.createElement(v20, {
                LayoutOrder = l_RBXEVENT_ORDER_0[v31], 
                Label = v31, 
                Text = v32, 
                OnChange = function(...) --[[ Line: 115 ]] --[[ Name: OnChange ]]
                    -- upvalues: v25 (ref), v31 (copy)
                    v25.focusLost(v31, ...);
                end
            });
        end;
        return v30;
    end;
end;
v24.render = function(v33) --[[ Line: 125 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_INPUT_PANE_LAYOUT_0 (copy)
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.View
    }, v33.createChildren());
end;
v24 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v24);
return v2.connect(function(v34, _) --[[ Line: 136 ]]
    return {
        Parameters = v34.Status.Parameters, 
        CurrentEventName = v34.Status.CurrentEventName
    };
end, function(v36) --[[ Line: 141 ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy), l_RBXEvent_0 (copy)
    return {
        SetRBXParameters = function(v37) --[[ Line: 143 ]] --[[ Name: SetRBXParameters ]]
            -- upvalues: v36 (copy), v11 (ref)
            v36(v11(v37));
        end, 
        ClearRBXParameters = function() --[[ Line: 146 ]] --[[ Name: ClearRBXParameters ]]
            -- upvalues: v36 (copy), v12 (ref)
            v36(v12());
        end, 
        AddHistoryItem = function(v38, v39) --[[ Line: 149 ]] --[[ Name: AddHistoryItem ]]
            -- upvalues: v36 (copy), v13 (ref), l_RBXEvent_0 (ref)
            v36(v13(l_RBXEvent_0, v38, v39));
        end
    };
end)(v24);