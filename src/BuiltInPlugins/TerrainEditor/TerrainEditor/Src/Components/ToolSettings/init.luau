local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useForm);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Components.ProgressDialog);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Renderers);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_deepEqual_0 = v2.Util.deepEqual;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local l_UI_0 = v2.UI;
local l_Form_0 = l_UI_0.Form;
local l_Pane_0 = l_UI_0.Pane;
return function(v16) --[[ Line: 33 ]]
    -- upvalues: l_Stylizer_0 (copy), l_useState_0 (copy), v8 (copy), v4 (copy), v5 (copy), v1 (copy), l_Pane_0 (copy), l_Form_0 (copy), v12 (copy), l_deepEqual_0 (copy), v7 (copy), v6 (copy)
    local l_LayoutOrder_0 = v16.LayoutOrder;
    local l_Size_0 = v16.Size;
    local v19 = l_Stylizer_0:use("ToolSettings");
    local v20, v21 = l_useState_0({});
    local v22 = v8:use();
    local v23, v24 = v4(v22);
    local v25 = v5(v22);
    return v1.createElement(l_Pane_0, {
        BackgroundColor = v19.BackgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0
    }, {
        Form = v1.createElement(l_Form_0, {
            Expansion = v20, 
            ExpandByDefault = true, 
            Items = v23, 
            LabelHeight = 20, 
            OnChange = function(v26) --[[ Line: 53 ]] --[[ Name: OnChange ]]
                -- upvalues: v12 (ref), l_deepEqual_0 (ref), v23 (copy), v24 (copy)
                if v12() then
                    local v27 = {};
                    local function v28(v29, v30) --[[ Line: 57 ]] --[[ Name: checkChildren ]]
                        -- upvalues: l_deepEqual_0 (ref), v28 (copy)
                        local v31 = {};
                        for v32, v33 in v29 do
                            if not if typeof(v33.Value) == "table" then l_deepEqual_0(v33.Value, v30[v32].Value) else v33.Value == v30[v32].Value then
                                if v33.Children and not l_deepEqual_0(v33.Children, v30[v32].Children) then
                                    v31[v33.DataId or v33.Id] = {
                                        Children = v28(v33.Children, v30[v32].Children), 
                                        Value = v33.Value
                                    };
                                elseif v33.Children then
                                    v31[v33.DataId or v33.Id] = {
                                        Value = v33.Value
                                    };
                                else
                                    v31[v33.DataId or v33.Id] = v33.Value;
                                end;
                            elseif v33.Children and not l_deepEqual_0(v33.Children, v30[v32].Children) then
                                v31[v33.DataId or v33.Id] = {
                                    Children = v28(v33.Children, v30[v32].Children)
                                };
                            end;
                        end;
                        return v31;
                    end;
                    for v34, v35 in v26 do
                        v27[v35.Id] = v28(v35.Children, v23[v34].Children);
                    end;
                    v24(v27);
                    return;
                else
                    local v36 = {};
                    for v37, v38 in v26 do
                        v36[v38.Id] = {};
                        for v39, v40 in v38.Children do
                            if v40.Value ~= v23[v37].Children[v39].Value then
                                v36[v38.Id][v40.DataId or v40.Id] = v40.Value;
                            end;
                        end;
                    end;
                    v24(v36);
                    return;
                end;
            end, 
            OnExpansionChange = v21, 
            Renderers = v7, 
            Size = UDim2.fromScale(1, 1)
        }), 
        ProgressDialog = if v25 then v1.createElement(v6, v25) else nil
    });
end;