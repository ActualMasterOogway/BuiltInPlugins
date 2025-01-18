local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useGizmos);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useNote);
local v9 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Brush);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Placement);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Plane);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Region);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Note);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local l_Pane_0 = v3.UI.Pane;
local l_Gizmo_0 = require(l_script_FirstAncestor_0.Src.Types).Gizmo;
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorNoActivate);
local v20 = {
    [l_Gizmo_0.Brush] = v9, 
    [l_Gizmo_0.Placement] = if v18() then v10 else nil, 
    [l_Gizmo_0.Plane] = v11, 
    [l_Gizmo_0.Region] = v12
};
return function(v21) --[[ Line: 44 ]]
    -- upvalues: v15 (copy), v14 (copy), l_useState_0 (copy), v19 (copy), v7 (copy), v8 (copy), v6 (copy), l_useEffect_0 (copy), v2 (copy), l_Pane_0 (copy), v20 (copy), v1 (copy), l_Gizmo_0 (copy), v13 (copy)
    local v22 = v15:use();
    local v23 = v14:use();
    local v24, v25 = l_useState_0(not v19() or false);
    local v26, v27, v28, v29 = v7(v22, v24);
    local v30 = v8(v22, v24);
    v6(v23.Activation, v25, {});
    if v19() then
        local v31 = v22:getToolIndex();
        local l_v31_0 = v31 --[[ copy: 10 -> 17 ]];
        l_useEffect_0(function() --[[ Line: 56 ]]
            -- upvalues: v24 (copy), l_v31_0 (copy), v23 (copy), v25 (copy)
            if v24 and l_v31_0 ~= -1 then
                v23:enable();
                v25(true);
                return;
            else
                v23:disable();
                return;
            end;
        end, {
            v31, 
            v24
        });
    else
        l_useEffect_0(function() --[[ Line: 68 ]]
            -- upvalues: v24 (copy), v23 (copy), v25 (copy)
            if v24 then
                v23:enable();
                v25(true);
                return;
            else
                v23:disable();
                return;
            end;
        end, {
            v28, 
            v24, 
            v26
        });
    end;
    if not v24 then
        return v2.createElement(l_Pane_0, v21, {});
    else
        local v33 = {};
        for _, v35 in v26 do
            local v36 = v20[v35.Schema.Type];
            if not v36 then
                error((("No renderer found for gizmo schema %*"):format(v35.Schema.Type)));
            end;
            v33[v35.Id] = v2.createElement(v36, v1.join(v35, {
                Tool = v28._name, 
                FromSelf = v29, 
                Save = function(v37) --[[ Line: 100 ]] --[[ Name: Save ]]
                    -- upvalues: v26 (copy), v27 (copy)
                    local v38 = {};
                    local v39 = {};
                    for v40, v41 in v26 do
                        v38[v40] = table.clone(v41);
                        for v42, v43 in v37 do
                            v39[v42] = {};
                            for v44, v45 in v43 do
                                if v41.Value[v42][v44] ~= v45 then
                                    v39[v42][v44] = v45;
                                end;
                                v38[v40].Value[v42][v44] = v45;
                            end;
                        end;
                    end;
                    v27(v38, v37);
                end
            }));
        end;
        if v30 then
            v33[l_Gizmo_0.Note] = v2.createElement(v13, {
                Key = v30
            });
        end;
        return v2.createElement(l_Pane_0, v21, v33);
    end;
end;