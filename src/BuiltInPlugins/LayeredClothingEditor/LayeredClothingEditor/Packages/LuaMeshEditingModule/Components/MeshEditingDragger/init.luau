local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.DraggerFramework);
local l_DraggerToolComponent_0 = v3.DraggerTools.DraggerToolComponent;
local l_MoveHandles_0 = v3.Handles.MoveHandles;
local l_RotateHandles_0 = v3.Handles.RotateHandles;
local l_ExtrudeHandles_0 = v3.Handles.ExtrudeHandles;
local v8 = require(l_Parent_0.DraggerSchema.DraggerSchema);
local v9 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v10 = v2.PureComponent:extend("MeshEditingDragger");
v10.render = function(v11) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_MoveHandles_0 (copy), v8 (copy), l_ExtrudeHandles_0 (copy), l_RotateHandles_0 (copy), v9 (copy), v2 (copy), l_DraggerToolComponent_0 (copy)
    local l_props_0 = v11.props;
    local l_Mouse_0 = l_props_0.Mouse;
    local l_DraggerType_0 = l_props_0.DraggerType;
    local l_Context_0 = l_props_0.Context;
    local v16 = {};
    if l_DraggerType_0 == Enum.RibbonTool.Move then
        table.insert(v16, l_MoveHandles_0.new(l_Context_0, nil, v8.TransformHandlesImplementation.new(l_Context_0)));
    elseif l_DraggerType_0 == Enum.RibbonTool.Scale then
        table.insert(v16, l_ExtrudeHandles_0.new(l_Context_0, nil, v8.ExtrudeHandlesImplementation.new(l_Context_0)));
    elseif l_DraggerType_0 == Enum.RibbonTool.Rotate then
        table.insert(v16, l_RotateHandles_0.new(l_Context_0, nil, v8.TransformHandlesImplementation.new(l_Context_0)));
    end;
    local v17 = "NoDragger";
    if l_DraggerType_0 then
        v17 = l_DraggerType_0.Name;
    end;
    local v18 = {
        AnalyticsName = if v9() then v17 else l_DraggerType_0.Name, 
        AllowDragSelect = true, 
        AllowFreeformDrag = v9() and l_DraggerType_0 == nil, 
        HandlesList = v16
    };
    return v2.createElement(l_DraggerToolComponent_0, {
        Mouse = l_Mouse_0, 
        DraggerContext = l_Context_0, 
        DraggerSchema = v8, 
        DraggerSettings = v18
    });
end;
return v10;