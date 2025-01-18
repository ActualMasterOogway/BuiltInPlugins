local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextInput_0 = v3.UI.TextInput;
local v7 = require(l_Parent_0.ContextServices.WorldRootPhysics);
local v8 = require(l_Parent_0.Util.formatNumberForDisplay);
local v9 = require(l_Parent_0.Util.formatNumberForEngine);
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local v11 = require(l_RoactStudioWidgets_0.RadioButtonSet);
local v12 = require(l_RoactStudioWidgets_0.Text);
local v13 = v2.PureComponent:extend("JumpSelect");
v13.render = function(v14) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v11 (copy), l_TextInput_0 (copy), v9 (copy), v8 (copy), v12 (copy)
    local l_props_0 = v14.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_UseJumpPower_0 = l_props_0.UseJumpPower;
    local l_JumpPower_0 = l_props_0.JumpPower;
    local l_JumpHeight_0 = l_props_0.JumpHeight;
    local l_SetUseJumpPower_0 = l_props_0.SetUseJumpPower;
    local l_SetJumpPower_0 = l_props_0.SetJumpPower;
    local l_SetJumpHeight_0 = l_props_0.SetJumpHeight;
    local l_Localization_0 = l_props_0.Localization;
    local v24 = l_props_0.Mouse:get();
    local v25 = l_props_0.WorldRootPhysics:get();
    local v26 = UDim.new(0, 10);
    return v2.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 50), 
        BackgroundTransparency = 1
    }, {
        JumpSelect = v2.createElement(v11, {
            Title = l_Localization_0:getText("General", "TitleJump"), 
            Buttons = {
                {
                    Id = false, 
                    Title = l_Localization_0:getText("General", "JumpHeight")
                }, 
                {
                    Id = true, 
                    Title = l_Localization_0:getText("General", "JumpPower")
                }
            }, 
            Enabled = true, 
            Selected = l_UseJumpPower_0, 
            Mouse = v24, 
            SelectionChanged = function(v27) --[[ Line: 78 ]] --[[ Name: SelectionChanged ]]
                -- upvalues: l_SetUseJumpPower_0 (copy)
                l_SetUseJumpPower_0(v27.Id);
            end
        }), 
        JumpInput = v2.createElement("Frame", {
            Position = UDim2.new(0, 340, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = v26, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            JumpHeightInputBox = v2.createElement(l_TextInput_0, {
                Disabled = l_UseJumpPower_0, 
                LayoutOrder = 1, 
                OnFocusLost = function() --[[ Line: 95 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: l_JumpHeight_0 (copy), l_SetJumpHeight_0 (copy)
                    local v28 = math.clamp(l_JumpHeight_0, 0, 1e999);
                    l_SetJumpHeight_0(v28);
                end, 
                OnTextChanged = function(v29) --[[ Line: 99 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v9 (ref), l_SetJumpHeight_0 (copy)
                    v29 = tonumber((v9(v29))) or 0;
                    l_SetJumpHeight_0(v29);
                end, 
                Size = UDim2.fromOffset(150, 20), 
                Text = v8(l_JumpHeight_0)
            }), 
            JumpPowerInputBox = v2.createElement(l_TextInput_0, {
                Disabled = not l_UseJumpPower_0, 
                LayoutOrder = 2, 
                OnFocusLost = function() --[[ Line: 111 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: l_JumpPower_0 (copy), l_SetJumpPower_0 (copy)
                    local v30 = math.clamp(l_JumpPower_0, 0, 1000);
                    l_SetJumpPower_0(v30);
                end, 
                OnTextChanged = function(v31) --[[ Line: 115 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v9 (ref), l_SetJumpPower_0 (copy)
                    v31 = tonumber((v9(v31))) or 0;
                    l_SetJumpPower_0(v31);
                end, 
                Size = UDim2.new(0, 150, 0, 20), 
                Text = v8(l_JumpPower_0)
            })
        }), 
        MetricLabels = v2.createElement("Frame", {
            Position = UDim2.new(0, 510, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = v26, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            JumpHeightMetricLabel = v2.createElement(v12, {
                Enabled = not l_UseJumpPower_0, 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = l_Localization_0:getText("General", "UnitsMeters1", {
                    v8(v25.convertStudsToMeters(l_JumpHeight_0))
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    WorldRootPhysics = v7
})(v13));