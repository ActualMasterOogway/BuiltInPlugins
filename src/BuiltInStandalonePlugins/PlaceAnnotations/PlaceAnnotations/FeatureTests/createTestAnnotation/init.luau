return function(v0) --[[ Line: 1 ]]
    if not game.CoreGui:FindFirstChild("PlaceAnnotations") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "PlaceAnnotations";
        l_Folder_0.Parent = game.CoreGui;
    end;
    local l_Part_0 = Instance.new("Part");
    local l_WorkspaceAnnotation_0 = Instance.new("WorkspaceAnnotation");
    l_WorkspaceAnnotation_0.AuthorId = 123456789;
    l_WorkspaceAnnotation_0.CreationTimeUnix = DateTime.now().UnixTimestamp;
    l_WorkspaceAnnotation_0.LastModifiedTimeUnix = l_WorkspaceAnnotation_0.CreationTimeUnix;
    l_WorkspaceAnnotation_0.Adornee = l_Part_0;
    if v0 then
        l_WorkspaceAnnotation_0.Contents = v0;
    end;
    return l_WorkspaceAnnotation_0;
end;