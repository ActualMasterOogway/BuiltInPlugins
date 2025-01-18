local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_TextLabel_0 = v3.UI.TextLabel;
local l_Tooltip_0 = v3.UI.Tooltip;
local l_joinTags_0 = v3.Styling.joinTags;
local v8 = require(l_Parent_0.Src.Hooks.useLayoutOrderCounter);
local v9 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local v10 = require(l_Parent_0.Src.Enums.TokenValidationError);
local v11 = require(l_Parent_0.Src.Resources.PluginStyles);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v13 = require(script.Parent.TokenSourceLink);
local v14 = require(script.Parent.TokenValuePreview);
local _ = require(script.Parent.Types);
local v16 = Vector2.new(350, 60);
local l_v11_Attribute_0 = v11:GetAttribute("TokenTooltipRowHeight");
local v18 = {
    [v10.IncorrectType] = "TokenErrorIncorrectType", 
    [v10.DoesNotExist] = "TokenErrorDoesNotExist", 
    [v10.InvalidSyntax] = "TokenErrorInvalidSyntax", 
    [v10.CyclicReference] = "TokenErrorCyclicReference", 
    Unknown = "ErrorUnknown"
};
return function(v19) --[[ Line: 44 ]] --[[ Name: TokenTooltip ]]
    -- upvalues: l_useState_0 (copy), v16 (copy), v8 (copy), v9 (copy), v10 (copy), v18 (copy), v1 (copy), l_TextLabel_0 (copy), l_v11_Attribute_0 (copy), l_joinTags_0 (copy), v14 (copy), l_Pane_0 (copy), v13 (copy), l_Tooltip_0 (copy)
    local v20, v21 = l_useState_0(v16);
    local v22 = v8();
    local l_Localization_0 = v9().Localization;
    local v24 = {};
    if v19.TokenInfo.Error ~= v10.None then
        local v25 = l_Localization_0:getText("Label", v18[v19.TokenInfo.Error] or v18.Unknown, {
            expectedType = if v19.TokenInfo.ExpectedTypes then table.concat(v19.TokenInfo.ExpectedTypes, ", ") else nil, 
            actualType = typeof(v19.TokenInfo.Value)
        });
        v24 = {
            ErrorLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v22(), 
                Size = UDim2.fromOffset(0, l_v11_Attribute_0), 
                Text = v25, 
                [v1.Tag] = l_joinTags_0("X-FitX", v19.ErrorStyle)
            })
        };
    else
        v24 = {
            ValuePreview = v1.createElement(v14, {
                LayoutOrder = v22(), 
                TokenValue = v19.TokenInfo.Value
            }), 
            TypeLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v22(), 
                Size = UDim2.fromOffset(0, l_v11_Attribute_0), 
                Text = string.format("%s", (typeof(v19.TokenInfo.Value))), 
                [v1.Tag] = "X-FitX"
            }), 
            SourceContainer = v19.TokenInfo.Source and v1.createElement(l_Pane_0, {
                LayoutOrder = v22(), 
                [v1.Tag] = "X-Fit X-Row"
            }, {
                LeadingLabel = v1.createElement(l_TextLabel_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(0, l_v11_Attribute_0), 
                    Text = l_Localization_0:getText("Label", "TokenDefinedIn"), 
                    [v1.Tag] = "X-FitX"
                }), 
                SourceLink = v1.createElement(v13, {
                    Source = v19.TokenInfo.Source, 
                    LayoutOrder = 2
                })
            })
        };
    end;
    return v1.createElement(l_Tooltip_0, {
        Content = v1.createElement(l_Pane_0, {
            [v1.Tag] = "X-Column X-Fit", 
            [v1.Change.AbsoluteSize] = function(v26) --[[ Line: 109 ]]
                -- upvalues: v21 (copy)
                if not v26 then
                    return;
                else
                    v21(v26.AbsoluteSize);
                    return;
                end;
            end
        }, v24), 
        ContentExtents = v20
    });
end;