Class {
	#name : #MfPatternElementTest,
	#superclass : #TestCase,
	#category : #PatternWidget
}

{ #category : #'test-init' }
MfPatternElementTest >> testBarsAreInitializedCorrectlyInPattern [

	| pattern patternElem |
	"create a pattern to assign to the element" 
	pattern := MfPattern new name: 'Snare'.
	"Create the pattern element and give him the number of bars we want in "
	patternElem := MfPatternElement new
		               pattern: pattern;
		               min: 4;
		               max: 16;
		               nbbars: 16.
	"At creation all bars have no drum assigned"
	patternElem childrenDo: [ :e |
		self deny: e drum.
		self assert: e background paint color equals: Color white ].
	"Test if all 16 bars are added to the pattern element"
	self assert: patternElem children size equals: 16
]

{ #category : #tests }
MfPatternElementTest >> testDrumRemovedOnClick [

| pattern patternElem |
"Create the pattern element"
pattern:= MfPattern new name:'random'.
patternElem:= MfPatternElement new pattern: pattern; min: 4; max:16; nbbars:12 .
patternElem childrenDo: [ :e |
	BlSpace simulateClickOn: e. "proved by previous test, all drums attributes equals true"
	 ].
"Clicking a second time on all bars"
patternElem childrenDo: [ :e |
	BlSpace simulateClickOn: e.
		self assert: e drum equals: false "Now all bars have no drums, same as creation state"
	 ].

]

{ #category : #tests }
MfPatternElementTest >> testIfDrumAssignedOnClick [

| pattern patternElem |
" Create the pattern element"
pattern:= MfPattern new name:'random'.
patternElem:= MfPatternElement new pattern: pattern; min: 4; max:16; nbbars:12 .
"Simulate a click on all bars in the pattern"
patternElem childrenDo: [ :e |
	BlSpace simulateClickOn: e.
	self assert: e drum equals: true "Now all bars have a drum assigned"
	 ].


]

{ #category : #tests }
MfPatternElementTest >> testPatternIsEmptyIfNbBarsNotValid [

	| pattern patternE1 patternE2 |
	"Create two pattern elements with differents min/max bars allowed"
	pattern := MfPattern new name: 'random'.
	patternE1 := MfPatternElement new
		             pattern: pattern;
		             min: 4;
		             max: 12;
		             nbbars: 13.
	self assert: patternE1 nbOfBars equals: 0. "Bars not added to element, over the max"
	patternE2 := MfPatternElement new
		             pattern: pattern;
		             min: 8;
		             max: 16;
		             nbbars: 4.
	self assert: patternE2 nbOfBars equals: 0 "Bars not added to element, under the min"
]

{ #category : #tests }
MfPatternElementTest >> testSkinisInstalledCorrectly [

	| patElem |
	"create instance of input"
	patElem := MfPatternElement new.
	"input skin is nil"
	self assert: patElem background paint equals: nil.
	patElem openPattern: patElem. "Assign skin to input"
	"Now the input widget has background defined"
	self assert: patElem background paint color equals: Color red
]
