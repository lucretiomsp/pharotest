Class {
	#name : #MfTimerElement,
	#superclass : #ToElement,
	#instVars : [
		'anim',
		'timerValue'
	],
	#classVars : [
		'value'
	],
	#category : #TimerWidget
}

{ #category : #accessing }
MfTimerElement >> anim [
	
	^ anim.
]

{ #category : #'visual properties' }
MfTimerElement >> backgroundPaint [ 

	^ Color black.
]

{ #category : #initialization }
MfTimerElement >> defaultBorder [ 

^ BlBorder paint: Color lightOrange width:4 .
]

{ #category : #initialization }
MfTimerElement >> defaultGeometry [ 	

^BlCircleGeometry new matchExtent: self extent
]

{ #category : #initialization }
MfTimerElement >> initAnimation [

	anim := BlAnimation new
		        duration: 1 seconds;
		        loops: value.
	self addEventHandlerOn: BlMouseDownEvent do: [ :a |
		anim addEventHandler: (BlEventHandler
				 on: BlAnimationLoopDoneEvent
				 do: [ :e |
					 self updateValue.
					 self background: Color random ]) ].

	self addAnimation: anim
]

{ #category : #initialization }
MfTimerElement >> initialize [

	super initialize.
	self initAnimation.
   self initializeTimerValue.
]

{ #category : #initialization }
MfTimerElement >> initializeTimerValue [

	timerValue := BlTextElement new.
	timerValue text: value asString asRopedText.
	timerValue text fontSize: 100.
	timerValue text attributes:
		{ (BlTextForegroundAttribute paint: Color lightOrange ) }.
	timerValue constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	self addChild: timerValue
]

{ #category : #initialization }
MfTimerElement >> initializeTimerValue: aValue [

	timerValue := MfInputValueElement new.
	timerValue text: aValue asString asRopedText.
	timerValue text fontSize: 100.
	timerValue text attributes:
		{ (BlTextForegroundAttribute paint: Color lightOrange ) }.
	timerValue constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	self addChild: timerValue
]

{ #category : #skin }
MfTimerElement >> installRawStyle [ 

	super installRawStyle .
]

{ #category : #'instance creation' }
MfTimerElement >> newRawSkin [ 

^ MfTimerElementSkin new.
]

{ #category : #action }
MfTimerElement >> openTimer: aTimer [
	| space |
	
space:= BlSpace new.
aTimer defaultSkin: MfTimerElementSkin new.
space root
		layout: BlFlowLayout horizontal.
	aTimer transformDo: [ :c |
		c translateBy: 200@150
		 ].
	space root addChild: aTimer .
	space toTheme: MfTimerElementTheme new .
	space applyAllSkinInstallers .
	space show.
	^ aTimer .





]

{ #category : #accessing }
MfTimerElement >> timerValue [

^timerValue
]

{ #category : #protocol }
MfTimerElement >> updateValue [

	value := value - 1.
	timerValue removeFromParent.
	self initializeTimerValue: value
]

{ #category : #evaluating }
MfTimerElement >> value [ 
		^value.
]

{ #category : #accessing }
MfTimerElement >> value: aValue [

value:= aValue.
]
