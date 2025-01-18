local markdown = [==[
<TutorialInfo
  title="Creating Laser Beams"
  summary="Create a laser beam special effect that sets the player's health to zero on collision."
  difficulty="Intermediate"
/>

<TutorialHome>

# Creating Laser Beams

![header-image-or-video](rbxassetid://0000000)

This tutorial shows you how to create a laser beam special effect with an optional script to set the player's health to zero on collision.

### Topics

Setting up an invisible collision box that detects when a player collides with the laser beam.

Configuring attachments that represent the reach of the laser beam's emission.

Customizing a beam that emulates the visual characteristics of a futuristic laser beam.

Scripting behavior for the collision box that damages the player's character.

<ActionButton action="select" target="Workspace.LaserBeamBlaster">![explore-icon](rbxassetid://00000) Explore the Workspace</ActionButton>

<ActionButton action="playtest">![play-icon](rbxassetid://00000) Playtest the demo</ActionButton>

</TutorialHome>

<TutorialSection
  title="Add the Model from the Project Files"
>
## Add the Model from the Project Files

![header-image](rbxassetid://0000000)

Let's get the laser blaster model we'll be using today into our Workspace to get started.

### Steps

<Step
  type="instanceSelect"
  instance="ReplicatedStorage.TutorialFiles.LaserBeamBlaster"
>
Find the <ActionButton action="highlight" target="ReplicatedStorage.TutorialFiles.LaserBeamBlaster">![model-icon](rbxassetid://00000) Laser Beam Blaster</ActionButton> in your <ActionButton action="highlight" target="ReplicatedStorage.TutorialFiles">![folder-icon](rbxassetid://00000) project files</ActionButton>.
</Step>

<Step
  type="insertInstance"
  prefab="ReplicatedStorage.TutorialFiles.LaserBeamBlaster"
  target-parent="Workspace"
>
Drag the <ActionButton action="highlight" target="ReplicatedStorage.TutorialFiles.LaserBeamBlaster">![model-icon](rbxassetid://00000) Laser Beam Blaster</ActionButton> into <ActionButton action="highlight" target="Workspace">![worldmodel-icon](rbxassetid://00000) Workspace</ActionButton>.
</Step>


[Read more on Docs](create.roblox.com)
</TutorialSection>

<TutorialSection
  title="Create a Script inside the Laser Beam Blaster"
>

## Create a Script inside the Laser Beam Blaster

![header-image](rbxassetid://0000000)

We're going to need a Script in order to make this laser actually work.

### Steps

<Step
  type="insertInstance"
  class-name="Script"
  target-parent="Workspace.LaserBeamBlaster"
>
Create a new Script instance as a child of the <ActionButton action="highlight" target="Workspace.LaserBeamBlaster">![model-icon](rbxassetid://00000) Laser Beam Blaster</ActionButton> in Workspace.
</Step>

</TutorialSection>
]==]

local ast = {
	children = {
		{
			attributes = {
				difficulty = "Intermediate",
				summary = "Create a laser beam special effect that sets the player's health to zero on collision.",
				title = "Creating Laser Beams",
			},
			name = "TAG",
			offset = 1,
			text = "TutorialInfo",
		},
		{
			children = {
				{
					attributes = {
						depth = 1,
					},
					children = {
						{
							name = "TEXT",
							offset = 194,
							text = "Creating Laser Beams",
						},
					},
					isBlock = true,
					name = "HEADING",
					offset = 192,
				},
				{
					children = {
						{
							name = "IMAGE",
							offset = 217,
							text = "header-image-or-video",
							url = "rbxassetid://0000000",
						},
					},
					name = "PARAGRAPH",
					offset = 216,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 264,
							text = "This tutorial shows you how to create a laser beam special effect with an optional script to set the player's health to zero on collision.",
						},
					},
					name = "PARAGRAPH",
					offset = 264,
				},
				{
					attributes = {
						depth = 3,
					},
					children = {
						{
							name = "TEXT",
							offset = 408,
							text = "Topics",
						},
					},
					isBlock = true,
					name = "HEADING",
					offset = 404,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 416,
							text = "Setting up an invisible collision box that detects when a player collides with the laser beam.",
						},
					},
					name = "PARAGRAPH",
					offset = 416,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 512,
							text = "Configuring attachments that represent the reach of the laser beam's emission.",
						},
					},
					name = "PARAGRAPH",
					offset = 512,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 592,
							text = "Customizing a beam that emulates the visual characteristics of a futuristic laser beam.",
						},
					},
					name = "PARAGRAPH",
					offset = 592,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 681,
							text = "Scripting behavior for the collision box that damages the player's character.",
						},
					},
					name = "PARAGRAPH",
					offset = 681,
				},
				{
					attributes = {
						action = "select",
						target = "Workspace.LaserBeamBlaster",
					},
					children = {
						{
							children = {
								{
									name = "IMAGE",
									offset = 827,
									text = "explore-icon",
									url = "rbxassetid://00000",
								},
								{
									name = "TEXT",
									offset = 862,
									text = " Explore the Workspace",
								},
							},
							name = "PARAGRAPH",
							offset = 827,
						},
					},
					name = "TAG",
					offset = 761,
					text = "ActionButton",
				},
				{
					attributes = {
						action = "playtest",
					},
					children = {
						{
							children = {
								{
									name = "IMAGE",
									offset = 933,
									text = "play-icon",
									url = "rbxassetid://00000",
								},
								{
									name = "TEXT",
									offset = 965,
									text = " Playtest the demo",
								},
							},
							name = "PARAGRAPH",
							offset = 933,
						},
					},
					name = "TAG",
					offset = 901,
					text = "ActionButton",
				},
			},
			name = "TAG",
			offset = 177,
			text = "TutorialHome",
		},
		{
			attributes = {
				title = "Add the Model from the Project Files",
			},
			children = {
				{
					attributes = {
						depth = 2,
					},
					children = {
						{
							name = "TEXT",
							offset = 1085,
							text = "Add the Model from the Project Files",
						},
					},
					isBlock = true,
					name = "HEADING",
					offset = 1082,
				},
				{
					children = {
						{
							name = "IMAGE",
							offset = 1124,
							text = "header-image",
							url = "rbxassetid://0000000",
						},
					},
					name = "PARAGRAPH",
					offset = 1123,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 1162,
							text = "Let's get the laser blaster model we'll be using today into our Workspace to get started.",
						},
					},
					name = "PARAGRAPH",
					offset = 1162,
				},
				{
					attributes = {
						depth = 3,
					},
					children = {
						{
							name = "TEXT",
							offset = 1257,
							text = "Steps",
						},
					},
					isBlock = true,
					name = "HEADING",
					offset = 1253,
				},
				{
					attributes = {
						instance = "ReplicatedStorage.TutorialFiles.LaserBeamBlaster",
						type = "instanceSelect",
					},
					children = {
						{
							children = {
								{
									name = "TEXT",
									offset = 1358,
									text = "Find the ",
								},
							},
							name = "PARAGRAPH",
							offset = 1358,
						},
						{
							attributes = {
								action = "highlight",
								target = "ReplicatedStorage.TutorialFiles.LaserBeamBlaster",
							},
							children = {
								{
									children = {
										{
											name = "IMAGE",
											offset = 1459,
											text = "model-icon",
											url = "rbxassetid://00000",
										},
										{
											name = "TEXT",
											offset = 1492,
											text = " Laser Beam Blaster",
										},
									},
									name = "PARAGRAPH",
									offset = 1459,
								},
							},
							name = "TAG",
							offset = 1368,
							text = "ActionButton",
						},
						{
							children = {
								{
									name = "TEXT",
									offset = 1526,
									text = " in your ",
								},
							},
							name = "PARAGRAPH",
							offset = 1526,
						},
						{
							attributes = {
								action = "highlight",
								target = "ReplicatedStorage.TutorialFiles",
							},
							children = {
								{
									children = {
										{
											name = "IMAGE",
											offset = 1609,
											text = "folder-icon",
											url = "rbxassetid://00000",
										},
										{
											name = "TEXT",
											offset = 1643,
											text = " project files",
										},
									},
									name = "PARAGRAPH",
									offset = 1609,
								},
							},
							name = "TAG",
							offset = 1535,
							text = "ActionButton",
						},
						{
							children = {
								{
									name = "TEXT",
									offset = 1672,
									text = ".",
								},
							},
							name = "PARAGRAPH",
							offset = 1672,
						},
					},
					name = "TAG",
					offset = 1265,
					text = "Step",
				},
				{
					attributes = {
						prefab = "ReplicatedStorage.TutorialFiles.LaserBeamBlaster",
						["target-parent"] = "Workspace",
						type = "insertInstance",
					},
					children = {
						{
							children = {
								{
									name = "TEXT",
									offset = 1802,
									text = "Drag the ",
								},
							},
							name = "PARAGRAPH",
							offset = 1802,
						},
						{
							attributes = {
								action = "highlight",
								target = "ReplicatedStorage.TutorialFiles.LaserBeamBlaster",
							},
							children = {
								{
									children = {
										{
											name = "IMAGE",
											offset = 1903,
											text = "model-icon",
											url = "rbxassetid://00000",
										},
										{
											name = "TEXT",
											offset = 1936,
											text = " Laser Beam Blaster",
										},
									},
									name = "PARAGRAPH",
									offset = 1903,
								},
							},
							name = "TAG",
							offset = 1812,
							text = "ActionButton",
						},
						{
							children = {
								{
									name = "TEXT",
									offset = 1970,
									text = " into ",
								},
							},
							name = "PARAGRAPH",
							offset = 1970,
						},
						{
							attributes = {
								action = "highlight",
								target = "Workspace",
							},
							children = {
								{
									children = {
										{
											name = "IMAGE",
											offset = 2028,
											text = "worldmodel-icon",
											url = "rbxassetid://00000",
										},
										{
											name = "TEXT",
											offset = 2066,
											text = " Workspace",
										},
									},
									name = "PARAGRAPH",
									offset = 2028,
								},
							},
							name = "TAG",
							offset = 1976,
							text = "ActionButton",
						},
						{
							children = {
								{
									name = "TEXT",
									offset = 2091,
									text = ".",
								},
							},
							name = "PARAGRAPH",
							offset = 2091,
						},
					},
					name = "TAG",
					offset = 1683,
					text = "Step",
				},
				{
					children = {
						{
							name = "LINK",
							offset = 2103,
							text = "Read more on Docs",
							url = "create.roblox.com",
						},
					},
					name = "PARAGRAPH",
					offset = 2102,
				},
			},
			name = "TAG",
			offset = 1017,
			text = "TutorialSection",
		},
		{
			attributes = {
				title = "Create a Script inside the Laser Beam Blaster",
			},
			children = {
				{
					attributes = {
						depth = 2,
					},
					children = {
						{
							name = "TEXT",
							offset = 2240,
							text = "Create a Script inside the Laser Beam Blaster",
						},
					},
					isBlock = true,
					name = "HEADING",
					offset = 2237,
				},
				{
					children = {
						{
							name = "IMAGE",
							offset = 2288,
							text = "header-image",
							url = "rbxassetid://0000000",
						},
					},
					name = "PARAGRAPH",
					offset = 2287,
				},
				{
					children = {
						{
							name = "TEXT",
							offset = 2326,
							text = "We're going to need a Script in order to make this laser actually work.",
						},
					},
					name = "PARAGRAPH",
					offset = 2326,
				},
				{
					attributes = {
						depth = 3,
					},
					children = {
						{
							name = "TEXT",
							offset = 2403,
							text = "Steps",
						},
					},
					isBlock = true,
					name = "HEADING",
					offset = 2399,
				},
				{
					attributes = {
						["class-name"] = "Script",
						["target-parent"] = "Workspace.LaserBeamBlaster",
						type = "insertInstance",
					},
					children = {
						{
							children = {
								{
									name = "TEXT",
									offset = 2509,
									text = "Create a new Script instance as a child of the ",
								},
							},
							name = "PARAGRAPH",
							offset = 2509,
						},
						{
							attributes = {
								action = "highlight",
								target = "Workspace.LaserBeamBlaster",
							},
							children = {
								{
									children = {
										{
											name = "IMAGE",
											offset = 2626,
											text = "model-icon",
											url = "rbxassetid://00000",
										},
										{
											name = "TEXT",
											offset = 2659,
											text = " Laser Beam Blaster",
										},
									},
									name = "PARAGRAPH",
									offset = 2626,
								},
							},
							name = "TAG",
							offset = 2557,
							text = "ActionButton",
						},
						{
							children = {
								{
									name = "TEXT",
									offset = 2693,
									text = " in Workspace.",
								},
							},
							name = "PARAGRAPH",
							offset = 2693,
						},
					},
					name = "TAG",
					offset = 2411,
					text = "Step",
				},
			},
			name = "TAG",
			offset = 2162,
			text = "TutorialSection",
		},
	},
	name = "ROOT",
	offset = 1,
}

return {
	markdown = markdown,
	ast = ast,
}
