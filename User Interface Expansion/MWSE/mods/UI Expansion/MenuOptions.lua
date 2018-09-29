
local function onCreatedMenuOptions(e)
	-- Only interested in menu creation, not updates
	if (not e.newlyCreated) then
		return
	end

	local mainMenu = e.element
	
	local newButton = mainMenu:findChild(tes3ui.registerID("MenuOptions_New_container"))
	local loadButton = mainMenu:findChild(tes3ui.registerID("MenuOptions_Load_container"))
	local optionsButton = mainMenu:findChild(tes3ui.registerID("MenuOptions_Options_container"))
	local creditsButton = mainMenu:findChild(tes3ui.registerID("MenuOptions_Credits_container"))
	local exitButton = mainMenu:findChild(tes3ui.registerID("MenuOptions_Exit_container"))

	newButton.width = newButton.children[1].texture.width
	loadButton.width = loadButton.children[1].texture.width
	optionsButton.width = optionsButton.children[1].texture.width
	creditsButton.width = creditsButton.children[1].texture.width
	exitButton.width = exitButton.children[1].texture.width

	mainMenu.autoWidth = true

	mainMenu:updateLayout()
end
event.register("uiActivated", onCreatedMenuOptions, { filter = "MenuOptions" })
