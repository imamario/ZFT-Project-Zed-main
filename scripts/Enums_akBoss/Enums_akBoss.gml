enum AKSTATE {
	
	INTRO, // walking to the middle
	CLAW, // attacking
	VULNERABLE, // vulnerable moment, claw retract
	HURTEN, // walking away to the left or right
	COOLDOWN, // time to reset to come back
	COMEBACK // Intro without being a cutscene that kills player movement
	
}