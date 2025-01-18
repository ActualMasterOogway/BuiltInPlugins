return {
    Attachment = {
        Attachments = 1
    }, 
    WeldConstraint = {
        Attachments = 2
    }, 
    HingeConstraint = {
        Attachments = 2
    }, 
    BallSocketConstraint = {
        Attachments = 2
    }, 
    RigidConstraint = {
        Attachments = 2
    }, 
    PrismaticConstraint = {
        Attachments = 2
    }, 
    CylindricalConstraint = {
        Attachments = 2
    }, 
    UniversalConstraint = {
        Attachments = 2
    }, 
    PlaneConstraint = {
        Attachments = 2
    }, 
    RopeConstraint = {
        Attachments = 2, 
        IgnoreSamePartCheck = true
    }, 
    RodConstraint = {
        Attachments = 2
    }, 
    SpringConstraint = {
        Attachments = 2, 
        Properties = {
            Stiffness = 1000, 
            Damping = 2
        }, 
        IgnoreSamePartCheck = true
    }, 
    TorsionSpringConstraint = {
        Attachments = 2, 
        Properties = {
            Stiffness = 1000, 
            Damping = 2
        }
    }, 
    NoCollisionConstraint = {
        Attachments = 2
    }, 
    AlignOrientation = {
        Attachments = 2, 
        Properties = {
            MaxTorque = 20000
        }
    }, 
    AlignPosition = {
        Attachments = 2
    }, 
    LineForce = {
        Attachments = 2
    }, 
    VectorForce = {
        Attachments = 1
    }, 
    Torque = {
        Attachments = 1, 
        Properties = {
            Torque = Vector3.new(2000, 0, 0, 0)
        }
    }, 
    AngularVelocity = {
        Attachments = 1, 
        Properties = {
            AngularVelocity = Vector3.new(0, 1, 0, 0), 
            MaxTorque = 20000
        }
    }, 
    LinearVelocity = {
        Attachments = 1, 
        Properties = {
            MaxForce = 10000, 
            VectorVelocity = Vector3.new(0, 1, 0, 0)
        }
    }
};