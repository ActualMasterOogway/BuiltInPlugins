local v0 = require(script.Parent.ComponentLifecyclePhase);
return {
    [v0.WillUpdate] = "setState cannot be used in the willUpdate lifecycle method.\nConsider using the didUpdate method instead, or using getDerivedStateFromProps.\n\nCheck the definition of willUpdate in the component %q.", 
    [v0.WillUnmount] = "setState cannot be used in the willUnmount lifecycle method.\nA component that is being unmounted cannot be updated!\n\nCheck the definition of willUnmount in the component %q.", 
    [v0.ShouldUpdate] = "setState cannot be used in the shouldUpdate lifecycle method.\nshouldUpdate must be a pure function that only depends on props and state.\n\nCheck the definition of shouldUpdate in the component %q.", 
    [v0.Render] = "setState cannot be used in the render method.\nrender must be a pure function that only depends on props and state.\n\nCheck the definition of render in the component %q.", 
    default = "setState can not be used in the current situation, because Roact doesn't know\nwhich part of the lifecycle this component is in.\n\nThis is a bug in Roact.\nIt was triggered by the component %q.\n"
};