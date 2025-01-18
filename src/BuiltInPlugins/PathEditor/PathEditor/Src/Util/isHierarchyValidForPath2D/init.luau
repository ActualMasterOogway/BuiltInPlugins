local _ = script.Parent.Parent.Parent;
local l_PathEditorHierarchyValidCheckFixes_0 = game:GetFastFlag("PathEditorHierarchyValidCheckFixes");
local v2 = game:DefineFastFlag("PathEditorPathEditorHierarchyFolderValid", false);
return function(v3) --[[ Line: 6 ]] --[[ Name: isHierarchyValidForPath2D ]]
    -- upvalues: v2 (copy), l_PathEditorHierarchyValidCheckFixes_0 (copy)
    if v3 == nil then
        return false;
    else
        local l_Parent_1 = v3.Parent;
        local v5 = true;
        while true do
            if l_Parent_1 ~= nil and not l_Parent_1:IsA("ScreenGui") and not l_Parent_1:IsA("SurfaceGui") then
                if v2 and not v5 then
                    if not l_Parent_1:IsA("GuiBase2d") and not l_Parent_1:IsA("Folder") then
                        return false;
                    end;
                elseif not l_Parent_1:IsA("GuiBase2d") then
                    return false;
                end;
                v5 = false;
                l_Parent_1 = l_Parent_1.Parent;
            elseif l_Parent_1 == nil then
                return false;
            else
                if l_Parent_1:IsA("ScreenGui") then
                    while l_Parent_1 ~= nil do
                        if l_Parent_1 == game.Workspace then
                            return false;
                        else
                            l_Parent_1 = l_Parent_1.Parent;
                        end;
                    end;
                elseif l_PathEditorHierarchyValidCheckFixes_0 and l_Parent_1:IsA("SurfaceGui") and l_Parent_1.Adornee == nil and not l_Parent_1.Parent:IsA("BasePart") then
                    return false;
                end;
                return true;
            end;
        end;
    end;
end;