local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.Parent.Dash).assign(require(l_Parent_0.Util.createFolderDataLookup)(l_Parent_0.UI.Components:GetChildren()), {
    Button = {
        name = "Button", 
        story = l_Parent_0.UI.Components.DEPRECATED_Button:FindFirstChild("DEPRECATED_Button.story"), 
        style = l_Parent_0.UI.Components.DEPRECATED_Button:FindFirstChild("style"), 
        test = l_Parent_0.UI.Components.DEPRECATED_Button:FindFirstChild("test.spec")
    }
});