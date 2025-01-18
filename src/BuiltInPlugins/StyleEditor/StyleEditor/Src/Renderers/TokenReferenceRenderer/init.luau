local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local l_useRef_0 = v1.useRef;
local l_useCallback_0 = v1.useCallback;
local v7 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v7.UI.Pane;
local l_TextInput_0 = v7.UI.TextInput;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local v11 = require(script.TokenAutocompleteItem);
local v12 = require(script.TokenTooltip);
local _ = require(script.Types);
local v14 = require(l_Parent_0.Src.Util.escapeStringPattern);
local v15 = require(l_Parent_0.Src.Util.TokenHelpers);
local v16 = require(l_Parent_0.Src.Enums.TokenValidationError);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
return function(v19) --[[ Line: 36 ]] --[[ Name: TokenReferenceRenderer ]]
    -- upvalues: l_useState_0 (copy), l_useRef_0 (copy), l_useMemo_0 (copy), v15 (copy), v16 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), v1 (copy), v11 (copy), l_collectArray_0 (copy), v14 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v12 (copy)
    local v20, v21 = l_useState_0(v19.Value);
    local v22 = l_useRef_0(nil);
    local v23 = l_useMemo_0(function() --[[ Line: 41 ]]
        -- upvalues: v15 (ref), v19 (copy)
        return v15.getAllAttributes(v19.Schema.Instance);
    end, {
        v19.Schema.Instance
    });
    local v24 = l_useMemo_0(function() --[[ Line: 44 ]]
        -- upvalues: v15 (ref), v19 (copy)
        return v15.getDerivedAttributes(v19.Schema.Instance);
    end, {
        v19.Schema.Instance
    });
    local v28 = l_useMemo_0(function() --[[ Line: 48 ]]
        -- upvalues: v15 (ref), v23 (copy), v20 (copy), v19 (copy), v16 (ref)
        local v25, v26 = v15.validateToken(v23, v20, v19.Schema.ExpectedTypes);
        local v27 = nil;
        if v26 == v16.None then
            v27 = v15.getTokenSourceStyleSheet(v19.Schema.Instance, v20);
        end;
        return {
            Name = v20, 
            Value = v25, 
            Error = v26, 
            Source = v27, 
            ExpectedTypes = v19.Schema.ExpectedTypes
        };
    end, {
        v20, 
        v19.Schema.Instance, 
        v19.Schema.ExpectedTypes, 
        v23
    });
    local v30 = l_useCallback_0(function(v29) --[[ Line: 65 ]]
        -- upvalues: v21 (copy)
        v21(v29);
    end, {
        v21
    });
    l_useEffect_0(function() --[[ Line: 69 ]]
        -- upvalues: v30 (copy), v19 (copy)
        v30(v19.Value);
    end, {
        v19.Value, 
        v30
    });
    local function v33(v31, _) --[[ Line: 73 ]]
        -- upvalues: v19 (copy), v21 (copy)
        if v31 == v19.Value then
            return;
        else
            v21(v31);
            v19.OnChanged(v31);
            return;
        end;
    end;
    local function v38(v34, v35, v36, _) --[[ Line: 82 ]] --[[ Name: onRenderAutocompleteItem ]]
        -- upvalues: v1 (ref), v11 (ref), v19 (copy)
        return v1.createElement(v11, {
            TokenInfo = v34.TokenInfo, 
            OnActivated = v36, 
            ErrorStyle = v19.Schema.ErrorStyle, 
            LayoutOrder = v35
        });
    end;
    local v49 = l_useCallback_0(function(v39) --[[ Line: 96 ]]
        -- upvalues: v19 (copy), v15 (ref), v24 (copy), v23 (copy), l_collectArray_0 (ref), v14 (ref), v16 (ref)
        if not v19.Schema.Instance then
            return {};
        else
            local v40 = (v15.parseAttributeName(v39) or v39):lower();
            local v41 = if v19.Schema.HideSelfTokens then v24 else v23;
            local v42 = v15.stripStyleEditorMetaAttributes(v41);
            return l_collectArray_0(v42, function(v43, _) --[[ Line: 106 ]]
                -- upvalues: v14 (ref), v40 (copy), v15 (ref), v41 (copy), v19 (ref), v16 (ref)
                if not v43:lower():find(v14(v40)) then
                    return nil;
                else
                    local v45 = "$" .. v43;
                    local v46, v47 = v15.validateToken(v41, v45, v19.Schema.ExpectedTypes);
                    if v47 ~= v16.None then
                        return nil;
                    else
                        local v48 = v15.getTokenSourceStyleSheet(v19.Schema.Instance, v45);
                        return {
                            Id = v45, 
                            Value = v45, 
                            TokenInfo = {
                                Name = v45, 
                                Value = v46, 
                                Error = v47, 
                                Source = v48, 
                                ExpectedTypes = v19.Schema.ExpectedTypes
                            }
                        };
                    end;
                end;
            end);
        end;
    end, {
        v19.Schema, 
        v19.Schema.ExpectedTypes
    });
    local v50 = v28.Error ~= v16.None;
    return v1.createElement(l_Pane_0, {}, {
        Input = v1.createElement(l_TextInput_0, {
            GetAutocompleteItems = v49, 
            OnRenderAutocompleteItem = v38, 
            Disabled = v19.Disabled, 
            OnTextChanged = v30, 
            OnFocusLost = v33, 
            Size = if v19.AutomaticSize then UDim2.new(1, 0, 0, v19.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
            Text = v20, 
            ForwardRef = v22, 
            [v1.Tag] = if v50 then v19.Schema.ErrorStyle else nil
        }), 
        Tooltip = v1.createElement(v12, {
            TokenInfo = v28, 
            ErrorStyle = v19.Schema.ErrorStyle
        })
    });
end;