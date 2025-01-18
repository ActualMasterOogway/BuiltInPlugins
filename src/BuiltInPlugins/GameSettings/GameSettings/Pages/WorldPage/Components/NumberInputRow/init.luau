local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_GameSettingsFixNumberInputRow_0 = game:GetFastFlag("GameSettingsFixNumberInputRow");
local v4 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v11 = require(l_Parent_0.ContextServices.WorldRootPhysics);
local v12 = require(l_Parent_0.Util.formatNumberForDisplay);
local v13 = require(l_Parent_0.Util.formatNumberForEngine);
local v14 = v2.PureComponent:extend("NumberInputRow");
v14.init = function(v15) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettingsFixNumberInputRow_0 (copy), v13 (copy)
    v15.onFocusLost = function() --[[ Line: 45 ]]
        -- upvalues: v15 (copy)
        local l_props_0 = v15.props;
        v15:onTextChanged(l_props_0.Value);
    end;
    v15.onTextChanged = function(v17) --[[ Line: 49 ]]
        -- upvalues: v15 (copy), l_GameSettingsFixNumberInputRow_0 (ref), v13 (ref)
        local l_props_1 = v15.props;
        local v19 = l_props_1.MinValue or -1e999;
        local v20 = l_props_1.MaxValue or 1e999;
        if l_GameSettingsFixNumberInputRow_0 then
            local v21 = nil;
            if typeof(v17) == "string" then
                v21 = tonumber((v13(v17)));
            end;
            if v21 then
                local v22 = math.clamp(v21, v19, v20);
                v15.props.OnUpdate(v22);
                return;
            end;
        else
            local v23 = math.clamp(l_props_1.Value, v19, v20);
            v15.props.OnUpdate(v23);
        end;
    end;
    v15.onValidateText = function(v24) --[[ Line: 70 ]]
        -- upvalues: v13 (ref), v15 (copy)
        local v25 = v13(v24);
        local v26 = true;
        if v25 ~= "" then
            v26 = tonumber(v25) ~= nil;
        end;
        local v27 = nil;
        if not v26 then
            v27 = v15.props.Localization:getText("General", "NumberError");
        end;
        return v26, v27;
    end;
end;
v14.render = function(v28) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_TitledFrame_0 (copy), l_TextLabel_0 (copy), l_TextInput_0 (copy), v12 (copy)
    local l_props_2 = v28.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Title_0 = l_props_2.Title;
    local l_Label_0 = l_props_2.Label;
    local l_Value_0 = l_props_2.Value;
    local l_UnitsFormatFunction_0 = l_props_2.UnitsFormatFunction;
    local v35 = l_props_2.WorldRootPhysics:get();
    return v2.createElement(l_TitledFrame_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Title_0
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Style = "Normal", 
            Text = l_Label_0
        }), 
        InputBox = v2.createElement(l_TextInput_0, {
            OnFocusLost = v28.onFocusLost, 
            OnTextChanged = v28.onTextChanged, 
            OnValidateText = v28.onValidateText, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 160, 0, 0), 
            Width = 150, 
            Text = v12(l_Value_0)
        }), 
        MetricLabel = l_UnitsFormatFunction_0 and v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 3, 
            Style = "SubText", 
            Text = l_UnitsFormatFunction_0(v35.convertStudsToMeters(l_Value_0))
        })
    });
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    Localization = l_ContextServices_0.Localization, 
    WorldRootPhysics = v11
})(v14));