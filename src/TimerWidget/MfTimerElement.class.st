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

anim:= BlAnimation new
	duration: 1 seconds;
	loops: value.
self addEventHandlerOn:  BlMouseDownEvent do: [ :a |
	anim addEventHandler: (BlEventHandler on: BlAnimationLoopDoneEvent do: [ :e |
	self updateValue.
	self background: Color random.
	]).
 ].

self addAnimation: anim.
]

{ #category : #initialization }
MfTimerElement >> initialize [

super initialize .
self geometry: self defaultGeometry .
self border: self defaultBorder.
self size: 300@300.
self background: Color black.
self initAnimation .
timerValue:= self initializeTimerValue .
]

{ #category : #initialization }
MfTimerElement >> initializeTimerValue [ 

| tvalue|
tvalue := BlTextElement new.
tvalue text: value asString asRopedText .
tvalue text attributes:  { (BlTextForegroundAttribute paint: Color lightOrange )}.
tvalue text fontSize: 100.
tvalue constraintsDo: [ :c |
	c frame horizontal alignCenter.
	c frame vertical alignCenter  ].

self addChild: tvalue.

^tvalue
]

{ #category : #initialization }
MfTimerElement >> initializeTimerValue: aValue [
	| tvalue |
tvalue := MfInputValue new.
tvalue  text:  aValue asString asRopedText .
tvalue text attributes:  { (BlTextForegroundAttribute paint: Color lightOrange)}.
tvalue text fontSize: 100.
tvalue constraintsDo: [ :c |
	c frame horizontal alignCenter.
	c frame vertical alignCenter  ].

self addChild: tvalue.

^tvalue
]

{ #category : #skin }
MfTimerElement >> installRawStyle [ 

	super installRawStyle .
]

{ #category : #'instance creation' }
MfTimerElement >> newRawSkin [ 

^ MfTimerElementSkin new.
]

{ #category : #'as yet unclassified' }
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

{ #category : #protocol }
MfTimerElement >> updateValue [

value := value - 1.
timerValue removeFromParent .
timerValue:= self initializeTimerValue: value.

]

{ #category : #evaluating }
MfTimerElement >> value [ 
		^value.
]

{ #category : #accessing }
MfTimerElement >> value: aValue [

value:= aValue.
]
