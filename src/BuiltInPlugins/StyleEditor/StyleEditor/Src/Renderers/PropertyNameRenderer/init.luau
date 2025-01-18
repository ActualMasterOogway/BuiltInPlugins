local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local v4 = require(l_Parent_0.Packages.Framework);
local l_Tooltip_0 = v4.UI.Tooltip;
local l_Pane_0 = v4.UI.Pane;
local l_TextInput_0 = v4.UI.TextInput;
local v8 = require(l_Parent_0.Packages.Dash);
local l_filter_0 = v8.filter;
local l_keys_0 = v8.keys;
local v11 = require(script.localizePropertyNameError);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local v13 = require(l_Parent_0.Src.Util.getAutocompleteItems);
local v14 = require(l_Parent_0.Src.Enums.PropertyNameValidationError);
local v15 = require(l_Parent_0.Src.Util.StyleSchema);
local v16 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("TooltipMaxWidth");
local _ = require(l_Parent_0.Src.Types);
local _ = function(v19, v20) --[[ Line: 37 ]] --[[ Name: propertyExistsOnAnyClass ]]
    -- upvalues: v15 (copy)
    for _, v22 in v19 do
        if v15.allProperties[v22][v20] ~= nil then
            return true;
        end;
    end;
    return false;
end;
return function(v24) --[[ Line: 49 ]] --[[ Name: PropertyNameRenderer ]]
    -- upvalues: v16 (copy), v1 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_useState_0 (copy), v14 (copy), v15 (copy), l_useEffect_0 (copy), l_keys_0 (copy), l_filter_0 (copy), v13 (copy), v11 (copy), l_Tooltip_0 (copy), l_Attribute_0 (copy)
    local l_StyleRuleInfo_0 = v24.Schema.StyleRuleInfo;
    local l_Localization_0 = v16().Localization;
    if not l_StyleRuleInfo_0 then
        return v1.createElement(l_Pane_0, {}, {
            Input = v1.createElement(l_TextInput_0, {
                Disabled = true, 
                Size = if v24.AutomaticSize then UDim2.new(1, 0, 0, v24.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
                Text = v24.Value, 
                PlaceholderText = l_Localization_0:getText("Table", "PropertyNamePlaceholder"), 
                [v1.Tag] = "PropertyCellDisabled"
            })
        });
    else
        assert(l_StyleRuleInfo_0 ~= nil, "expecting valid StyleRuleInfo");
        local v27, v28 = l_useState_0({
            text = v24.Value, 
            error = v14.None
        });
        local _ = function(v29) --[[ Line: 75 ]] --[[ Name: validate ]]
            -- upvalues: l_StyleRuleInfo_0 (copy), v15 (ref), v14 (ref), v24 (copy)
            local v30 = false;
            if l_StyleRuleInfo_0.CanMatchAnyClass then
                if v15.possiblePropertyTypes[v29] == nil then
                    return v14.DoesNotExist;
                end;
            else
                local v31;
                for _, v33 in l_StyleRuleInfo_0.PossibleClasses do
                    if v15.allProperties[v33][v29] ~= nil then
                        v31 = true;
                        v30 = true;
                    end;
                    if v30 then
                        break;
                    end;
                end;
                if not v30 then
                    v31 = false;
                end;
                v30 = false;
                if not v31 then
                    return v14.DoesNotExistOnType;
                end;
            end;
            local v34 = v24.Value ~= v29;
            local v35 = false;
            if l_StyleRuleInfo_0.Properties[v29] ~= nil then
                v35 = v34;
            end;
            if v35 then
                return v14.AlreadyDefined;
            else
                return v14.None;
            end;
        end;
        local _ = function(v37) --[[ Line: 95 ]] --[[ Name: setCurrentText ]]
            -- upvalues: l_StyleRuleInfo_0 (copy), v15 (ref), v14 (ref), v24 (copy), v28 (copy)
            local v38 = false;
            local v39 = false;
            local v40, v41, v42;
            if l_StyleRuleInfo_0.CanMatchAnyClass then
                if v15.possiblePropertyTypes[v37] == nil then
                    v42 = v14.DoesNotExist;
                    v38 = true;
                end;
            else
                for _, v44 in l_StyleRuleInfo_0.PossibleClasses do
                    if v15.allProperties[v44][v37] ~= nil then
                        v40 = true;
                        v39 = true;
                    end;
                    if v39 then
                        break;
                    end;
                end;
                if not v39 then
                    v40 = false;
                end;
                v39 = false;
                if not v40 then
                    v42 = v14.DoesNotExistOnType;
                    v38 = true;
                end;
            end;
            if not v38 then
                if not v38 then
                    v40 = v24.Value ~= v37;
                    v41 = false;
                    if l_StyleRuleInfo_0.Properties[v37] ~= nil then
                        v41 = v40;
                    end;
                    v42 = if v41 then v14.AlreadyDefined else v14.None;
                end;
            end;
            v38 = false;
            v28({
                text = v37, 
                error = v42
            });
        end;
        local function v54(v46) --[[ Line: 104 ]]
            -- upvalues: l_StyleRuleInfo_0 (copy), v15 (ref), v14 (ref), v24 (copy), v28 (copy)
            local v47 = false;
            local v48 = false;
            local v49, v50, v51;
            if l_StyleRuleInfo_0.CanMatchAnyClass then
                if v15.possiblePropertyTypes[v46] == nil then
                    v51 = v14.DoesNotExist;
                    v47 = true;
                end;
            else
                for _, v53 in l_StyleRuleInfo_0.PossibleClasses do
                    if v15.allProperties[v53][v46] ~= nil then
                        v49 = true;
                        v48 = true;
                    end;
                    if v48 then
                        break;
                    end;
                end;
                if not v48 then
                    v49 = false;
                end;
                v48 = false;
                if not v49 then
                    v51 = v14.DoesNotExistOnType;
                    v47 = true;
                end;
            end;
            if not v47 then
                if not v47 then
                    v49 = v24.Value ~= v46;
                    v50 = false;
                    if l_StyleRuleInfo_0.Properties[v46] ~= nil then
                        v50 = v49;
                    end;
                    v51 = if v50 then v14.AlreadyDefined else v14.None;
                end;
            end;
            v47 = false;
            v28({
                text = v46, 
                error = v51
            });
        end;
        local function v70(v55, _) --[[ Line: 108 ]]
            -- upvalues: l_StyleRuleInfo_0 (copy), v15 (ref), v14 (ref), v24 (copy), v28 (copy)
            local v57 = false;
            local v58 = false;
            local v59 = false;
            local v60 = false;
            local v61, v62, v63;
            if l_StyleRuleInfo_0.CanMatchAnyClass then
                if v15.possiblePropertyTypes[v55] == nil then
                    v63 = v14.DoesNotExist;
                    v57 = true;
                end;
            else
                for _, v65 in l_StyleRuleInfo_0.PossibleClasses do
                    if v15.allProperties[v65][v55] ~= nil then
                        v61 = true;
                        v58 = true;
                    end;
                    if v58 then
                        break;
                    end;
                end;
                if not v58 then
                    v61 = false;
                end;
                v58 = false;
                if not v61 then
                    v63 = v14.DoesNotExistOnType;
                    v57 = true;
                end;
            end;
            if not v57 then
                if not v57 then
                    v61 = v24.Value ~= v55;
                    v62 = false;
                    if l_StyleRuleInfo_0.Properties[v55] ~= nil then
                        v62 = v61;
                    end;
                    v63 = if v62 then v14.AlreadyDefined else v14.None;
                end;
            end;
            v57 = false;
            if v63 == v14.None and v24.Value ~= v55 then
                v24.OnChanged(v55);
                return;
            else
                v61 = v24.Value;
                local v66, v67;
                if l_StyleRuleInfo_0.CanMatchAnyClass then
                    if v15.possiblePropertyTypes[v61] == nil then
                        v62 = v14.DoesNotExist;
                        v59 = true;
                    end;
                else
                    for _, v69 in l_StyleRuleInfo_0.PossibleClasses do
                        if v15.allProperties[v69][v61] ~= nil then
                            v66 = true;
                            v60 = true;
                        end;
                        if v60 then
                            break;
                        end;
                    end;
                    if not v60 then
                        v66 = false;
                    end;
                    v60 = false;
                    if not v66 then
                        v62 = v14.DoesNotExistOnType;
                        v59 = true;
                    end;
                end;
                if not v59 then
                    if not v59 then
                        v66 = v24.Value ~= v61;
                        v67 = false;
                        if l_StyleRuleInfo_0.Properties[v61] ~= nil then
                            v67 = v66;
                        end;
                        v62 = if v67 then v14.AlreadyDefined else v14.None;
                    end;
                end;
                v59 = false;
                v28({
                    text = v61, 
                    error = v62
                });
                return;
            end;
        end;
        l_useEffect_0(function() --[[ Line: 118 ]]
            -- upvalues: v24 (copy), l_StyleRuleInfo_0 (copy), v15 (ref), v14 (ref), v28 (copy)
            local v71 = false;
            local v72 = false;
            local l_Value_0 = v24.Value;
            local v74, v75, v76;
            if l_StyleRuleInfo_0.CanMatchAnyClass then
                if v15.possiblePropertyTypes[l_Value_0] == nil then
                    v76 = v14.DoesNotExist;
                    v71 = true;
                end;
            else
                for _, v78 in l_StyleRuleInfo_0.PossibleClasses do
                    if v15.allProperties[v78][l_Value_0] ~= nil then
                        v74 = true;
                        v72 = true;
                    end;
                    if v72 then
                        break;
                    end;
                end;
                if not v72 then
                    v74 = false;
                end;
                v72 = false;
                if not v74 then
                    v76 = v14.DoesNotExistOnType;
                    v71 = true;
                end;
            end;
            if not v71 then
                if not v71 then
                    v74 = v24.Value ~= l_Value_0;
                    v75 = false;
                    if l_StyleRuleInfo_0.Properties[l_Value_0] ~= nil then
                        v75 = v74;
                    end;
                    v76 = if v75 then v14.AlreadyDefined else v14.None;
                end;
            end;
            v71 = false;
            v28({
                text = l_Value_0, 
                error = v76
            });
        end, {
            v24.Schema, 
            v24.Value
        });
        local function v90(v79) --[[ Line: 122 ]] --[[ Name: getAutocompleteItems ]]
            -- upvalues: l_StyleRuleInfo_0 (copy), v15 (ref), l_keys_0 (ref), l_filter_0 (ref), v24 (copy), v13 (ref)
            local v80 = {};
            if l_StyleRuleInfo_0.CanMatchAnyClass then
                v80 = v15.getPropertyNames("");
            else
                local v81 = {};
                for _, v83 in l_StyleRuleInfo_0.PossibleClasses do
                    for _, v85 in v15.getPropertyNames(v83) do
                        v81[v85] = true;
                    end;
                end;
                v80 = l_keys_0(v81);
            end;
            local v89 = l_filter_0(v80, function(v86, _) --[[ Line: 140 ]]
                -- upvalues: v24 (ref), l_StyleRuleInfo_0 (ref)
                local v88 = true;
                if v86 ~= v24.Value then
                    v88 = l_StyleRuleInfo_0.Properties[v86] == nil;
                end;
                return v88;
            end);
            return v13(v89, v79);
        end;
        local v91 = v15.getPossiblePropertyTypes(v27.text);
        local v92 = {};
        if #v91 > 0 then
            table.insert(v92, table.concat(v91, ", "));
        end;
        if not l_StyleRuleInfo_0.CanMatchAnyClass then
            local v94 = l_filter_0(l_StyleRuleInfo_0.PossibleClasses, function(v93) --[[ Line: 155 ]]
                -- upvalues: v15 (ref), v24 (copy)
                return v15.getPropertySchema(v24.Value, v93) ~= nil;
            end);
            table.insert(v92, l_Localization_0:getText("Label", "PropertyAppliesTo", {
                classList = table.concat(v94, ", ")
            }));
        end;
        local v95 = v27.error ~= v14.None;
        local v96 = v11(l_Localization_0, v27.error, {
            type = table.concat(l_StyleRuleInfo_0.PossibleClasses, ", ")
        });
        local l_createElement_0 = v1.createElement;
        local l_l_Pane_0_0 = l_Pane_0;
        local v99 = {};
        local v100 = {
            Input = v1.createElement(l_TextInput_0, {
                Disabled = v24.Disabled, 
                OnTextChanged = v54, 
                OnFocusLost = v70, 
                Size = if v24.AutomaticSize then UDim2.new(1, 0, 0, v24.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
                Text = v27.text, 
                GetAutocompleteItems = v90, 
                PlaceholderText = l_Localization_0:getText("Table", "PropertyNamePlaceholder"), 
                [v1.Tag] = if v95 then v24.Schema.ErrorStyle or "PropertyCellError" else nil
            })
        };
        local v101 = false;
        if #v27.text > 0 then
            v101 = v1.createElement(l_Tooltip_0, {
                Text = if v95 then v96 else table.concat(v92, "\n"), 
                MaxWidth = l_Attribute_0
            });
        end;
        v100.Tooltip = v101;
        return l_createElement_0(l_l_Pane_0_0, v99, v100);
    end;
end;