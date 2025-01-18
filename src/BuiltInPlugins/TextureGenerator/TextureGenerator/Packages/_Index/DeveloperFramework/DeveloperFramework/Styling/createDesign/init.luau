return function(v0) --[[ Line: 1 ]] --[[ Name: createDesign ]]
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = v0 or "Design";
    l_Folder_0:SetAttribute("StyleCategory", "Design");
    local l_Folder_1 = Instance.new("Folder");
    l_Folder_1.Name = "Themes";
    l_Folder_1.Parent = l_Folder_0;
    l_Folder_1:SetAttribute("StyleCategory", "Themes");
    local l_StyleSheet_0 = Instance.new("StyleSheet");
    l_StyleSheet_0.Name = "Design";
    l_StyleSheet_0.Parent = l_Folder_0;
    local l_Folder_2 = Instance.new("Folder");
    l_Folder_2.Name = "Stories";
    l_Folder_2.Parent = l_Folder_0;
    return l_Folder_0;
end;