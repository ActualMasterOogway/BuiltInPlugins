local v0 = require(script.Parent.Symbol);
return (require(script.Parent.strict)({
    Init = v0.named("init"), 
    Render = v0.named("render"), 
    ShouldUpdate = v0.named("shouldUpdate"), 
    WillUpdate = v0.named("willUpdate"), 
    DidMount = v0.named("didMount"), 
    DidUpdate = v0.named("didUpdate"), 
    WillUnmount = v0.named("willUnmount"), 
    ReconcileChildren = v0.named("reconcileChildren"), 
    Idle = v0.named("idle")
}, "ComponentLifecyclePhase"));