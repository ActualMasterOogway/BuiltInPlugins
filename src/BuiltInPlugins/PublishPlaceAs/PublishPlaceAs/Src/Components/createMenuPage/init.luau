local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local v8 = require(l_Parent_0.Src.Actions.AddChange);
return function(v9, v10) --[[ Line: 43 ]]
    -- upvalues: v1 (copy), l_StyleModifier_0 (copy), v3 (copy), l_withContext_0 (copy), l_ContextServices_0 (copy), v8 (copy), v2 (copy)
    local v11 = v1.PureComponent:extend("Page");
    v11.init = function(v12) --[[ Line: 46 ]] --[[ Name: init ]]
        -- upvalues: l_StyleModifier_0 (ref), v1 (ref)
        v12.state = {
            StyleModifier = nil, 
            showDialog = false
        };
        v12.onMouseEnter = function() --[[ Line: 52 ]]
            -- upvalues: v12 (copy), l_StyleModifier_0 (ref)
            if v12.state.StyleModifier == nil then
                v12:setState({
                    StyleModifier = l_StyleModifier_0.Hover
                });
            end;
        end;
        v12.onMouseLeave = function() --[[ Line: 60 ]]
            -- upvalues: v12 (copy), l_StyleModifier_0 (ref), v1 (ref)
            if v12.state.StyleModifier == l_StyleModifier_0.Hover then
                v12:setState({
                    StyleModifier = v1.None
                });
            end;
        end;
    end;
    v11.didMount = function(v13) --[[ Line: 69 ]] --[[ Name: didMount ]]
        if v13.props.GetPlayerAcceptances then
            local v14 = v13.props.API:get();
            v13.props.GetPlayerAcceptances(v14);
        end;
    end;
    v11.render = function(v15) --[[ Line: 76 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref), v3 (ref)
        local l_props_0 = v15.props;
        local v17 = l_props_0.Content and l_props_0.Content(v15) or {};
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local l_AddLayout_0 = l_props_0.AddLayout;
        local l_ContentHeightChanged_0 = l_props_0.ContentHeightChanged;
        return v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = l_LayoutOrder_0
        }, v3.Dictionary.join(v17, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            Layout = l_AddLayout_0 and v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 15), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                [v1.Change.AbsoluteContentSize] = function(v21) --[[ Line: 101 ]]
                    -- upvalues: l_ContentHeightChanged_0 (copy)
                    if l_ContentHeightChanged_0 then
                        l_ContentHeightChanged_0(v21.AbsoluteContentSize.y);
                    end;
                end
            })
        }));
    end;
    v11 = l_withContext_0({
        Stylizer = l_ContextServices_0.Stylizer, 
        Localization = l_ContextServices_0.Localization, 
        Mouse = l_ContextServices_0.Mouse, 
        API = l_ContextServices_0.API
    })(v11);
    local function v25(v22, _) --[[ Line: 118 ]] --[[ Name: mapStateToProps ]]
        -- upvalues: v9 (copy)
        if not v9 then
            return;
        else
            return v9(function(v24) --[[ Line: 122 ]]
                -- upvalues: v22 (copy)
                if v22.NewGameSettings.changed[v24] ~= nil then
                    return v22.NewGameSettings.changed[v24];
                else
                    return v22.NewGameSettings.current[v24];
                end;
            end, v22);
        end;
    end;
    local function v29(v26) --[[ Line: 132 ]] --[[ Name: useDispatchForProps ]]
        -- upvalues: v10 (copy), v8 (ref)
        if not v10 then
            return;
        else
            return v10(function(v27) --[[ Line: 136 ]]
                -- upvalues: v26 (copy), v8 (ref)
                return function(v28) --[[ Line: 137 ]]
                    -- upvalues: v26 (ref), v8 (ref), v27 (copy)
                    v26(v8(v27, v28));
                end;
            end, v26);
        end;
    end;
    return v2.connect(v25, v29)(v11);
end;