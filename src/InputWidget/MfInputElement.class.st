Class {
	#name : #MfInputElement,
	#superclass : #BlElement,
	#instVars : [
		'inputValue',
		'value'
	],
	#category : #InputWidget
}

{ #category : #'visual properties' }
MfInputElement >> backgroundPaint [ 
	
	^ Color black
]

{ #category : #'as yet unclassified' }
MfInputElement >> decreaseInput [

value > 0 ifTrue: [ 
	value:= value -1.
 ].
inputValue removeFromParent .
inputValue:= self initializeInputValue: value asString.


]

{ #category : #'as yet unclassified' }
MfInputElement >> increaseInput [ 

value := value + 1.
inputValue removeFromParent .
inputValue:= self initializeInputValue: value asString.

]

{ #category : #initialization }
MfInputElement >> initialize [ 

super initialize .
self size: self inputExtent .
self background: self backgroundPaint .
self geometry: BlRectangle new.
self layout: BlFrameLayout new.
self initializePlus.
self initializeMinus.
inputValue:= self initializeInputValue. 
value := inputValue text asString asNumber .
self initializeInputText .






]

{ #category : #initialization }
MfInputElement >> initializeInputText [

| inputtext |

inputtext := MfInputText new.
self addChild: inputtext.

^inputtext 
]

{ #category : #initialization }
MfInputElement >> initializeInputValue [

| ivalue|
ivalue := MfInputValue new.
ivalue  text: '20' asRopedText .
ivalue text attributes:  { (BlTextForegroundAttribute paint: Color white)}.
ivalue text fontSize: 30.
self addChild: ivalue.

^ivalue
]

{ #category : #initialization }
MfInputElement >> initializeInputValue: aValue [

| ivalue|
ivalue := MfInputValue new.
ivalue  text: aValue asRopedText .
ivalue text attributes:  { (BlTextForegroundAttribute paint: Color white)}.
ivalue text fontSize: 30.
self addChild: ivalue.

^ivalue
]

{ #category : #initialization }
MfInputElement >> initializeMinus [
| minus |
minus := BlTextElement new
	text: ('-' asRopedText attributes:  { (BlTextForegroundAttribute paint: Color white)}).
minus text fontSize: 60.
minus constraintsDo: [ :c |
	c frame horizontal alignLeft .
	c frame vertical alignCenter ].
minus transformDo: [ :t |
	t translateBy: 10@0].
minus addEventHandlerOn: BlMouseDownEvent   do: [ :e | 
			self decreaseInput .
			 ].
self addChild: minus.

]

{ #category : #initialization }
MfInputElement >> initializePlus [
	| plus |
	
plus := BlTextElement new
	text: ('+' asRopedText attributes:  { (BlTextForegroundAttribute paint: Color white)}).
plus text fontSize: 40.
plus constraintsDo: [ :c |
	c frame horizontal alignRight .
	c frame vertical alignCenter ].
plus transformDo: [ :t |
	t translateBy: (-10)@0].
plus addEventHandlerOn: BlMouseDownEvent   do: [ :e | 
			self increaseInput .
			 ].
self addChild: plus.

   
]

{ #category : #'as yet unclassified' }
MfInputElement >> inputExtent [

	^ 300@120
]

{ #category : #'as yet unclassified' }
MfInputElement >> openInput: anInput [
	| space |
	space := BlSpace new.
	space root
		background: Color purple ;
		layout: BlFlowLayout horizontal.
	anInput transformDo: [ :c |
		c translateBy: 200@200
		 ].
	space root addChild: anInput  .
	space show.
	^ anInput 


]
